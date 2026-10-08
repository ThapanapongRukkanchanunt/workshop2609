"""Copy solver output into ../data.

Prefers out-<lv>-exact.json (exact.ts). Otherwise uses out-<lv>.json, replacing timed-out recipes with
out-<lv>-redo.json re-runs.

Usage: python3 merge.py <dir with the out-*.json files> 30 50 60
"""
import json
import shutil
import sys
from pathlib import Path

src = Path(sys.argv[1])
dst = Path(__file__).parent.parent / "data"
dst.mkdir(exist_ok=True)
for lv in sys.argv[2:]:
    exact = src / f"out-{lv}-exact.json"
    rows = json.loads((exact if exact.exists() else src / f"out-{lv}.json").read_text())
    redo = src / f"out-{lv}-redo.json"
    if redo.exists() and not exact.exists():
        by_name = {r["name"]: r for r in json.loads(redo.read_text())}
        rows = [by_name.get(r["name"], r) for r in rows]
    (dst / f"solve-lv{lv}.json").write_text(json.dumps(rows, ensure_ascii=False))
    left = [r["name"] for r in rows if not r["exhaustive"]]
    print(f"Lv {lv}: {len(rows)} recipes, still cut short: {left or 'none'}")
shutil.copy(src / "names.json", dst / "names.json")
