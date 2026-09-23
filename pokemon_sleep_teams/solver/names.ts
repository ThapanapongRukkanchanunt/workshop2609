import { COMPLETE_POKEDEX, ingredient } from 'sleepapi-common';
const INGREDIENTS = ingredient.INGREDIENTS;
import { writeFileSync } from 'fs';
const p: Record<string, any> = {};
for (const x of COMPLETE_POKEDEX) p[x.name] = { d: x.displayName, n: x.pokedexNumber, s: x.specialty, sk: x.skill.name };
const i: Record<string, string> = {};
for (const x of INGREDIENTS) i[x.name] = x.longName;
writeFileSync('names.json', JSON.stringify({ pokemon: p, ingredients: i }));
console.log(Object.keys(p).length, Object.keys(i).length);
