# Battle Cry

## Short description

Combat-oriented Zelda with procedural levels.

## Game Type/Genre

Battle-cry is a dungeon crawler with zelda-inspired gameplay. The levels are procedurally generated. The player must use and improve equipment and habilities in order to survive.

## Scenario

All happened in the blink of an eye. One moment you were living a peaceful life in your village, and the next one you were thrown on these twisted lands.

The stars in the sky are unfamiliar to you. You don't recognize any of the plants you see. The local fauna seems aggresive and dangerous.

You don't know how you got here, but one thing is clear: Your only hope is surviving long enough to find a way back.

You gather the little stuff you have, and prepare for battle.

## Long Description

The game levels will be procedurally generated. Every level will be closed, with only one entry and one exit.

Levels will have the usual architectural details:

- enemies, of course
- one single entry and one single exit



The player will be able to choose from a tree of dexterities, which would be grouped into 4 types: mage, archer, warrior and paladin.

## Game System

> What rules does the game implement? What objects need to be defined, what events need to be raised, and what actions are fired for each event?
> It may be useful to break the objects down into subcategories - player character, 'non-player characters' (e.g. 'monsters'), room objects (walls, doors), scoring/health objects (treasure, fuel pellets, first aid kits etc.), controller objects etc.

### Environment

The game world will be divided into levels. Each level will be composed of tiles. Each tile might have:

- walls, generally opaque and non-traversable
- floors tiles, generally walkable.
    - some special floor tiles might allow movement in only one direction
    - some floor tiles might be switches
- chasm tiles, generally non-walkable
    - chasms are traversable only for flying creatures
    - chasms can be filled with water or lava
    - if water and lava touch, a regular "obsidian" floor is created
- doors, which only intelligent creatures will know how to open. Some creatures and the player will be able to break them.
- other features, like furniture, decoration, etc.

Most walls can be dug up (by the player or certain mosters) and floors can be hollowed up. The most external walls can not be tunneled through.

Levels will be persistent, but only architecturally-wise (the type of each floor and wall).

### Enemies

The creatures on the first few levels will be simply strange animals. Some of them will not even be hostile to the player.

Later on, more intelligent creatures will appear. Some of them will be able to open doors, and use weapons. (ratmen)

On tier 3, magical wielders will appear. (dark wizards)

On the later level, completely magical entities will appear (earth elementals).

> The golden rule: every creature has to have something special

When possible, favour attack types instead of weaknesses/resistances. For example, favor attacks that can "disarm the player on touch" instead of simply "resist magic"

The initial position of each entity will be determined by the map layout. Fore xample, a water elemental should appear in a room filled with a small lake, not one filled up with magma (unless it's a prisoner of some sort).

All creatures start in the "idle" state. They will not move much unless disturbed.

It will be possible (and desirable) that a creatures fight with each other. Some of them will attack others on sight, but most of these attacks will have to be provoked by the player.

States:
- Iddle. When iddle, some monsters will wander around, while others will stay still (for example, spectres will not move).
- Attacking. When a hostile creature is around (usually, the player, or a creature who attacked this one), creatures will attempt to move to the nearest attack spot.
- Fleeing. Some times (about 5%) creatures will attempt to flee when their health is < 20%. This depends on their intelligence.
- Corpse. Very few enemies leave corpses. Instead of using corpses as chests, their items (if any) will be left on the ground.

A monster can "forget" his objective if it doesn't perceives it for x seconds (depends on intelligence)

The amount and type of enemies in a level will be persisted. Their position will be randomized - but only if the player has already seen them. If they are "undiscovered", they will remain idle in their rooms.

#### Tier 1

- ribbat: a small, flurry mammal. Non-hostile. Other mosters might attack them occasionaly.
- gocke: a small lizard. Non-hostile. Other monsters might attack them occasionaly.
- lusoct: this small mammal attacks usually in groups. Each bite makes the target slower for half a second.
- mtoh: big flying insects. Usually appears in big numbers. Can generate a dense mist when attacked. Hostile.
- sanil: a type of giant slug. Splatters acid when it dies. Occasionally, it attacks with acid. Found on humid environments.
- fireant: these small insects can attack from the distance using fire attacks. Sometimes they will spray flamable liquid on the ground.


#### Tier 2

- gilbon: tiny, aggresive humanoids, with a tech advancement akin to the stone age
    - The initial ones will be armed with little more than sticks.
    - Usually they will have better equipment: protective hide clothing, and crude stone axes. Some of them will have crude arcs and arrows.
    - Later ones will have special habilities: charge, shout.
    - Some of them might have stolen one or two pieces of iron from a corpse.
    - Little intelligence, reflected on their poor command of language, made of only 6 sillables.
    - Usually in groups
- finele: the members of an ancient culture, now somehow turned feral and crazed.
    - Their level seems like a big abandoned city: with statues, squares, offices and streets.
    - They are feral, so they attack with their mouths and claws. fiáincine don't use weapons, but the player might find weapons near them, in chests and the like.
    - Their equipment is usually good, but not maintained: the armor on their bodies is unmaintained. Their robes are rags.
    - They are are lonely, and will attack other creatures on sight - even others of their same species.
    - Near the exit of the level, a crazed fiaíncine will use magic to attack the player.
- mitnas: bipedal insectile people.
    - Intelligent, well organized, they will attack the player when in numbers, and fall back.
    - They are fond of explosives and powder.
    - Their armor is not usable by humans.
    - They will favour attacking from a distance when possible.
- imps: These very fast flying creatures will try to steal your helmet.

#### Tier 3

- dark disciples: misterious people wearing dark robes, hiding their faces from sight.
    - Certain magical powers: venom, dark rays, and specially drain.
    - Their bodies are consumed: not a lot of physical resistance.
    - Powerful artifacts that usually have a tradeof. For example, a wand with a strong attack which also drains health.
- marbh: the dead
    - used by dark mages as soldiers
    - slow, but resilient
    - lousy equipment
    - once defeated, they can be re-called by their masters
- firemancers: followers of the godess Illiâna, these people wield the power of the flame; at the cost of their own sanity.
    - They sport slightly better versions of the fire-related magic which can be done by the player.
    - Their items are cursed with an insanity related jinx - such as temporal craziness.
- Ull follower: Ull the Healer is the force of change, and at the same time is the force of restoration. These individuals will heal enemies. In some occasions they will rise marbh.
    - Their loot includes potions, and scrolls of healing, but also necromantic material.
- mass: a revolting pile of moving flesh, bones and teeth.
    - Not especially tough or intelligent, but regenerates health quickly.
    - Can devour pieces of equipment.
- Drakin: very skilled blind warriors. They use swords on the short distances and arcs on the long distances.
    - Decent armor and weapons, but nothing heavy.
- Ieli: Massive creatures that

#### Tier 4

### The player

### Items

## Narrative Structure

> How is the story structured? Draw the plotline using a graph to show how major story events are connected to each other...

## Game Play

> Describe the mechanics of how the player actually plays the game; include a subsection describing the user controls and how these relate to user actions (keyobard/gamepad controls).

## Room Map

> How are the rooms structured or ordered? Provide a map of the 'physical layout' of game world showing how different physical locations or rooms are ordered and/or connect to each other.

## Title and Information Screens

> Describe the organisation and navigation structures surrounding the 'non-game' pages:the title page, the end game page, the help page, high score page...

## Audio Requirements

> What are the audio requirements of the game? Background music, alert sounds for particular events or actions, general backbround noise?





