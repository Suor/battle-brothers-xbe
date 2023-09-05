if (!::mods_getRegisteredMod("mod_background_perks")) return;

::std.Table.extend(::BgPerks.chances, {
});

arbalester = {
    "mastery.crossbow": 50
    "bullseye": 10
    "coup_de_grace": 20
}

atilliator = {
    "mastery.crossbow": 20
    "bullseye": 5
}

barkeep = {
    "hold_out": 60
    "steel_brow": 10
    "brawny": 10
}

berserker = {
    "berserk": 0
    "indomitable": 10
    "killing_frenzy": 10
}

blacksmith = {
    "mastery.hammer": 75
    "brawny": 30
    "student": 5
}

bodyguard = {
    "shield_expert": 0
    "taunt": 50
    "brawny": 50
}

bounty_hunter = {
    "lone_wolf": 0
    "head_hunter": 0
    local w = this.Math.rand(1, 4);

    if (w == 1)
    {
        "mastery.sword": 0
    }
    else if (w == 2)
    {
        "mastery.mace": 0
    }
    else if (w == 3)
    {
        "mastery.flail": 0
    }
    else if (w == 4)
    {
        "mastery.crossbow": 0
    }
}

carpenter = {
    "quick_hands": 30
}

cartographer = {
    "student": 80
    "gifted": 10
    "anticipation": 20
}

champion = {
    "indomitable": 10
    "fortified_mind": 10
    "steel_brow": 10
    "hold_out": 10
    "battle_forged": 5
    "brawny": 10
    "fearsome": 50
    local w = this.Math.rand(1, 4);

    if (w == 1)
    {
        "mastery.axe": 0
    }
    else if (w == 2)
    {
        "mastery.mace": 0
    }
    else if (w == 3)
    {
        "mastery.flail": 0
    }
    else if (w == 4)
    {
        "mastery.sword": 0
    }
}

cobbler = {
    "footwork": 20
    "quick_hands": 20
    "student": 5
}

con_artist = {
    "footwork": 50
    "taunt": 30
}

cook = {
    "bags_and_belts": 50
    "underdog": 30
}

dissenter = {
    "fortified_mind": 80
    "anticipation": 5
    "rally_the_troops": 15
}

drifter = {
    "pathfinder": 0
    "footwork": 10
    "recover": 5
}

druid = {
    "pathfinder": 0
    "fortified_mind": 50
}

falconer = {
    "bullseye": 5
    "pathfinder": 20
    "quick_hands": 10
}

fletcher = {
    "mastery.bow": 5
    "mastery.crossbow": 5
    "bullseye": 5
}

folk_hero = {
    "colossus": 30
    "brawny": 30
    "gifted": 30
    "underdog": 5
}

gardener = {
    "pathfinder": 5
    "underdog": 20
}

hangman = {
    "hold_out": 20
    "steel_brow": 20
    "coup_de_grace": 30
}

herbalist = {
    "bags_and_belts": 50
    "student": 25
}

lancer = {
    "mastery.spear": 0
    "mastery.polearm": 0
    "rotation": 0
    "footwork": 0
}

leper = {
    "colossus": 5
}

locksmith = {
    "quick_hands": 0
}

master_archer = {
    "mastery.bow": 0
    "bullseye": 0
}

myrmidon = {
    "relentless": 0
    "mastery.dagger": 20
    "mastery.sword": 20
    "duelist": 5
}

outlander = {
    "mastery.sword": 5
    "duelist": 0
    "crippling_strikes": 30
    "coup_de_grace": 20
}

painter = {
    "fortified_mind": 20
    "student": 20
    "gifted": 20
}

pirate = {
    "fearsome": 50
    "overwhelm": 50
    "killing_frenzy": 5
}

roofer = {
    "recover": 20
    "brawny": 20
}

skirmisher = {
    "mastery.throwing": 25
    "shield_expert": 50
    "anticipation": 10
    "footwork": 50
}

surgeon = {
    "quick_hands": 50
    "fortified_mind": 70
    "student": 10
}

torturer = {
    "crippling_strikes": 40
    "coup_de_grace": 30
    "mastery.cleaver": 10
    "mastery.flail": 5
    "mastery.dagger": 5
}

town_watchman = {
    "anticipation": 50
    "rotation": 50
}
