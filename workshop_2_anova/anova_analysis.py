"""
ANOVA analysis on CS111 midterm scores.
Usage: python anova_analysis.py [input_csv] [output_md]
Defaults: practice_anova.csv, anova_results.md
"""

import sys
import csv
import math
from pathlib import Path


def read_csv(path: str) -> dict[str, list[float]]:
    groups: dict[str, list[float]] = {}
    with open(path, newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            g = row["group"].strip()
            score = float(row["midterm_score"])
            groups.setdefault(g, []).append(score)
    return groups


def mean(values: list[float]) -> float:
    return sum(values) / len(values)


def variance(values: list[float]) -> float:
    m = mean(values)
    return sum((x - m) ** 2 for x in values) / (len(values) - 1)


def one_way_anova(groups: dict[str, list[float]]) -> dict:
    all_values = [v for vals in groups.values() for v in vals]
    grand_mean = mean(all_values)
    n_total = len(all_values)
    k = len(groups)

    ss_between = sum(
        len(vals) * (mean(vals) - grand_mean) ** 2
        for vals in groups.values()
    )
    ss_within = sum(
        (x - mean(vals)) ** 2
        for vals in groups.values()
        for x in vals
    )
    ss_total = ss_between + ss_within

    df_between = k - 1
    df_within = n_total - k
    df_total = n_total - 1

    ms_between = ss_between / df_between
    ms_within = ss_within / df_within
    f_stat = ms_between / ms_within

    # p-value via scipy if available, otherwise approximate
    try:
        from scipy import stats
        group_arrays = list(groups.values())
        _, p_value = stats.f_oneway(*group_arrays)
        levene_stat, levene_p = stats.levene(*group_arrays)
        shapiro_results = {
            g: stats.shapiro(vals) for g, vals in groups.items()
        }
    except ImportError:
        p_value = None
        levene_stat = None
        levene_p = None
        shapiro_results = None

    stats_per_group = {
        g: {
            "n": len(vals),
            "mean": mean(vals),
            "std": math.sqrt(variance(vals)),
            "min": min(vals),
            "max": max(vals),
        }
        for g, vals in groups.items()
    }

    return {
        "groups": groups,
        "stats_per_group": stats_per_group,
        "grand_mean": grand_mean,
        "n_total": n_total,
        "k": k,
        "ss_between": ss_between,
        "ss_within": ss_within,
        "ss_total": ss_total,
        "df_between": df_between,
        "df_within": df_within,
        "df_total": df_total,
        "ms_between": ms_between,
        "ms_within": ms_within,
        "f_stat": f_stat,
        "p_value": p_value,
        "levene_stat": levene_stat,
        "levene_p": levene_p,
        "shapiro_results": shapiro_results,
    }


def eta_squared(r: dict) -> float:
    return r["ss_between"] / r["ss_total"]


def render_markdown(r: dict, input_path: str) -> str:
    lines = []

    lines.append("# ANOVA Analysis — CS111 Midterm Scores")
    lines.append("")
    lines.append(f"**Input data:** `{input_path}`  ")
    lines.append(f"**Groups:** {r['k']}  ")
    lines.append(f"**Total observations:** {r['n_total']}  ")
    lines.append(f"**Grand mean:** {r['grand_mean']:.2f}")
    lines.append("")

    lines.append("## Descriptive Statistics")
    lines.append("")
    lines.append("| Group | n | Mean | Std Dev | Min | Max |")
    lines.append("|-------|---|------|---------|-----|-----|")
    for g, s in r["stats_per_group"].items():
        lines.append(
            f"| {g} | {s['n']} | {s['mean']:.2f} | {s['std']:.2f}"
            f" | {s['min']:.0f} | {s['max']:.0f} |"
        )
    lines.append("")

    lines.append("## One-Way ANOVA Table")
    lines.append("")
    lines.append("| Source | SS | df | MS | F |")
    lines.append("|--------|----|----|----|----|")
    lines.append(
        f"| Between groups | {r['ss_between']:.2f} | {r['df_between']}"
        f" | {r['ms_between']:.2f} | {r['f_stat']:.4f} |"
    )
    lines.append(
        f"| Within groups (error) | {r['ss_within']:.2f} | {r['df_within']}"
        f" | {r['ms_within']:.2f} | — |"
    )
    lines.append(
        f"| Total | {r['ss_total']:.2f} | {r['df_total']} | — | — |"
    )
    lines.append("")

    eta2 = eta_squared(r)
    lines.append("## Results")
    lines.append("")
    lines.append(f"- **F({r['df_between']}, {r['df_within']}) = {r['f_stat']:.4f}**")

    if r["p_value"] is not None:
        sig = "< 0.001" if r["p_value"] < 0.001 else f"= {r['p_value']:.4f}"
        lines.append(f"- **p {sig}**")
        conclusion = (
            "Statistically significant" if r["p_value"] < 0.05
            else "Not statistically significant"
        )
        lines.append(f"- **Conclusion:** {conclusion} at α = 0.05")
    else:
        lines.append("- **p-value:** scipy not available — install it for exact p-values")

    lines.append(f"- **η² (eta-squared) = {eta2:.4f}** — effect size")
    lines.append("")

    lines.append("### Effect Size Interpretation (η²)")
    lines.append("")
    if eta2 < 0.01:
        interpretation = "Negligible"
    elif eta2 < 0.06:
        interpretation = "Small"
    elif eta2 < 0.14:
        interpretation = "Medium"
    else:
        interpretation = "Large"
    lines.append(f"η² = {eta2:.4f} → **{interpretation} effect**")
    lines.append("")

    if r["levene_stat"] is not None:
        lines.append("## Assumption Checks")
        lines.append("")
        lines.append("### Homogeneity of Variance (Levene's test)")
        lines.append("")
        lev_sig = "< 0.001" if r["levene_p"] < 0.001 else f"= {r['levene_p']:.4f}"
        lev_ok = r["levene_p"] >= 0.05
        lines.append(
            f"- Levene's W = {r['levene_stat']:.4f}, p {lev_sig}  "
        )
        lines.append(
            f"- Assumption {'met ✓' if lev_ok else 'violated ✗'} (p {'≥' if lev_ok else '<'} 0.05)"
        )
        lines.append("")

        if r["shapiro_results"] is not None:
            lines.append("### Normality (Shapiro-Wilk test per group)")
            lines.append("")
            lines.append("| Group | W | p |")
            lines.append("|-------|---|---|")
            for g, res in r["shapiro_results"].items():
                sp = "< 0.001" if res.pvalue < 0.001 else f"{res.pvalue:.4f}"
                norm_ok = res.pvalue >= 0.05
                lines.append(
                    f"| {g} | {res.statistic:.4f} | {sp} "
                    f"({'✓' if norm_ok else '✗'}) |"
                )
            lines.append("")
            lines.append(
                "> **Note:** With small or non-normal samples, consider the "
                "Kruskal-Wallis test as a non-parametric alternative."
            )
            lines.append("")

    lines.append("## Interpretation")
    lines.append("")
    g_names = list(r["stats_per_group"].keys())
    g_stats = r["stats_per_group"]
    for g in g_names:
        lines.append(
            f"- **{g}**: n = {g_stats[g]['n']}, "
            f"mean = {g_stats[g]['mean']:.2f}, "
            f"SD = {g_stats[g]['std']:.2f}"
        )
    lines.append("")
    if r["p_value"] is not None and r["p_value"] < 0.05:
        lines.append(
            "The one-way ANOVA reveals a statistically significant difference "
            "in midterm scores between the groups. Students who practiced old "
            "exam papers (`practice`) scored meaningfully higher on average than "
            "those who did not (`non_practice`). The effect size (η²) indicates "
            f"a **{interpretation.lower()} practical effect**."
        )
    else:
        lines.append(
            "The one-way ANOVA does not find a statistically significant "
            "difference in midterm scores between the groups at α = 0.05."
        )

    return "\n".join(lines) + "\n"


def main():
    input_path = sys.argv[1] if len(sys.argv) > 1 else "practice_anova.csv"
    output_path = sys.argv[2] if len(sys.argv) > 2 else "anova_results.md"

    groups = read_csv(input_path)
    result = one_way_anova(groups)
    md = render_markdown(result, input_path)

    Path(output_path).write_text(md)
    print(f"Results saved to {output_path}")

    # Print summary to stdout
    r = result
    print(f"\nGroups: {list(groups.keys())}")
    for g, s in r["stats_per_group"].items():
        print(f"  {g}: n={s['n']}, mean={s['mean']:.2f}, sd={s['std']:.2f}")
    print(f"\nF({r['df_between']}, {r['df_within']}) = {r['f_stat']:.4f}")
    if r["p_value"] is not None:
        print(f"p = {r['p_value']:.6f}")
    print(f"η² = {eta_squared(r):.4f}")


if __name__ == "__main__":
    main()
