// Exact minimum team size per recipe, using the same per-Pokémon production numbers as the SleepAPI solver.
//
// The SleepAPI set-cover search is greedy-ordered, so its smallest team depends on Pokédex order and can miss
// smaller teams. This script proves the true minimum: it branches on the recipe ingredient with the fewest producers
// (any valid team must contain one of them), prunes with an upper bound on what the remaining slots can still produce,
// and stops at the first team size that has a solution. Teams of that size are then enumerated (capped).
//
// Usage (from SleepAPI/backend, after run-all.ts): bun exact.ts <level>
// Reads out-<level>.json (+ out-<level>-redo.json), writes out-<level>-exact.json in the run-all.ts format.
import { calculateProductionAll } from '@src/services/solve/utils/solve-utils.js';
import {
  emptyIngredientInventoryFloat,
  getIsland,
  ingredientSetToIntFlat,
  MAX_POT_SIZE,
  parseTime,
  RECIPES
} from 'sleepapi-common';
import { existsSync, readFileSync, writeFileSync } from 'fs';

const level = Number(process.argv[2] ?? 60);
const MAX_SIZE = 5;
const MAX_TEAMS = 60; // teams of the minimum size kept for display
const COUNT_CAP = 5000; // stop counting distinct minimum teams beyond this

const bedtime = parseTime('21:30');
const wakeup = parseTime('06:00');
const settings = {
  camp: false,
  level,
  bedtime,
  wakeup,
  includeCooking: false,
  stockpiledIngredients: emptyIngredientInventoryFloat(),
  potSize: MAX_POT_SIZE,
  island: { ...getIsland('greengrass'), areaBonus: 0 }
} as any;

const { nonSupportProduction, supportProduction } = calculateProductionAll({
  settings,
  userMembers: [],
  userRecipes: { curries: [], desserts: [], salads: [] }
});
const producers = [...nonSupportProduction, ...supportProduction];
console.log(`Lv ${level}: ${producers.length} Pokémon setups`);

const solverRows: any[] = JSON.parse(readFileSync(`out-${level}.json`, 'utf8'));
const redoFile = `out-${level}-redo.json`;
if (existsSync(redoFile)) {
  const redo = new Map(JSON.parse(readFileSync(redoFile, 'utf8')).map((r: any) => [r.name, r]));
  for (let i = 0; i < solverRows.length; i++) solverRows[i] = redo.get(solverRows[i].name) ?? solverRows[i];
}
const solverByName = new Map(solverRows.map((r) => [r.name, r]));

const out: any[] = [];
for (const recipe of RECIPES) {
  if (recipe.ingredients.length === 0) continue;
  const t0 = Date.now();
  const flat = ingredientSetToIntFlat(recipe.ingredients);
  const idx = [...flat.keys()].filter((i) => flat[i] > 0);
  const need0 = idx.map((i) => flat[i]);
  const ingNameAt = new Map(
    recipe.ingredients.map((x) => [ingredientSetToIntFlat([x]).findIndex((v) => v > 0), x.ingredient.name])
  );

  // Only setups that make at least one recipe ingredient can be in a minimal team.
  const cand = producers
    .map((p, n) => ({ n, prod: idx.map((i) => p.totalIngredients[i]) }))
    .filter((c) => c.prod.some((v) => v > 0));
  const byIng = idx.map((_, k) => cand.filter((c) => c.prod[k] > 0).sort((a, b) => b.prod[k] - a.prod[k]));
  const maxProd = idx.map((_, k) => Math.max(0, ...cand.map((c) => c.prod[k])));
  const maxUseful = (need: number[]) => Math.max(0, ...cand.map((c) => c.prod.reduce((s, v, k) => s + Math.min(v, Math.max(0, need[k])), 0)));

  const feasibleMemo = new Map<string, boolean>();
  const canFinish = (need: number[], slots: number): boolean => {
    if (need.every((v) => v <= 0)) return true;
    if (slots === 0) return false;
    for (let k = 0; k < need.length; k++) if (need[k] > 0 && maxProd[k] * slots < need[k]) return false;
    const left = need.reduce((s, v) => s + Math.max(0, v), 0);
    if (maxUseful(need) * slots < left) return false;
    const key = slots + ':' + need.map((v) => Math.max(0, v)).join(',');
    const hit = feasibleMemo.get(key);
    if (hit !== undefined) return hit;
    let k0 = -1;
    for (let k = 0; k < need.length; k++) if (need[k] > 0 && (k0 < 0 || byIng[k].length < byIng[k0].length)) k0 = k;
    let ok = false;
    for (const c of byIng[k0]) {
      if (canFinish(need.map((v, k) => v - c.prod[k]), slots - 1)) { ok = true; break; }
    }
    feasibleMemo.set(key, ok);
    return ok;
  };

  let min: number | null = null;
  for (let s = 1; s <= MAX_SIZE; s++) if (canFinish(need0, s)) { min = s; break; }

  // Enumerate distinct teams of exactly `min` setups (as multisets of setup indices).
  const teams = new Map<string, number[]>();
  let capped = false;
  const walk = (need: number[], slots: number, chosen: number[]) => {
    if (capped) return;
    if (need.every((v) => v <= 0)) {
      const key = [...chosen].sort((a, b) => a - b).join(',');
      if (!teams.has(key)) { teams.set(key, chosen.slice()); if (teams.size >= COUNT_CAP) capped = true; }
      return;
    }
    if (!canFinish(need, slots)) return;
    let k0 = -1;
    for (let k = 0; k < need.length; k++) if (need[k] > 0 && (k0 < 0 || byIng[k].length < byIng[k0].length)) k0 = k;
    for (const c of byIng[k0]) walk(need.map((v, k) => v - c.prod[k]), slots - 1, [...chosen, c.n]);
  };
  if (min) walk(need0, min, []);

  const r2 = (n: number) => Math.round(n * 100) / 100;
  const margin = (team: number[]) => {
    const got = idx.map((i) => team.reduce((s, n) => s + producers[n].totalIngredients[i], 0));
    return Math.min(...got.map((g, k) => g / need0[k]));
  };
  const best = [...teams.values()].sort((a, b) => margin(b) - margin(a)).slice(0, MAX_TEAMS);
  const teamOut = best.map((team) => ({
    members: team.map((n) => ({
      p: producers[n].pokemonSet.pokemon,
      ing: producers[n].ingredientList.map((i) => [i.ingredient.name, i.amount])
    })),
    surplus: idx.map((i) => [ingNameAt.get(i), r2(team.reduce((s, n) => s + producers[n].totalIngredients[i], 0) - flat[i])])
  }));

  const solver = solverByName.get(recipe.name);
  const nextSize = (min ?? MAX_SIZE) + 1;
  const alternatives = (solver?.teams ?? []).filter((t: any) => t.members.length === nextSize);
  const countBySize: Record<number, number> = {};
  if (min) countBySize[min] = teams.size;
  if (solver?.countBySize?.[nextSize]) countBySize[nextSize] = solver.countBySize[nextSize];

  out.push({
    name: recipe.name, displayName: recipe.displayName, type: recipe.type, bonus: recipe.bonus, value: recipe.value,
    ingredients: recipe.ingredients.map((i) => [i.ingredient.name, i.amount]),
    total: recipe.nrOfIngredients, minSize: min, exhaustive: true, countCapped: capped,
    solverMinSize: solver?.minSize ?? null, solutionCount: teams.size,
    countBySize, teams: [...teamOut, ...alternatives]
  });
  const flag = solver && solver.minSize !== min ? `  (solver said ${solver.minSize})` : '';
  console.log(`${recipe.displayName}: min ${min}, ${teams.size}${capped ? '+' : ''} teams, ${Date.now() - t0} ms${flag}`);
}
writeFileSync(`out-${level}-exact.json`, JSON.stringify(out));
