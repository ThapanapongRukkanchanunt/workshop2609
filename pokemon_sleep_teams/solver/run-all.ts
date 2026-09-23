import SolveController from '@src/controllers/solve/solve.controller.js';
import { RECIPES } from 'sleepapi-common';
import { writeFileSync } from 'fs';

const level = Number(process.argv[2] ?? 60);
const camp = process.argv[3] === 'camp';
const MAX_TEAMS = 60;
const c = new SolveController();
const out: any[] = [];
const r2 = (n: number) => Math.round(n * 100) / 100;
const only = process.env.ONLY ? new Set(process.env.ONLY.split(',')) : null;
for (const recipe of RECIPES) {
  if (only && !only.has(recipe.name)) continue;
  if (recipe.ingredients.length === 0) continue; // skip "Mixed" placeholder meals
  const t = Date.now();
  let res;
  try {
    res = c.solveRecipe(recipe.name, { settings: { camp, bedtime: '21:30', wakeup: '06:00', level, island: { name: 'Greengrass Isle', shortName: 'greengrass', areaBonus: 0, berries: [] } } } as any);
  } catch (e) { console.error(recipe.name, e); continue; }
  const sizes = res.teams.map((tm) => tm.members.length);
  const minSize = sizes.length ? Math.min(...sizes) : null;
  const teams = res.teams
    .filter((tm) => tm.members.length <= (minSize ?? 0) + 1)
    .sort((a, b) => a.members.length - b.members.length)
    .slice(0, MAX_TEAMS)
    .map((tm) => ({
      members: tm.members.map((m) => ({
        p: m.member.pokemonWithIngredients.pokemon.name,
        ing: m.member.pokemonWithIngredients.ingredientList.map((i) => [i.ingredient.name, i.amount])
      })),
      surplus: tm.surplus.relevant.map((i) => [i.ingredient.name, r2(i.amount)])
    }));
  out.push({
    name: recipe.name, displayName: recipe.displayName, type: recipe.type, bonus: recipe.bonus, value: recipe.value,
    ingredients: recipe.ingredients.map((i) => [i.ingredient.name, i.amount]),
    total: recipe.nrOfIngredients, minSize, exhaustive: res.exhaustive, solutionCount: res.teams.length,
    countBySize: sizes.reduce((acc: Record<number, number>, s) => ((acc[s] = (acc[s] ?? 0) + 1), acc), {}),
    teams
  });
  console.log(recipe.displayName, 'min', minSize, 'n', res.teams.length, Date.now() - t, 'ms');
}
writeFileSync(`out-${level}${camp ? "-camp" : ""}${only ? "-redo" : ""}.json`, JSON.stringify(out));
