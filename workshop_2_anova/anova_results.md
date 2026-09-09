# ANOVA Analysis — CS111 Midterm Scores

**Input data:** `practice_anova.csv`  
**Groups:** 2  
**Total observations:** 101  
**Grand mean:** 98.93

## Descriptive Statistics

| Group | n | Mean | Std Dev | Min | Max |
|-------|---|------|---------|-----|-----|
| non_practice | 27 | 29.56 | 41.19 | 0 | 211 |
| practice | 74 | 124.24 | 98.08 | 0 | 400 |

## One-Way ANOVA Table

| Source | SS | df | MS | F |
|--------|----|----|----|----|
| Between groups | 177362.23 | 1 | 177362.23 | 23.5254 |
| Within groups (error) | 746378.29 | 99 | 7539.17 | — |
| Total | 923740.51 | 100 | — | — |

## Results

- **F(1, 99) = 23.5254**
- **p < 0.001**
- **Conclusion:** Statistically significant at α = 0.05
- **η² (eta-squared) = 0.1920** — effect size

### Effect Size Interpretation (η²)

η² = 0.1920 → **Large effect**

## Assumption Checks

### Homogeneity of Variance (Levene's test)

- Levene's W = 24.9122, p < 0.001  
- Assumption violated ✗ (p < 0.05)

### Normality (Shapiro-Wilk test per group)

| Group | W | p |
|-------|---|---|
| non_practice | 0.5935 | < 0.001 (✗) |
| practice | 0.9134 | < 0.001 (✗) |

> **Note:** With small or non-normal samples, consider the Kruskal-Wallis test as a non-parametric alternative.

## Interpretation

- **non_practice**: n = 27, mean = 29.56, SD = 41.19
- **practice**: n = 74, mean = 124.24, SD = 98.08

The one-way ANOVA reveals a statistically significant difference in midterm scores between the groups. Students who practiced old exam papers (`practice`) scored meaningfully higher on average than those who did not (`non_practice`). The effect size (η²) indicates a **large practical effect**.
