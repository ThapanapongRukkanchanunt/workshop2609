# Pokémon GO — Best Counters by Boss Type

The reverse index of [`RAID_ATTACKERS.md`](RAID_ATTACKERS.md). There you pick an **attacking type**;
here you pick the **raid boss's type** and get one ranked Top 10 of counters that exploit its weaknesses.

Compiled 19 September 2026 from [Pokémon GO Hub](https://db.pokemongohub.net/best/attackers-per-type)
and [Pokebattler](https://www.pokebattler.com/raids/attackers/rankings).

## Roster caps

Each Top 10 is the highest-scoring valid set under these caps:

| Category | Max |
|---|---|
| Mega / Primal | 2 |
| Shadow Legendary | 1 |
| Shadow, non-Legendary | 2 |
| Legendary, non-Shadow | 3 |
| Non-Legendary, non-Shadow | fills the rest (always ≥ 2) |

The caps bind: a Mega or Legendary that outscores a pick below it was cut because its category was full.
That is the point — the list is a roster you could actually field, not a leaderboard.

## Method

1. For a boss of type **B**, pool every attacker from each type **B** is weak to.
2. An attacker only enters a type's pool if its **charged move** is of that type — the charged move
   carries raid damage, so `Shadow Salamence · Fire Fang / Fly` counts as Flying, not Fire.
3. Rank the pooled attackers by Pokémon GO Hub's **Score** (DPS × TDO blend). Every weakness is the
   same 1.6× multiplier, so scores compare directly across the pooled types.
4. Keep the best entry per Pokémon, then fill the 10 slots top-down under the caps.

**⚡ Dual** marks an attacker whose **fast move is also super effective** against that boss — every
point of its damage is boosted, not just the charged move. Black Kyurem against a Dragon boss is the
clearest case: Dragon Tail and Freeze Shock are both super effective.

**Caveat:** this ranks offence against a *single* boss type. Real bosses are usually dual-typed, which
can add a second weakness (2.56×) or cancel one out, and it does not model the boss's own damage,
so a glassy pick may in practice fall short of a bulkier one. For a specific boss, check Pokebattler.

---

## Boss: Normal

**Weak to:** Fighting

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo X** ⚡ | Counter / Dynamic Punch+ | Mega / Primal | Fighting | 43.35 |
| 2 | **Mega Lucario** ⚡ | Force Palm / Aura Sphere | Mega / Primal | Fighting | 36.79 |
| 3 | **Keldeo (Resolute Forme)** ⚡ | Low Kick / Secret Sword | Legendary | Fighting | 31.89 |
| 4 | **Shadow Blaziken** ⚡ | Counter / Aura Sphere | Shadow | Fighting | 29.35 |
| 5 | **Shadow Conkeldurr** ⚡ | Force Palm / Dynamic Punch | Shadow | Fighting | 28.19 |
| 6 | **Lucario** ⚡ | Force Palm / Aura Sphere | Non-Legendary | Fighting | 27.09 |
| 7 | **Terrakion** ⚡ | Double Kick / Sacred Sword | Legendary | Fighting | 26.89 |
| 8 | **Keldeo (Ordinary Forme)** ⚡ | Low Kick / Sacred Sword | Legendary | Fighting | 25.52 |
| 9 | **Blaziken** ⚡ | Counter / Aura Sphere | Non-Legendary | Fighting | 25.45 |
| 10 | **Shadow Mewtwo** ⚡ | Counter / Focus Blast | Shadow Legendary | Fighting | 25.43 |

## Boss: Fire

**Weak to:** Water, Ground, Rock

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Greninja** ⚡ | Water Shuriken / Surf+ | Mega / Primal | Water | 34.20 |
| 2 | **Primal Kyogre** ⚡ | Waterfall / Origin Pulse | Mega / Primal | Water | 33.07 |
| 3 | **Shadow Rhyperior** ⚡ | Smack Down / Rock Wrecker | Shadow | Rock | 30.23 |
| 4 | **Shadow Rampardos** ⚡ | Smack Down / Rock Slide | Shadow | Rock | 28.91 |
| 5 | **Shadow Groudon** ⚡ | Mud Shot / Precipice Blades | Shadow Legendary | Ground | 28.88 |
| 6 | **Landorus (Therian Forme)** ⚡ | Mud Shot / Sandsear Storm | Legendary | Ground | 26.96 |
| 7 | **Rhyperior** ⚡ | Smack Down / Rock Wrecker | Non-Legendary | Rock | 25.58 |
| 8 | **Glimmora** ⚡ | Rock Throw / Meteor Beam | Non-Legendary | Rock | 25.49 |
| 9 | **Rampardos** ⚡ | Smack Down / Rock Slide | Non-Legendary | Rock | 25.40 |
| 10 | **Groudon** ⚡ | Mud Shot / Precipice Blades | Legendary | Ground | 24.67 |

## Boss: Water

**Weak to:** Electric, Grass

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Raichu Y** ⚡ | Thunder Shock / Zap Cannon+ | Mega / Primal | Electric | 34.25 |
| 2 | **Mega Raichu X** ⚡ | Thunder Shock / Volt Tackle+ | Mega / Primal | Electric | 31.46 |
| 3 | **Shadow Thundurus (Therian Forme)** ⚡ | Volt Switch / Wildbolt Storm | Shadow Legendary | Electric | 29.75 |
| 4 | **Zeraora** ⚡ | Volt Switch / Plasma Fists | Legendary | Electric | 27.41 |
| 5 | **Regieleki** | Lock-On / Thunder Cage | Legendary | Electric | 27.39 |
| 6 | **Xurkitree** ⚡ | Thunder Shock / Discharge | Legendary | Electric | 26.32 |
| 7 | **Shadow Electivire** ⚡ | Thunder Shock / Wild Charge | Shadow | Electric | 26.15 |
| 8 | **Shadow Magnezone** ⚡ | Volt Switch / Wild Charge | Shadow | Electric | 25.37 |
| 9 | **Rillaboom** ⚡ | Razor Leaf / Frenzy Plant | Non-Legendary | Grass | 23.11 |
| 10 | **Electivire** ⚡ | Thunder Shock / Wild Charge | Non-Legendary | Electric | 22.60 |

## Boss: Electric

**Weak to:** Ground

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Primal Groudon** ⚡ | Mud Shot / Precipice Blades | Mega / Primal | Ground | 33.06 |
| 2 | **Mega Garchomp** ⚡ | Mud Shot / Earth Power | Mega / Primal | Ground | 30.13 |
| 3 | **Shadow Groudon** ⚡ | Mud Shot / Precipice Blades | Shadow Legendary | Ground | 28.88 |
| 4 | **Shadow Garchomp** ⚡ | Mud Shot / Earth Power | Shadow | Ground | 27.36 |
| 5 | **Landorus (Therian Forme)** ⚡ | Mud Shot / Sandsear Storm | Legendary | Ground | 26.96 |
| 6 | **Shadow Excadrill** ⚡ | Mud-Slap / Scorching Sands | Shadow | Ground | 26.51 |
| 7 | **Groudon** ⚡ | Mud Shot / Precipice Blades | Legendary | Ground | 24.67 |
| 8 | **Garchomp** ⚡ | Mud Shot / Earth Power | Non-Legendary | Ground | 23.10 |
| 9 | **Excadrill** ⚡ | Mud-Slap / Scorching Sands | Non-Legendary | Ground | 22.72 |
| 10 | **Landorus (Incarnate Forme)** ⚡ | Mud Shot / Earth Power | Legendary | Ground | 22.43 |

## Boss: Grass

**Weak to:** Fire, Ice, Poison, Flying, Bug

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Rayquaza** ⚡ | Air Slash / Dragon Ascent | Mega / Primal | Flying | 45.92 |
| 2 | **Mega Delphox** ⚡ | Fire Spin / Mystical Fire+ | Mega / Primal | Fire | 37.51 |
| 3 | **White Kyurem** ⚡ | Ice Fang / Ice Burn | Legendary | Ice | 34.89 |
| 4 | **Rayquaza** ⚡ | Air Slash / Dragon Ascent | Legendary | Flying | 33.80 |
| 5 | **Shadow Moltres** ⚡ | Wing Attack / Fly | Shadow Legendary | Flying | 33.09 |
| 6 | **Black Kyurem** | Dragon Tail / Freeze Shock | Legendary | Ice | 32.28 |
| 7 | **Shadow Salamence** ⚡ | Fire Fang / Fly | Shadow | Flying | 31.75 |
| 8 | **Shadow Toucannon** ⚡ | Peck / Beak Blast | Shadow | Flying | 30.81 |
| 9 | **Salamence** ⚡ | Fire Fang / Fly | Non-Legendary | Flying | 26.87 |
| 10 | **Toucannon** ⚡ | Peck / Beak Blast | Non-Legendary | Flying | 26.71 |

## Boss: Ice

**Weak to:** Fire, Fighting, Rock, Steel

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo X** ⚡ | Counter / Dynamic Punch+ | Mega / Primal | Fighting | 43.35 |
| 2 | **Mega Delphox** ⚡ | Fire Spin / Mystical Fire+ | Mega / Primal | Fire | 37.51 |
| 3 | **Crowned Sword Zacian** ⚡ | Metal Claw / Behemoth Blade | Legendary | Steel | 36.19 |
| 4 | **Crowned Shield Zamazenta** ⚡ | Metal Claw / Behemoth Bash | Legendary | Steel | 35.00 |
| 5 | **Dusk Mane Necrozma** ⚡ | Metal Claw / Sunsteel Strike | Legendary | Steel | 34.53 |
| 6 | **Shadow Reshiram** ⚡ | Fire Fang / Fusion Flare | Shadow Legendary | Fire | 32.13 |
| 7 | **Shadow Rhyperior** ⚡ | Smack Down / Rock Wrecker | Shadow | Rock | 30.23 |
| 8 | **Shadow Metagross** ⚡ | Bullet Punch / Meteor Mash | Shadow | Steel | 29.84 |
| 9 | **Lucario** ⚡ | Force Palm / Aura Sphere | Non-Legendary | Fighting | 27.09 |
| 10 | **Rhyperior** ⚡ | Smack Down / Rock Wrecker | Non-Legendary | Rock | 25.58 |

## Boss: Fighting

**Weak to:** Flying, Psychic, Fairy

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo Y** ⚡ | Psycho Cut / Future Sight+ | Mega / Primal | Psychic | 48.86 |
| 2 | **Mega Rayquaza** ⚡ | Air Slash / Dragon Ascent | Mega / Primal | Flying | 45.92 |
| 3 | **Shadow Mewtwo** ⚡ | Psycho Cut / Psystrike | Shadow Legendary | Psychic | 34.85 |
| 4 | **Rayquaza** ⚡ | Air Slash / Dragon Ascent | Legendary | Flying | 33.80 |
| 5 | **Shadow Salamence** | Fire Fang / Fly | Shadow | Flying | 31.75 |
| 6 | **Shadow Toucannon** ⚡ | Peck / Beak Blast | Shadow | Flying | 30.81 |
| 7 | **Mewtwo** ⚡ | Psycho Cut / Psystrike | Legendary | Psychic | 29.70 |
| 8 | **Enamorus (Incarnate Forme)** ⚡ | Fairy Wind / Fly | Legendary | Flying | 29.44 |
| 9 | **Salamence** | Fire Fang / Fly | Non-Legendary | Flying | 26.87 |
| 10 | **Toucannon** ⚡ | Peck / Beak Blast | Non-Legendary | Flying | 26.71 |

## Boss: Poison

**Weak to:** Ground, Psychic

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo Y** ⚡ | Psycho Cut / Future Sight+ | Mega / Primal | Psychic | 48.86 |
| 2 | **Mega Mewtwo X** ⚡ | Confusion / Psystrike | Mega / Primal | Psychic | 40.62 |
| 3 | **Shadow Mewtwo** ⚡ | Psycho Cut / Psystrike | Shadow Legendary | Psychic | 34.85 |
| 4 | **Mewtwo** ⚡ | Psycho Cut / Psystrike | Legendary | Psychic | 29.70 |
| 5 | **Deoxys (Normal Forme)** ⚡ | Zen Headbutt / Psycho Boost | Legendary | Psychic | 29.25 |
| 6 | **Shadow Garchomp** ⚡ | Mud Shot / Earth Power | Shadow | Ground | 27.36 |
| 7 | **Shadow Metagross** ⚡ | Zen Headbutt / Psychic | Shadow | Psychic | 27.19 |
| 8 | **Landorus (Therian Forme)** ⚡ | Mud Shot / Sandsear Storm | Legendary | Ground | 26.96 |
| 9 | **Garchomp** ⚡ | Mud Shot / Earth Power | Non-Legendary | Ground | 23.10 |
| 10 | **Metagross** ⚡ | Zen Headbutt / Psychic | Non-Legendary | Psychic | 22.99 |

## Boss: Ground

**Weak to:** Water, Grass, Ice

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **White Kyurem** ⚡ | Ice Fang / Ice Burn | Legendary | Ice | 34.89 |
| 2 | **Mega Greninja** ⚡ | Water Shuriken / Surf+ | Mega / Primal | Water | 34.20 |
| 3 | **Primal Kyogre** ⚡ | Waterfall / Origin Pulse | Mega / Primal | Water | 33.07 |
| 4 | **Black Kyurem** | Dragon Tail / Freeze Shock | Legendary | Ice | 32.28 |
| 5 | **Shadow Kyogre** ⚡ | Waterfall / Origin Pulse | Shadow Legendary | Water | 28.74 |
| 6 | **Shadow Mamoswine** ⚡ | Powder Snow / Avalanche | Shadow | Ice | 27.44 |
| 7 | **Kartana** ⚡ | Razor Leaf / Leaf Blade | Legendary | Grass | 25.90 |
| 8 | **Shadow Greninja** ⚡ | Water Shuriken / Hydro Cannon | Shadow | Water | 25.11 |
| 9 | **Baxcalibur** ⚡ | Ice Fang / Avalanche | Non-Legendary | Ice | 24.63 |
| 10 | **Galarian Darmanitan** ⚡ | Ice Fang / Avalanche | Non-Legendary | Ice | 23.86 |

## Boss: Flying

**Weak to:** Electric, Ice, Rock

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **White Kyurem** ⚡ | Ice Fang / Ice Burn | Legendary | Ice | 34.89 |
| 2 | **Mega Raichu Y** ⚡ | Thunder Shock / Zap Cannon+ | Mega / Primal | Electric | 34.25 |
| 3 | **Black Kyurem** | Dragon Tail / Freeze Shock | Legendary | Ice | 32.28 |
| 4 | **Mega Raichu X** ⚡ | Thunder Shock / Volt Tackle+ | Mega / Primal | Electric | 31.46 |
| 5 | **Shadow Rhyperior** ⚡ | Smack Down / Rock Wrecker | Shadow | Rock | 30.23 |
| 6 | **Shadow Thundurus (Therian Forme)** ⚡ | Volt Switch / Wildbolt Storm | Shadow Legendary | Electric | 29.75 |
| 7 | **Shadow Rampardos** ⚡ | Smack Down / Rock Slide | Shadow | Rock | 28.91 |
| 8 | **Zeraora** ⚡ | Volt Switch / Plasma Fists | Legendary | Electric | 27.41 |
| 9 | **Rhyperior** ⚡ | Smack Down / Rock Wrecker | Non-Legendary | Rock | 25.58 |
| 10 | **Glimmora** ⚡ | Rock Throw / Meteor Beam | Non-Legendary | Rock | 25.49 |

## Boss: Psychic

**Weak to:** Bug, Ghost, Dark

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Houndoom** ⚡ | Snarl / Dark Pulse+ | Mega / Primal | Dark | 35.33 |
| 2 | **Mega Beedrill** ⚡ | Bug Bite / Fell Stinger+ | Mega / Primal | Bug | 33.71 |
| 3 | **Dawn Wings Necrozma** | Psycho Cut / Moongeist Beam | Legendary | Ghost | 32.66 |
| 4 | **Shadow Darkrai** ⚡ | Snarl / Foul Play | Shadow Legendary | Dark | 30.99 |
| 5 | **Shadow Hydreigon** ⚡ | Bite / Brutal Swing | Shadow | Dark | 29.41 |
| 6 | **Shadow Tyranitar** ⚡ | Bite / Brutal Swing | Shadow | Dark | 29.21 |
| 7 | **Darkrai** ⚡ | Snarl / Foul Play | Legendary | Dark | 26.36 |
| 8 | **Lunala** ⚡ | Shadow Claw / Shadow Ball | Legendary | Ghost | 25.18 |
| 9 | **Hydreigon** ⚡ | Bite / Brutal Swing | Non-Legendary | Dark | 24.84 |
| 10 | **Tyranitar** ⚡ | Bite / Brutal Swing | Non-Legendary | Dark | 24.61 |

## Boss: Bug

**Weak to:** Fire, Flying, Rock

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Rayquaza** ⚡ | Air Slash / Dragon Ascent | Mega / Primal | Flying | 45.92 |
| 2 | **Mega Delphox** ⚡ | Fire Spin / Mystical Fire+ | Mega / Primal | Fire | 37.51 |
| 3 | **Rayquaza** ⚡ | Air Slash / Dragon Ascent | Legendary | Flying | 33.80 |
| 4 | **Shadow Moltres** ⚡ | Wing Attack / Fly | Shadow Legendary | Flying | 33.09 |
| 5 | **Shadow Salamence** ⚡ | Fire Fang / Fly | Shadow | Flying | 31.75 |
| 6 | **Blacephalon** ⚡ | Incinerate / Mind Blown | Legendary | Fire | 31.74 |
| 7 | **Shadow Toucannon** ⚡ | Peck / Beak Blast | Shadow | Flying | 30.81 |
| 8 | **Enamorus (Incarnate Forme)** | Fairy Wind / Fly | Legendary | Flying | 29.44 |
| 9 | **Salamence** ⚡ | Fire Fang / Fly | Non-Legendary | Flying | 26.87 |
| 10 | **Toucannon** ⚡ | Peck / Beak Blast | Non-Legendary | Flying | 26.71 |

## Boss: Rock

**Weak to:** Water, Grass, Fighting, Ground, Steel

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo X** ⚡ | Counter / Dynamic Punch+ | Mega / Primal | Fighting | 43.35 |
| 2 | **Mega Lucario** ⚡ | Force Palm / Aura Sphere | Mega / Primal | Fighting | 36.79 |
| 3 | **Crowned Sword Zacian** ⚡ | Metal Claw / Behemoth Blade | Legendary | Steel | 36.19 |
| 4 | **Crowned Shield Zamazenta** ⚡ | Metal Claw / Behemoth Bash | Legendary | Steel | 35.00 |
| 5 | **Dusk Mane Necrozma** ⚡ | Metal Claw / Sunsteel Strike | Legendary | Steel | 34.53 |
| 6 | **Shadow Metagross** ⚡ | Bullet Punch / Meteor Mash | Shadow | Steel | 29.84 |
| 7 | **Shadow Blaziken** ⚡ | Counter / Aura Sphere | Shadow | Fighting | 29.35 |
| 8 | **Shadow Groudon** ⚡ | Mud Shot / Precipice Blades | Shadow Legendary | Ground | 28.88 |
| 9 | **Lucario** ⚡ | Force Palm / Aura Sphere | Non-Legendary | Fighting | 27.09 |
| 10 | **Blaziken** ⚡ | Counter / Aura Sphere | Non-Legendary | Fighting | 25.45 |

## Boss: Ghost

**Weak to:** Ghost, Dark

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Houndoom** ⚡ | Snarl / Dark Pulse+ | Mega / Primal | Dark | 35.33 |
| 2 | **Dawn Wings Necrozma** | Psycho Cut / Moongeist Beam | Legendary | Ghost | 32.66 |
| 3 | **Mega Gengar** ⚡ | Lick / Shadow Ball | Mega / Primal | Ghost | 31.54 |
| 4 | **Shadow Darkrai** ⚡ | Snarl / Foul Play | Shadow Legendary | Dark | 30.99 |
| 5 | **Shadow Hydreigon** ⚡ | Bite / Brutal Swing | Shadow | Dark | 29.41 |
| 6 | **Shadow Tyranitar** ⚡ | Bite / Brutal Swing | Shadow | Dark | 29.21 |
| 7 | **Darkrai** ⚡ | Snarl / Foul Play | Legendary | Dark | 26.36 |
| 8 | **Lunala** ⚡ | Shadow Claw / Shadow Ball | Legendary | Ghost | 25.18 |
| 9 | **Hydreigon** ⚡ | Bite / Brutal Swing | Non-Legendary | Dark | 24.84 |
| 10 | **Tyranitar** ⚡ | Bite / Brutal Swing | Non-Legendary | Dark | 24.61 |

## Boss: Dragon

**Weak to:** Ice, Dragon, Fairy

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Rayquaza** ⚡ | Dragon Tail / Breaking Swipe | Mega / Primal | Dragon | 36.18 |
| 2 | **Eternatus** ⚡ | Dragon Tail / Dynamax Cannon | Legendary | Dragon | 36.13 |
| 3 | **White Kyurem** ⚡ | Ice Fang / Ice Burn | Legendary | Ice | 34.89 |
| 4 | **Mega Dragonite** ⚡ | Dragon Tail / Outrage+ | Mega / Primal | Dragon | 34.39 |
| 5 | **Black Kyurem** ⚡ | Dragon Tail / Freeze Shock | Legendary | Ice | 32.28 |
| 6 | **Shadow Garchomp** ⚡ | Dragon Tail / Breaking Swipe | Shadow | Dragon | 29.41 |
| 7 | **Shadow Haxorus** ⚡ | Dragon Tail / Breaking Swipe | Shadow | Dragon | 28.99 |
| 8 | **Shadow Palkia** ⚡ | Dragon Tail / Draco Meteor | Shadow Legendary | Dragon | 28.32 |
| 9 | **Baxcalibur** ⚡ | Ice Fang / Glaive Rush | Non-Legendary | Dragon | 27.40 |
| 10 | **Haxorus** ⚡ | Dragon Tail / Breaking Swipe | Non-Legendary | Dragon | 25.28 |

## Boss: Dark

**Weak to:** Fighting, Bug, Fairy

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo X** ⚡ | Counter / Dynamic Punch+ | Mega / Primal | Fighting | 43.35 |
| 2 | **Mega Lucario** ⚡ | Force Palm / Aura Sphere | Mega / Primal | Fighting | 36.79 |
| 3 | **Keldeo (Resolute Forme)** ⚡ | Low Kick / Secret Sword | Legendary | Fighting | 31.89 |
| 4 | **Shadow Blaziken** ⚡ | Counter / Aura Sphere | Shadow | Fighting | 29.35 |
| 5 | **Shadow Conkeldurr** ⚡ | Force Palm / Dynamic Punch | Shadow | Fighting | 28.19 |
| 6 | **Lucario** ⚡ | Force Palm / Aura Sphere | Non-Legendary | Fighting | 27.09 |
| 7 | **Crowned Sword Zacian** | Metal Claw / Play Rough | Legendary | Fairy | 27.07 |
| 8 | **Terrakion** ⚡ | Double Kick / Sacred Sword | Legendary | Fighting | 26.89 |
| 9 | **Blaziken** ⚡ | Counter / Aura Sphere | Non-Legendary | Fighting | 25.45 |
| 10 | **Shadow Mewtwo** ⚡ | Counter / Focus Blast | Shadow Legendary | Fighting | 25.43 |

## Boss: Steel

**Weak to:** Fire, Fighting, Ground

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Mega Mewtwo X** ⚡ | Counter / Dynamic Punch+ | Mega / Primal | Fighting | 43.35 |
| 2 | **Mega Delphox** ⚡ | Fire Spin / Mystical Fire+ | Mega / Primal | Fire | 37.51 |
| 3 | **Shadow Reshiram** ⚡ | Fire Fang / Fusion Flare | Shadow Legendary | Fire | 32.13 |
| 4 | **Keldeo (Resolute Forme)** ⚡ | Low Kick / Secret Sword | Legendary | Fighting | 31.89 |
| 5 | **Blacephalon** ⚡ | Incinerate / Mind Blown | Legendary | Fire | 31.74 |
| 6 | **Shadow Blaziken** ⚡ | Counter / Aura Sphere | Shadow | Fighting | 29.35 |
| 7 | **Shadow Conkeldurr** ⚡ | Force Palm / Dynamic Punch | Shadow | Fighting | 28.19 |
| 8 | **Reshiram** ⚡ | Fire Fang / Fusion Flare | Legendary | Fire | 27.28 |
| 9 | **Lucario** ⚡ | Force Palm / Aura Sphere | Non-Legendary | Fighting | 27.09 |
| 10 | **Blaziken** ⚡ | Counter / Aura Sphere | Non-Legendary | Fighting | 25.45 |

## Boss: Fairy

**Weak to:** Poison, Steel

| # | Counter | Moveset | Category | Via | Score |
|---|---|---|---|---|---|
| 1 | **Crowned Sword Zacian** ⚡ | Metal Claw / Behemoth Blade | Legendary | Steel | 36.19 |
| 2 | **Crowned Shield Zamazenta** ⚡ | Metal Claw / Behemoth Bash | Legendary | Steel | 35.00 |
| 3 | **Dusk Mane Necrozma** ⚡ | Metal Claw / Sunsteel Strike | Legendary | Steel | 34.53 |
| 4 | **Mega Victreebel** ⚡ | Acid / Acid Spray+ | Mega / Primal | Poison | 30.53 |
| 5 | **Mega Lucario** | Force Palm / Meteor Mash | Mega / Primal | Steel | 30.43 |
| 6 | **Shadow Metagross** ⚡ | Bullet Punch / Meteor Mash | Shadow | Steel | 29.84 |
| 7 | **Shadow Dialga** ⚡ | Metal Claw / Iron Head | Shadow Legendary | Steel | 26.21 |
| 8 | **Metagross** ⚡ | Bullet Punch / Meteor Mash | Non-Legendary | Steel | 25.16 |
| 9 | **Shadow Overqwil** ⚡ | Poison Jab / Sludge Bomb | Shadow | Poison | 25.11 |
| 10 | **Tinkaton** | Fairy Wind / Gigaton Hammer | Non-Legendary | Steel | 23.11 |

---

## Sources

- [Pokémon GO Hub — Best Attackers Per Type](https://db.pokemongohub.net/best/attackers-per-type)
- [Pokebattler — Best Raid Attackers](https://www.pokebattler.com/raids/attackers/rankings)
