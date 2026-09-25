# Pokémon GO — Best Raid Attackers by Attack Type

For each of the 18 attacking types, a Top 10 under a fixed tier quota:
**2 Mega/Primal · 1 Shadow Legendary · 2 Shadow · 3 Legendary · 2 non-Legendary**, sorted by score.

Compiled from [Pokémon GO Hub](https://db.pokemongohub.net/best/attackers-per-type) per-type tables,
cross-checked against [Pokebattler](https://www.pokebattler.com/raids/attackers/rankings).
See [`BOSS_TYPE_COUNTERS.md`](BOSS_TYPE_COUNTERS.md) for the reverse index by boss type.

## Method

1. An attacker qualifies for a type only if its **charged move** is of that type. The charged move carries
   raid damage, so a Pokémon with only an on-type *fast* move is not an attacker of that type —
   `Crowned Shield Zamazenta · Ice Fang / Behemoth Bash` is a Steel attacker, not an Ice one.
2. Rank the qualifying pool by Hub **Score** (a DPS and TDO blend) and take the best in each tier bracket.
3. **Legendary** covers the raid-exclusive pool: Legendary, Mythical and Ultra Beast.
4. Formes with identical stats count once (Keldeo Resolute absorbs Ordinary). Formes with different stats
   — Landorus Therian/Incarnate, Black/White Kyurem — are listed separately.
5. Where **no Pokémon qualifies** for a tier, the row says so and names the nearest miss. Fairy and Bug
   have no Shadow Legendary with a charged move of their type.

Move notation follows the source: `*` legacy/exclusive, `+` upgraded variant.

**Availability:** Shadow Legendaries rotate through Giovanni and Shadow Raids, so some entries are
"best on paper" rather than catchable this week.

---

## Fire

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Delphox** | Fire Spin / Mystical Fire+ | Mega / Primal | 37.51 | Hub’s #1 Fire attacker overall — 39.77 DPS. |
| 2 | **Mega Blaziken** | Fire Spin / Blast Burn | Mega / Primal | 32.67 | Doubles as a top Fighting mega — two raid types, one slot. |
| 3 | **Shadow Reshiram** | Fire Fang / Fusion Flare | Shadow Legendary | 32.13 | Pokebattler’s #1 Fire attacker outright (1193 pts). |
| 4 | **Blacephalon** | Incinerate / Mind Blown | Legendary | 31.74 | Ultra Beast — 35.45 DPS, paper-thin bulk. |
| 5 | **Shadow Chandelure** | Fire Spin / Overheat | Shadow | 27.76 | Glass, but the highest non-Legendary Shadow DPS. |
| 6 | **Reshiram** | Fire Fang / Fusion Flare | Legendary | 27.28 | Non-shadow version, far bulkier. |
| 7 | **Shadow Blaziken** | Fire Spin / Blast Burn | Shadow | 27.26 | Fighting coverage on the same build. |
| 8 | **Heatran** | Fire Spin / Magma Storm | Legendary | 24.24 | The durable pick — Steel typing survives. |
| 9 | **Volcarona** | Fire Spin / Overheat | Non-Legendary | 24.16 | Best non-Legendary non-Shadow Fire. |
| 10 | **Chandelure** | Fire Spin / Overheat | Non-Legendary | 23.83 | Cheap, plentiful, still ~26 DPS. |

## Water

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Greninja** | Water Shuriken / Surf+ | Mega / Primal | 34.20 | Hub #1. Pokebattler puts Primal Kyogre first. |
| 2 | **Primal Kyogre** | Waterfall / Origin Pulse | Mega / Primal | 33.07 | Best group boost, plus 1188 TDO. |
| 3 | **Shadow Kyogre** | Waterfall / Origin Pulse | Shadow Legendary | 28.74 | Top raw Water DPS you can bring six of. |
| 4 | **Shadow Greninja** | Water Shuriken / Hydro Cannon | Shadow | 25.11 |  |
| 5 | **Shadow Kingler** | Bubble / Crabhammer | Shadow | 24.97 | Nearly identical DPS, much cheaper. |
| 6 | **Kyogre** | Waterfall / Origin Pulse | Legendary | 24.59 |  |
| 7 | **Inteleon** | Water Gun / Hydro Cannon | Non-Legendary | 23.68 | Best non-Legendary starter-tier Water. |
| 8 | **Quaquaval** | Water Gun / Hydro Cannon | Non-Legendary | 22.98 |  |
| 9 | **Volcanion** | Water Gun / Hydro Pump | Legendary | 20.43 | Mythical, and bulky. |
| 10 | **Origin Forme Palkia** | Dragon Tail / Hydro Pump | Legendary | 19.48 | Dragon coverage on the same build. |

## Grass

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Chesnaught** | Vine Whip / Seed Bomb+ | Mega / Primal | 30.68 | Hub #1 on Score — huge 1255 TDO. |
| 2 | **Mega Sceptile** | Fury Cutter / Frenzy Plant | Mega / Primal | 30.11 | Pokebattler’s #1 — higher DPS, lower bulk. |
| 3 | **Kartana** | Razor Leaf / Leaf Blade | Legendary | 25.90 | Ultra Beast — highest non-Mega Grass DPS. |
| 4 | **Shadow Chesnaught** | Vine Whip / Frenzy Plant | Shadow | 24.82 |  |
| 5 | **Shaymin (Sky Forme)** | Magical Leaf / Grass Knot | Legendary | 24.58 |  |
| 6 | **Shadow Sceptile** | Fury Cutter / Frenzy Plant | Shadow | 24.21 | Shadow Tangrowth and Venusaur are within a hair. |
| 7 | **Zarude** | Vine Whip / Power Whip | Legendary | 23.74 | Mythical — best TDO of the three. |
| 8 | **Rillaboom** | Razor Leaf / Frenzy Plant | Non-Legendary | 23.11 |  |
| 9 | **Roserade** | Magical Leaf / Grass Knot | Non-Legendary | 21.71 | Poison coverage too. |
| 10 | **Shadow Groudon** | Mud Shot / Solar Beam | Shadow Legendary | 20.86 | Solar Beam is a Grass charged move; only the Mud Shot fast move is off-type. The sole Shadow Legendary option for Grass. |

## Electric

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Raichu Y** | Thunder Shock / Zap Cannon+ | Mega / Primal | 34.25 | #1 on both sites. |
| 2 | **Mega Raichu X** | Thunder Shock / Volt Tackle+ | Mega / Primal | 31.46 | Mega Manectric (#9) is the budget stand-in. |
| 3 | **Shadow Thundurus (Therian Forme)** | Volt Switch / Wildbolt Storm | Shadow Legendary | 29.75 | From Giovanni’s Shadow Incarnate Thundurus (Jan 2026), forme-changed with the Reveal Glass. Shadow Raikou (26.99) is the easier runner-up. |
| 4 | **Zeraora** | Volt Switch / Plasma Fists | Legendary | 27.41 | Mythical. |
| 5 | **Regieleki** | Lock-On / Thunder Cage | Legendary | 27.39 | Highest burst, low TDO. |
| 6 | **Xurkitree** | Thunder Shock / Discharge | Legendary | 26.32 | Ultra Beast — 330 Attack. |
| 7 | **Shadow Electivire** | Thunder Shock / Wild Charge | Shadow | 26.15 |  |
| 8 | **Shadow Magnezone** | Volt Switch / Wild Charge | Shadow | 25.37 | Bulkier, and Steel typing. |
| 9 | **Electivire** | Thunder Shock / Wild Charge | Non-Legendary | 22.60 |  |
| 10 | **Magnezone** | Volt Switch / Wild Charge | Non-Legendary | 21.69 |  |

## Ice

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **White Kyurem** | Ice Fang / Ice Burn | Legendary | 34.89 | #1 Ice attacker overall — 38.30 DPS. |
| 2 | **Black Kyurem** | Dragon Tail / Freeze Shock | Legendary | 32.28 | Only the charged move is Ice — the fast move is off-type. |
| 3 | **Mega Mewtwo Y** | Psycho Cut / Ice Beam | Mega / Primal | 30.98 | Highest Ice output, but its mega aura is Psychic — it does not boost the lobby’s Ice damage. |
| 4 | **Mega Mewtwo X** | Psycho Cut / Ice Beam | Mega / Primal | 29.76 | Same caveat: no Ice aura. Mega Abomasnow (24.29) and Mega Glalie (23.82) are the dedicated Ice megas. |
| 5 | **Shadow Mamoswine** | Powder Snow / Avalanche | Shadow | 27.44 | #1 dedicated Ice shadow on both sites. |
| 6 | **Shadow Mewtwo** | Psycho Cut / Ice Beam | Shadow Legendary | 25.66 | Ice Beam off a 300-Attack body. Shadow Articuno (22.67) is the STAB alternative. |
| 7 | **Shadow Weavile** | Ice Shard / Triple Axel | Shadow | 24.74 | Fastest charge cycling. |
| 8 | **Baxcalibur** | Ice Fang / Avalanche | Non-Legendary | 24.63 |  |
| 9 | **Galarian Darmanitan** | Ice Fang / Avalanche | Non-Legendary | 23.86 | Glassy, but hits hard. |
| 10 | **Kyurem** | Dragon Breath / Glaciate | Legendary | 23.20 | Glaciate. Crowned Shield Zamazenta scores higher but its charged move is Steel, so it is not an Ice attacker. |

## Dragon

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Rayquaza** | Dragon Tail / Breaking Swipe | Mega / Primal | 36.18 | #1 on both sites by a landslide — 2294 pts. |
| 2 | **Eternatus** | Dragon Tail / Dynamax Cannon | Legendary | 36.13 | Essentially ties Mega Rayquaza on Hub’s score. |
| 3 | **Mega Dragonite** | Dragon Tail / Outrage+ | Mega / Primal | 34.39 | Mega Garchomp is a near-tie. |
| 4 | **Shadow Garchomp** | Dragon Tail / Breaking Swipe | Shadow | 29.41 |  |
| 5 | **Shadow Haxorus** | Dragon Tail / Breaking Swipe | Shadow | 28.99 | Higher DPS, lower TDO than Garchomp. |
| 6 | **Shadow Palkia** | Dragon Tail / Draco Meteor | Shadow Legendary | 28.32 | Shadow Dialga is the bulkier alternative. |
| 7 | **Origin Forme Palkia** | Dragon Tail / Spacial Rend | Legendary | 27.65 | Spacial Rend. Outranks both Kyurem fusions here — their charged moves are Ice, not Dragon. |
| 8 | **Baxcalibur** | Ice Fang / Glaive Rush | Non-Legendary | 27.40 | Best non-Legendary Dragon. |
| 9 | **Origin Forme Dialga** | Dragon Breath / Roar of Time | Legendary | 27.04 | Roar of Time; 786 TDO, the bulkiest Dragon option. |
| 10 | **Haxorus** | Dragon Tail / Breaking Swipe | Non-Legendary | 25.28 |  |

## Psychic

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo Y** | Psycho Cut / Future Sight+ | Mega / Primal | 48.86 | 51.88 DPS — the single highest number in the game. |
| 2 | **Mega Mewtwo X** | Confusion / Psystrike | Mega / Primal | 40.62 |  |
| 3 | **Shadow Mewtwo** | Psycho Cut / Psystrike | Shadow Legendary | 34.85 |  |
| 4 | **Mewtwo** | Psycho Cut / Psystrike | Legendary | 29.70 |  |
| 5 | **Deoxys (Normal Forme)** | Zen Headbutt / Psycho Boost | Legendary | 29.25 | 36.15 DPS, 360 TDO — dies instantly. |
| 6 | **Shadow Metagross** | Zen Headbutt / Psychic | Shadow | 27.19 | Steel typing means it survives. |
| 7 | **Hoopa Unbound** | Confusion / Psychic | Legendary | 26.87 | Replaces Dusk Mane Necrozma, whose Sunsteel Strike is a Steel move. |
| 8 | **Shadow Alakazam** | Confusion / Psychic | Shadow | 25.92 | Pure glass cannon. |
| 9 | **Metagross** | Zen Headbutt / Psychic | Non-Legendary | 22.99 |  |
| 10 | **Espeon** | Confusion / Psychic | Non-Legendary | 22.77 |  |

## Ghost

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Dawn Wings Necrozma** | Psycho Cut / Moongeist Beam | Legendary | 32.66 | #1 Ghost on both sites. |
| 2 | **Mega Gengar** | Lick / Shadow Ball | Mega / Primal | 31.54 |  |
| 3 | **Mega Mewtwo Y** | Psycho Cut / Shadow Ball | Mega / Primal | 30.96 | Better TDO than Gengar. |
| 4 | **Shadow Darkrai** | Snarl / Shadow Ball | Shadow Legendary | 28.97 | Dark and Ghost in one build. |
| 5 | **Shadow Chandelure** | Hex / Shadow Ball | Shadow | 27.22 |  |
| 6 | **Lunala** | Shadow Claw / Shadow Ball | Legendary | 25.18 | 770 TDO. |
| 7 | **Darkrai** | Snarl / Shadow Ball | Legendary | 24.66 | Snarl / Shadow Ball — doubles as your best non-Shadow Dark attacker. |
| 8 | **Shadow Gengar** | Lick / Shadow Ball | Shadow | 24.39 |  |
| 9 | **Gholdengo** | Hex / Shadow Ball | Non-Legendary | 23.84 | Best non-Legendary Ghost. |
| 10 | **Dragapult** | Astonish / Shadow Ball | Non-Legendary | 23.83 |  |

## Dark

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Houndoom** | Snarl / Dark Pulse+ | Mega / Primal | 35.33 | Hub #1 — 37.93 DPS. |
| 2 | **Shadow Darkrai** | Snarl / Foul Play | Shadow Legendary | 30.99 |  |
| 3 | **Mega Tyranitar** | Bite / Brutal Swing | Mega / Primal | 30.49 | Pokebattler’s #1 — 1370 TDO makes it the practical choice. |
| 4 | **Shadow Hydreigon** | Bite / Brutal Swing | Shadow | 29.41 |  |
| 5 | **Shadow Tyranitar** | Bite / Brutal Swing | Shadow | 29.21 |  |
| 6 | **Darkrai** | Snarl / Foul Play | Legendary | 26.36 | Mythical. |
| 7 | **Hydreigon** | Bite / Brutal Swing | Non-Legendary | 24.84 |  |
| 8 | **Tyranitar** | Bite / Brutal Swing | Non-Legendary | 24.61 | Kingambit (#21) is a strong budget option. |
| 9 | **Hoopa Unbound** | Astonish / Dark Pulse | Legendary | 22.50 | Only the charged move is Dark — the fast move is off-type. |
| 10 | **Yveltal** | Snarl / Dark Pulse | Legendary | 22.47 | Best bulk of the three. |

## Fighting

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo X** | Counter / Dynamic Punch+ | Mega / Primal | 43.35 | 46.08 DPS, 1384 TDO — best attacker in the game on Hub’s score. |
| 2 | **Mega Lucario** | Force Palm / Aura Sphere | Mega / Primal | 36.79 | Steel typing survives Fighting-weak bosses. |
| 3 | **Keldeo (Resolute Forme)** | Low Kick / Secret Sword | Legendary | 31.89 | Mythical — 906 TDO. Ordinary Forme has identical stats, so it is not listed separately. |
| 4 | **Shadow Blaziken** | Counter / Aura Sphere | Shadow | 29.35 |  |
| 5 | **Shadow Conkeldurr** | Force Palm / Dynamic Punch | Shadow | 28.19 | Bulkier than Blaziken. |
| 6 | **Lucario** | Force Palm / Aura Sphere | Non-Legendary | 27.09 |  |
| 7 | **Terrakion** | Double Kick / Sacred Sword | Legendary | 26.89 | Rock coverage too. |
| 8 | **Blaziken** | Counter / Aura Sphere | Non-Legendary | 25.45 | Machamp (#37) remains the cheapest usable option. |
| 9 | **Shadow Mewtwo** | Counter / Focus Blast | Shadow Legendary | 25.43 | Shadow Raikou with Aura Sphere is the runner-up. |
| 10 | **Urshifu (Rapid Strike Style)** | Counter / Dynamic Punch | Legendary | 24.15 |  |

## Steel

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Crowned Sword Zacian** | Metal Claw / Behemoth Blade | Legendary | 36.19 | #1 Steel — 1416 TDO. |
| 2 | **Crowned Shield Zamazenta** | Metal Claw / Behemoth Bash | Legendary | 35.00 | 1443 TDO — tankiest attacker in the game. |
| 3 | **Dusk Mane Necrozma** | Metal Claw / Sunsteel Strike | Legendary | 34.53 |  |
| 4 | **Mega Lucario** | Force Palm / Meteor Mash | Mega / Primal | 30.43 | Only the charged move is Steel — the fast move is off-type. |
| 5 | **Shadow Metagross** | Bullet Punch / Meteor Mash | Shadow | 29.84 | Top non-Legendary Steel on both sites. |
| 6 | **Mega Metagross** | Bullet Punch / Meteor Mash | Mega / Primal | 29.82 | 1323 TDO. Mega Skarmory (#9) is the cheap alternative. |
| 7 | **Shadow Dialga** | Metal Claw / Iron Head | Shadow Legendary | 26.21 |  |
| 8 | **Metagross** | Bullet Punch / Meteor Mash | Non-Legendary | 25.16 | Still excellent value. |
| 9 | **Shadow Excadrill** | Metal Claw / Iron Head | Shadow | 24.06 |  |
| 10 | **Tinkaton** | Fairy Wind / Gigaton Hammer | Non-Legendary | 23.11 | Fairy coverage on the same build. |

## Ground

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Primal Groudon** | Mud Shot / Precipice Blades | Mega / Primal | 33.06 | #1 on both sites — covers Electric, Poison, Rock and Steel bosses, and adds Fire. |
| 2 | **Mega Garchomp** | Mud Shot / Earth Power | Mega / Primal | 30.13 |  |
| 3 | **Shadow Groudon** | Mud Shot / Precipice Blades | Shadow Legendary | 28.88 |  |
| 4 | **Shadow Garchomp** | Mud Shot / Earth Power | Shadow | 27.36 |  |
| 5 | **Landorus (Therian Forme)** | Mud Shot / Sandsear Storm | Legendary | 26.96 |  |
| 6 | **Shadow Excadrill** | Mud-Slap / Scorching Sands | Shadow | 26.51 | Highest Ground DPS among the cheap options. |
| 7 | **Groudon** | Mud Shot / Precipice Blades | Legendary | 24.67 |  |
| 8 | **Garchomp** | Mud Shot / Earth Power | Non-Legendary | 23.10 |  |
| 9 | **Excadrill** | Mud-Slap / Scorching Sands | Non-Legendary | 22.72 | Rhyperior (#20) is the bulk option. |
| 10 | **Landorus (Incarnate Forme)** | Mud Shot / Earth Power | Legendary | 22.43 |  |

## Rock

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Diancie** | Rock Throw / Rock Slide | Mega / Primal | 31.17 | #1 on both sites. |
| 2 | **Shadow Rhyperior** | Smack Down / Rock Wrecker | Shadow | 30.23 | #2 Rock overall — best all-round Rock attacker. |
| 3 | **Shadow Rampardos** | Smack Down / Rock Slide | Shadow | 28.91 | Highest Rock DPS in the game, but 420 TDO — dies fast. |
| 4 | **Mega Tyranitar** | Smack Down / Stone Edge | Mega / Primal | 28.75 | 1106 TDO. Mega Aerodactyl (#6) is cheaper. |
| 5 | **Rhyperior** | Smack Down / Rock Wrecker | Non-Legendary | 25.58 | The workhorse. |
| 6 | **Glimmora** | Rock Throw / Meteor Beam | Non-Legendary | 25.49 | Beats Rampardos on Score. |
| 7 | **Terrakion** | Smack Down / Rock Slide | Legendary | 24.00 | Fighting coverage. |
| 8 | **Shadow Landorus (Incarnate Forme)** | Rock Throw / Rock Slide | Shadow Legendary | 23.28 | Rock Throw and Rock Slide are both Rock — a legitimate pick, and the only Shadow Legendary with a Rock charged move. |
| 9 | **Black Kyurem** | Dragon Tail / Stone Edge | Legendary | 20.82 | Stone Edge with no STAB, but a 700-Attack body still out-damages Nihilego. Stakataka (19.74) is next in line. |
| 10 | **Nihilego** | Poison Jab / Rock Slide | Legendary | 20.47 | Ultra Beast — 644 TDO. |

## Fairy

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Gardevoir** | Charm / Dazzling Gleam | Mega / Primal | 29.96 | #1 on both sites by a wide margin. |
| 2 | **Crowned Sword Zacian** | Metal Claw / Play Rough | Legendary | 27.07 | 982 TDO. |
| 3 | **Shadow Gardevoir** | Charm / Dazzling Gleam | Shadow | 25.16 | Best Shadow Fairy on both sites. |
| 4 | **Enamorus (Incarnate Forme)** | Fairy Wind / Dazzling Gleam | Legendary | 24.89 |  |
| 5 | **Mega Alakazam** | Psycho Cut / Dazzling Gleam | Mega / Primal | 24.41 | Psychic aura, so no Fairy boost for the lobby — Mega Gardevoir at #1 covers that. Mega Gallade (#6) is bulkier. |
| 6 | **Tapu Lele** | Astonish / Nature's Madness | Legendary | 23.15 | Tapu Koko and Xerneas are within a point. |
| 7 | **Shadow Granbull** | Charm / Play Rough | Shadow | 22.33 | Cheap and genuinely usable. |
| 8 | **Gardevoir** | Charm / Dazzling Gleam | Non-Legendary | 21.48 |  |
| 9 | **Togekiss** | Charm / Dazzling Gleam | Non-Legendary | 21.20 | 680 TDO — the durable option. |
| — | *No Shadow Legendary qualifies* | — | Shadow Legendary | — | No Shadow Legendary has a Fairy charged move. Shadow Latias (Charm / Outrage) has the fast move only — its charged move is Dragon. |

## Flying

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Rayquaza** | Air Slash / Dragon Ascent | Mega / Primal | 45.92 | 48.24 DPS, 1693 TDO — the best single attacker listed anywhere here. |
| 2 | **Mega Skarmory** | Air Slash / Drill Peck+ | Mega / Primal | 34.04 |  |
| 3 | **Rayquaza** | Air Slash / Dragon Ascent | Legendary | 33.80 | Non-mega, still #3 on Hub. |
| 4 | **Shadow Moltres** | Wing Attack / Fly | Shadow Legendary | 33.09 | #3 Flying on both sites. |
| 5 | **Shadow Salamence** | Fire Fang / Fly | Shadow | 31.75 | Only the charged move is Flying — the fast move is off-type. |
| 6 | **Shadow Toucannon** | Peck / Beak Blast | Shadow | 30.81 | Surprisingly high DPS — 35.47. |
| 7 | **Enamorus (Incarnate Forme)** | Fairy Wind / Fly | Legendary | 29.44 | Only the charged move is Flying — the fast move is off-type. |
| 8 | **Yveltal** | Gust / Oblivion Wing | Legendary | 28.18 | 859 TDO. |
| 9 | **Salamence** | Fire Fang / Fly | Non-Legendary | 26.87 | Only the charged move is Flying — the fast move is off-type. |
| 10 | **Toucannon** | Peck / Beak Blast | Non-Legendary | 26.71 | Staraptor (#24) is the budget pick. |

## Poison

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Victreebel** | Acid / Acid Spray+ | Mega / Primal | 30.53 | Hub #1 — 33.02 DPS. |
| 2 | **Mega Gengar** | Lick / Sludge Bomb | Mega / Primal | 28.61 | Mega Beedrill is a close third. |
| 3 | **Eternatus** | Poison Jab / Sludge Bomb | Legendary | 27.71 | Pokebattler’s runaway #1 Poison. |
| 4 | **Shadow Overqwil** | Poison Jab / Sludge Bomb | Shadow | 25.11 | Best non-Legendary Poison on both sites. |
| 5 | **Nihilego** | Poison Jab / Sludge Bomb | Legendary | 24.64 | Ultra Beast — 843 TDO. |
| 6 | **Naganadel** | Poison Jab / Sludge Bomb | Legendary | 24.37 | Ultra Beast. |
| 7 | **Shadow Gengar** | Lick / Sludge Bomb | Shadow | 23.86 | Only the charged move is Poison — the fast move is off-type. |
| 8 | **Roserade** | Poison Jab / Sludge Bomb | Non-Legendary | 22.55 |  |
| 9 | **Shadow Darkrai** | Snarl / Sludge Bomb | Shadow Legendary | 22.32 | Off-type fast move, but still #10 overall. |
| 10 | **Overqwil** | Poison Jab / Sludge Bomb | Non-Legendary | 21.38 | Revavroom (#18) has the best bulk here. |

## Bug

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Mega Beedrill** | Bug Bite / Fell Stinger+ | Mega / Primal | 33.71 | 39.01 DPS — Hub #1. |
| 2 | **Mega Heracross** | Fury Cutter / Megahorn | Mega / Primal | 30.82 | Pokebattler’s #1 — 812 TDO. |
| 3 | **Shadow Vikavolt** | Bug Bite / X-Scissor | Shadow | 25.90 | Best Bug shadow on both sites. |
| 4 | **Shadow Scizor** | Fury Cutter / X-Scissor | Shadow | 25.04 | Steel typing helps it live. |
| 5 | **Volcarona** | Bug Bite / Bug Buzz | Non-Legendary | 24.31 | Best non-Legendary Bug. |
| 6 | **Kartana** | Fury Cutter / X-Scissor | Legendary | 23.06 | Ultra Beast — Grass coverage too. |
| 7 | **Genesect** | Fury Cutter / X-Scissor | Legendary | 22.81 | Mythical — 675 TDO. |
| 8 | **Pheromosa** | Bug Bite / Bug Buzz | Legendary | 22.35 | 28.24 DPS but only 257 TDO. |
| 9 | **Vikavolt** | Bug Bite / X-Scissor | Non-Legendary | 22.22 | Kleavor and Scizor are within a point. |
| — | *No Shadow Legendary qualifies* | — | Shadow Legendary | — | No Shadow Legendary has a Bug charged move. Shadow Heatran (Bug Bite / Magma Storm) has the fast move only — its charged move is Fire. |

## Normal

| # | Attacker | Moveset | Tier | Score | Notes |
|---|---|---|---|---|---|
| 1 | **Shadow Regigigas** | Zen Headbutt / Crush Grip | Shadow Legendary | 21.10 | #1 Normal attacker on both sites. |
| 2 | **Mega Mewtwo Y** | Confusion / Hyper Beam | Mega / Primal | 19.38 | Hyper Beam. No Normal mega aura worth using exists. |
| 3 | **Mega Mewtwo X** | Counter / Hyper Beam | Mega / Primal | 19.32 | Hyper Beam. |
| 4 | **Regigigas** | Zen Headbutt / Crush Grip | Legendary | 18.16 | Only the charged move is Normal — the fast move is off-type. |
| 5 | **Crowned Sword Zacian** | Metal Claw / Giga Impact | Legendary | 18.06 | Only the charged move is Normal — the fast move is off-type. |
| 6 | **Shadow Dragonite** | Dragon Tail / Hyper Beam | Shadow | 15.85 | Hyper Beam off Dragonite’s Attack stat. |
| 7 | **Xerneas** | Geomancy / Giga Impact | Legendary | 15.04 | Giga Impact. Replaces Regieleki, whose Thunder Cage is an Electric move. |
| 8 | **Shadow Rhyperior** | Smack Down / Skull Bash | Shadow | 14.49 | Skull Bash. |
| 9 | **Dragonite** | Dragon Tail / Hyper Beam | Non-Legendary | 13.58 | Only the charged move is Normal — the fast move is off-type. |
| 10 | **Kommo-o** | Dragon Tail / Boomburst | Non-Legendary | 12.60 | Boomburst — one of very few Normal charged moves on a usable Attack stat. |

---

## Sources

- [Pokémon GO Hub — Best Attackers Per Type](https://db.pokemongohub.net/best/attackers-per-type)
- [Pokebattler — Best Raid Attackers](https://www.pokebattler.com/raids/attackers/rankings)
