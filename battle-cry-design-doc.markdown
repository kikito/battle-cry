# Battle Cry

A game for Linux, Mac and Windows.
Copyright 2012 Enrique García Cota (kikito)

## Short description

I liked Zelda: A Link to the Past a lot. I wished it was longer, and had more varied combat. This is what I'd like to do on this game: how would a combat-oriented Zelda look like?

I don't think making the levels just "bigger than in Zelda" is the right thing to. Instead, I'd like to explore the possibility of generating them procedurally. This should give the game a longer lifespan, without needing me to create infinite levels.

One difference is the stress in combat, as opposed to "puzzles" which will be rare and simple - nothing more complex than deactivating a trap. Certainly, no hidden keys in chests.

Another important difference is that the Story is less important - basically, the player has been magically teleported to hostile land, and he must fight for his own survival, and go back home. That's it.

There are 4 pools of habilities to choose from: warrior, mage, archer and cleric.
- Warriors will be masters of the sword. They will rely on high damage output in short distance for survival. They must be mobile to escape from tight spots - their habilities will reflect that. They will not wear bulky armor that would slow them down.
- Mages are the weakest in close range ... so they avoid it as much as possible. They favour mid-range and AOE(Area of effect) attacks, teleportations, etc. The range and versatility of the spells increases greatly over time.
- Archers attack mostly from a distance. They have more range than mages, move faster, and have some close-range habilities, too. Sharp eyes allow them to detect traps better than the rest.
- Clericks are trained to use heavy armor and shields. They are resilient, slow steady. Their habilities include some minor magical habilities. They favour blunt weapons, with which they can bash doors open.

The game plays similarly to how Zelda: A Link to the past did. Ideally, it would be playable with a 6-button pad (keyboard will be an option). Different weapons or spells will have different ranges and effects.

Visually, the game uses a 3/4 top/down perspective, similar to Zelda: ALTTP. The tone is darker: enemies are "less cute", and when they kill the player, he dies(this could be deactivated). The images, fonts, etc will all be 8-bit pixelated.

Permadeath will be activable at the beginning of each game.

## Detailed description

### Game Type/Genre

Battle-cry is a dungeon crawler with zelda-like gameplay and procedurally generated levels.

### Story

## Scenario

All happened in the blink of an eye. One moment you were with your friends and family, and the next one you were standing on these twisted lands.

The stars in the sky are unfamiliar to you. You don't recognize any of the plants you see. The local fauna seems aggresive and dangerous.

You don't know how you got here, but one thing is clear: Your only hope is surviving long enough to find a way back.

You gather the little equipment you have, and prepare for battle.

## Tone

The is initially neutral, but grows darker as the player advances levels. Its curve is similar to Gouls'n'Ghosts, in which the protagonist starts in a "more or less realistic" world that gradually turns into a nightmarish hell.

Nevertheless, there will be hits of humor here and there. Again, refer to Gouls'n'Ghosts, where the player spends most of its time in pants.

## Objective

The player's ultimate objective is going back home. In order to do this, he must travel through multiple dangerous levels, plaged with monsters.

## Gameplay

### Bootup

(Nice to have) A cinematic - 3 or 4 images with fadeouts, background music, and some text, right when the game starts (Maybe a 2-seconds credit screen). Everything skipable on [key|mouse|button]press.

### Main menu

(Very nice to have) Ideally the main menu should have some sort of animation and visual glee.
The main menu has the following items:

- Continue (Only visible if there is a game saved)
- New game
    - Name:
    - Permadeath (on/off Default: on)
    - Tutorial (on/off Default: off)
    - Start!
    - Back
- Load game
    - List of saved games, if any
    - Back
- Options
    - Sound
        - SFX Volume
        - Music Volume
        - Back
    - Graphics
        - Resolution
        - Full Screen (on/off)
        - Back
    - Keyboard
        - Back
    - Joypad
        - Back
    - Back

The menu is manageable via keyboard (arrows + enter + esc), joypad(arrows + a + b), or mouseclicks.

### Initial game

The player starts up in an empty room. The player is dressed in rags. A low-level weapon (a small dagger, a stick, a torch, or a pile of stones) are nearby.

He'll also know one single low-level spell.

For the most part, the starting room will be a common closed room. The only restrictions are that it can't have monsters. So it can have other loot.

### Movement

The player will be able to move in the cardinal or diagonal directions, using the keyboard or joypad.

There will be 4 "action slots". They will be mapped to actions - usually, weapons or spells.

### In-game menu

The in-game menu will have the following sections

- Inventory
- Character
- Game
    - Save
    - Load
    - Quit
- Options (same options as in main menu)
    - Sound
    - Graphics
    - Keyboard
    - Joypad

The inventory includes spaces for slots and spells. Initially it's a 50%-50% situation: the player has as many equipment slots as it has for spells.

Later on, depending on the user actions, this configuration might change, ending up in a 10%-90% situation, for example.

Items and spells will be sorted automatically; there will be no way to sort items manually.

There will be a "squared cursor" around the currently selected item. When the cursor hovers an item/spell, a help window will display a brief description, as well as its attributes: armor points for armor, damage points for spells, and so on.

The squared cursor will be movable via the keyboard and pad, as well as the mouse. When an item in the menu is activated, a submenu will appear:
- Use: potions will be drank, armors will be wear, scrolls will be read
- Slot: will make possible to assign this item to one of the slots.
- Drop: to liberate space.

Some items might be stackable - likely potions.

The Character slot will display general information about the character (health, stamina, etc), and the four action slots.

It will also display one slot for every body part capable of wearing wearables - torso, head, left hand, right hand, left finger, right finger, neck. It will also display the 4 quickslots.

For each of those, a menu will pop when activated:

- Examine: Short description of the equipped item, if any
- Equip...: Change the equipped item. When choosing a new piece of equipment, its statistics will be compared to the current ones, showing changes in red/green (increases/decreases)
- Drop.

The character screen will also display an image of the player, as well as his statistics (health, stamina, etc) and conditions (dazzled, blinded, etc)

### Evolution

For every creature in the game (including the player) the game will feature several bars:
- Health: Represented in hearts. When it goes down to 0, the creature dies.
- Stamina: Goes down with physical exercise - like swinging a weapon, or moving around in a heavy armor.
- Magic: Goes down by performing magical deeds - like casting spells or using magical items.

For the player, the three of them regenerate; they do it more quickly for a time, after eating food. Potions of Health, Stamina and Magic replenish them faster.

There are other attributes:
- Strength: Goes up the more Stamina is used in defeating enemies. It affects how fast Stamina is consumed.
- Will: Goes up the more magic is used with some effect - usually defeating enemies, but also healing (not auto-inflicted wounds!). It affects how fast magic is consumed.
- Armor: How much pysical damage can the currently worn armor can absorb.
- Speed: How fast the creature can move. Increases with movement. Decreases with armor weight.
- Resistances to any type of damage (see below)
- Dexterities



#### Types of damage

- Piercing
- Blunt
- Slashing
- Light
- Darkness
- Fire
- Cold
- Acid
- Venom

#### Dexterities

At certain points,

- Archery: Users of this hability can use arrows, throwing knifes, and other pointy long-distance weapons.
    1. 50% more damage with piercing weapons
    2. 25% chance of provoking bleeding (only applies to creatures with blood)
    3. 25% chance of ignoring armor
    4. 25% chance of impaling (going through the body of each target)
    5. Arrows bounce around corners 3 times.
- Blunt weapons: Maces, hammers, morningstars
    1. Blunt weapons do 50% more damage
    2. Blunt weapons have a 50% chance of knoking out enemies (only applies to creatures with a physical brain and body)
    3. Enemies can be knocked back with a 50% chance (only applies to creatures with less mass than the user)
    4. Knocked back enemies can knock back other enemies.
    5. Blunt weapons have a 3-tiles area-of-effect in front of the player.
- Slashing weapons: Swords, knifes
    1. Slashing weapons do 50% more damage
    2. 25% chance of deflecting attacks, if facing them.
    3. When next to a wall, slashing attacks do double damage.
    4. When next to 2 enemies or more, slashing attacks do double damage.
    5. Legend: Slashing and deflection have a 5-tile AOE range, related to where the player is facing.
- Light spells:
    1. Flash: A bright, brief, spark of light. Can temporary blind creatures.
    2. Healing: It heals 1 heart on live creatures. If facing one creature, it applies to it. Otherwise, it applies to self. Damages undead.
    3. Purge poison: Removes poison from organism.
    4. UltraHeal: Heal instantly to 100%. Costs all available mana. Can instantly kill any undead.
    5. Resurrection: A dead creature can return to life. He returns with full health and full mana, but temporary blind.
- Darkness spells:
    TBD

















...

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





