if (!::mods_getRegisteredMod("mod_background_perks")) return;

local chances = {
    arbalester = {
        "mastery.crossbow": 50
        "bullseye": 20
        "coup_de_grace": 20
    }

    atilliator = {
        "mastery.crossbow": 20
        "bullseye": 8
    }

    barkeep = {
        "hold_out": 60
        "steel_brow": 10
        "brawny": 10
    }

    berserker = {
        "berserk": 100
        "indomitable": 10
        "killing_frenzy": 10
        "hackflows.battle_flow": 20
    }

    blacksmith = {
        "mastery.hammer": 75
        "brawny": 30
        "student": 5
    }

    bodyguard = {
        "shield_expert": 100
        "taunt": 50
        "brawny": 50
        "hackflows.balance": 33
    }

    bounty_hunter = {
        "lone_wolf": 100
        "head_hunter": 20
        "quick_hands": 50
        "mastery.sword": 12
        "mastery.mace": 12
        "mastery.flail": 12
        "mastery.crossbow": 12
        "hackflows.stabilized": 12
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
        "hackflows.bloody_harvest": 10

        "mastery.axe": 25
        "mastery.mace": 25
        "mastery.flail": 25
        "mastery.sword": 25
    }

    cobbler = {
        "footwork": 20
        "quick_hands": 20
        "student": 5
    }

    con_artist = {
        "footwork": 50
        "taunt": 30
        "hackflows.balance": 15
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
        "pathfinder": 100
        "footwork": 10
        "recover": 5
    }

    druid = {
        "pathfinder": 100
        "fortified_mind": 50
        "hackflows.flesh_on_the_bones": 30
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
        "underdog": 20
        "hackflows.flesh_on_the_bones": 20
        "relentless": 20
        "rally_the_troops": 10
        "gifted": 5
    }

    gardener = {
        "pathfinder": 5
        "underdog": 20
    }

    hangman = {
        "hold_out": 20
        "steel_brow": 20
        "coup_de_grace": 30
        "nine_lives": 20
    }

    herbalist = {
        "bags_and_belts": 50
        "student": 25
        "pathfinder": 15
    }

    lancer = {
        "mastery.spear": 100
        "mastery.polearm": 100
        "rotation": 100
        "footwork": 100
    }

    // This one is intentionally useless
    leper = {
        "colossus": 5
        "nine_lives": 5
        "hackflows.flesh_on_the_bones": 5
    }

    locksmith = {
        "quick_hands": 100
    }

    master_archer = {
        "mastery.bow": 100
        "bullseye": 100
    }

    myrmidon = {
        "relentless": 100
        "mastery.dagger": 20
        "mastery.sword": 20
        "hackflows.stabilized": 10
        "duelist": 5
    }

    outlander = {
        "mastery.sword": 5
        "duelist": 100
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
        "nine_lives": 3
        "hackflows.flesh_on_the_bones": 2
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
        "hackflows.balance": 10
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
}


foreach (key, value in chances) {
    ::BgPerks.chances["hackflows_" + key] <- value;
}

// Chosen scenario
::BgPerks.chances.chosen <- {
    "berserk": 10
    "killing_frenzy": 20
    "adrenaline": 10
    "colossus": 7
    "mastery.cleaver": 5
    "lone_wolf": 5
    "hackflows.full_force": 7
}
::BgPerks.chances.aspirant <- {
    "berserk": 5
    "killing_frenzy": 10
    "adrenaline": 10
    "colossus": 7
    "hold_out": 5
}
::BgPerks.chances.shaman <- {
    "fortified_mind": 50
    "gifted": 33
    "fearsome": 20
}
