"""Embed precomputed solver results into index.html.

Usage: python3 build.py
Reads data/solve-lv{30,50,60}.json + data/names.json, writes index.html from template.html.
"""
import json
from pathlib import Path

HERE = Path(__file__).parent
LEVELS = [30, 50, 60]
MAX_MIN_TEAMS = 24  # teams of the minimum size kept per recipe
MAX_NEXT_TEAMS = 8  # teams of size min+1 kept per recipe


def trim(recipe):
    m = recipe["minSize"]
    best = [t for t in recipe["teams"] if len(t["members"]) == m][:MAX_MIN_TEAMS]
    nxt = [t for t in recipe["teams"] if m is not None and len(t["members"]) == m + 1][:MAX_NEXT_TEAMS]
    return {
        "id": recipe["name"],
        "name": recipe["displayName"],
        "type": recipe["type"],
        "bonus": recipe["bonus"],
        "ing": recipe["ingredients"],
        "total": recipe["total"],
        "min": m,
        "exhaustive": recipe["exhaustive"],
        "bySize": recipe["countBySize"],
        "teams": [[[mem["p"], mem["ing"]] for mem in t["members"]] + [t["surplus"]] for t in best + nxt],
    }


def main():
    data = {"levels": {}, "names": json.loads((HERE / "data/names.json").read_text())}
    for lv in LEVELS:
        rows = json.loads((HERE / f"data/solve-lv{lv}.json").read_text())
        data["levels"][str(lv)] = [trim(r) for r in rows]
    payload = json.dumps(data, ensure_ascii=False, separators=(",", ":")).replace("</", "<\\/")
    html = (HERE / "template.html").read_text().replace("/*__DATA__*/null", payload)
    (HERE / "index.html").write_text(html)
    print(f"index.html: {len(html) / 1024:.0f} KB")


if __name__ == "__main__":
    main()
