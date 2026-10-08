# Pokémon Sleep Pot Planner

A static page (`index.html`, open it in any browser) that answers two questions for every Pokémon Sleep recipe:

1. **What is the fewest Pokémon that can make this recipe 3 times a day?**
2. **Which recipes can be cooked with only 2 Pokémon?**

Results are computed at Pokémon level 30, 50 and 60.

## Where the numbers come from

The page does not call any website at runtime. The results are precomputed with the team solver from
[SleepAPI / Neroli's Lab](https://github.com/SleepAPI/SleepAPI), the engine behind sleepapi.net and
nerolislab.com (release 2.71.0, commit `74e5068`, 2026-10-06, which adds Foongus and Amoonguss). Pokémon names link to [pks.raenonx.cc](https://pks.raenonx.cc)
so you can check each one.

The solver's rule for a team "covering" a recipe: the team's average daily ingredients, divided by 3 meals, must
reach every ingredient amount in the recipe. Each Pokémon uses the solver's ingredient build: Quiet nature,
Ingredient Finder M / Helping Speed M / Ingredient Finder S (as the level allows), max skill level, max
ribbon, sleep from 21:30 to 06:00, no camp ticket. Team sizes up to 5 are checked.

SleepAPI's own team search is greedy and can miss smaller teams, so `solver/exact.ts` re-checks every recipe
exhaustively against the same per-Pokémon production numbers. The minimum team size on the page is that exact
result. The solver's production numbers come from one seeded simulation of the whole Pokédex, so adding a Pokémon
can move other Pokémon's numbers by a fraction of an ingredient. Teams that were exactly on the edge can flip.

## Rebuilding the data

```bash
git clone --depth 1 https://github.com/SleepAPI/SleepAPI.git && cd SleepAPI
# Upstream lists Amoonguss as "inferior", so the solver would skip it; move it next to Abomasnow
python3 -c "import pathlib;p=pathlib.Path('common/src/types/pokemon/ingredient-pokemon.ts');s=p.read_text();p.write_text(s.replace('  FOONGUS,\n  AMOONGUSS,\n','  FOONGUS,\n').replace('  ABOMASNOW,\n','  ABOMASNOW,\n  AMOONGUSS,\n'))"
# Optional: let the solver run longer than its 10 s default
sed -i 's/  private timeout = 10000;/  private timeout = Number(process.env.SOLVE_TIMEOUT ?? 10000);/' backend/src/services/solve/set-cover.ts
(cd common && npm ci && npm run build) && (cd backend && bun install)
cp <this folder>/solver/*.ts backend/ && cd backend
bun names.ts
for lv in 30 50 60; do bun run-all.ts $lv; done          # SleepAPI solver: out-<lv>.json (about 8 min per level)
for lv in 30 50 60; do bun exact.ts $lv; done            # exact minimum: out-<lv>-exact.json (1-2 min per level)
python3 <this folder>/solver/merge.py . 30 50 60             # copies into data/
python3 <this folder>/build.py                               # writes index.html
```

For personal and educational use only.
