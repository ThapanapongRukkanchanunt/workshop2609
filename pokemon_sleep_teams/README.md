# Pokémon Sleep Pot Planner

A static page (`index.html`, open it in any browser) that answers two questions for every Pokémon Sleep recipe:

1. **What is the fewest Pokémon that can make this recipe 3 times a day?**
2. **Which recipes can be cooked with only 2 Pokémon?**

Results are computed at Pokémon level 30, 50 and 60.

## Where the numbers come from

The page does not call any website at runtime. The results are precomputed with the team solver from
[SleepAPI / Neroli's Lab](https://github.com/SleepAPI/SleepAPI), the engine behind sleepapi.net and
nerolislab.com (commit `9d7dab8`, 2026-09-15). Pokémon names link to [pks.raenonx.cc](https://pks.raenonx.cc)
so you can check each one.

The solver's rule for a team "covering" a recipe: the team's average daily ingredients, divided by 3 meals, must
reach every ingredient amount in the recipe. Each Pokémon uses the solver's ingredient build: Quiet nature,
Ingredient Finder M / Helping Speed M / Ingredient Finder S (as the level allows), max skill level, max
ribbon, sleep from 21:30 to 06:00, no camp ticket. The solver checks team sizes up to 5.

## Rebuilding the data

```bash
git clone --depth 1 https://github.com/SleepAPI/SleepAPI.git && cd SleepAPI
(cd common && npm ci && npm run build) && (cd backend && bun install)
# Optional: let the solver run longer than its 10 s default
sed -i 's/  private timeout = 10000;/  private timeout = Number(process.env.SOLVE_TIMEOUT ?? 10000);/' backend/src/services/solve/set-cover.ts
cp <this folder>/solver/*.ts backend/ && cd backend
bun names.ts
for lv in 30 50 60; do bun run-all.ts $lv; done          # writes out-<lv>.json (about 8 min per level)
# Re-run recipes that hit the time limit, e.g.:
SOLVE_TIMEOUT=120000 ONLY=CUT_SUKIYAKI_CURRY,CLODSIRE_ECLAIR bun run-all.ts 60   # writes out-60-redo.json
python3 <this folder>/solver/merge.py . 30 50 60             # copies into data/
python3 <this folder>/build.py                               # writes index.html
```

For personal and educational use only.
