local hx = ::XBE <- {
    ID = "mod_backgrounds_and_events"
    Name = "More Backgrounds and Events"
    Version = 0.5
    Data = {}
};
::mods_registerMod(hx.ID, hx.Version, hx.Name);

foreach (file in ::IO.enumerateFiles("hackflows/const/")) ::include(file);
foreach (file in ::IO.enumerateFiles("hackflows/world/")) ::include(file);

::mods_queue(hx.ID, ">mod_background_perks", function () {
    ::include("hackflows/background_perks");
    ::logInfo("hx: LOADED");

    // Debug these lists
    ::mods_hookChildren("scenarios/world/starting_scenario", function (cls) {
        local original = "onUpdateDraftList" in cls ? cls.onUpdateDraftList : null;
        cls.onUpdateDraftList <- function (_list) {
            if (original) original(_list);
            _list.sort(@(a, b) a <=> b);
            ::std.Debug.log("drafts", _list);
        }
    })

    // Show enemies immediately after game load.
    // Contributed by TaroEld, refined by Enduriel.
    ::mods_hookExactClass("states/world_state", function (cls) {
        local onShow = cls.onShow;
        cls.onShow = function() {
            onShow();
            ::World.setPlayerPos(this.getPlayer().getPos())
            ::World.setPlayerVisionRadius(this.getPlayer().getVisionRadius())
        }
    })

    // if (::mods_getRegisteredMod("mod_reforged")) {
    //     ::mods_hookExactClass("skills/backgrounds/character_background", function (cls) {
    //         local create = cls.create;
    //         cls.create = function () {
    //             this.m.PerkTreeMultipliers = {
    //                 "pg.rf_resilient": 3,
    //                 "pg.rf_trained": 2,
    //             };
    //             this.m.PerkTree = ::new(::DynamicPerks.Class.PerkTree).init({
    //                 DynamicMap = {
    //                     "pgc.rf_exclusive_1": [],
    //                     "pgc.rf_shared_1": [],
    //                     "pgc.rf_weapon": [],
    //                     "pgc.rf_armor": [],
    //                     "pgc.rf_fighting_style": []
    //                 }
    //             });
    //             create();
    //         }
    //     })
    // }
})


// local Debug = ::std.Debug;

// ::mods_queue(hx.ID, null, function () {
//     // ::mods_hookExactClass("entity/tactical/player", function (cls) {
//     //     logInfo("cls = " + cls);
//     //     logInfo("cls.getdelegate() = " + cls.getdelegate());
//     //     logInfo("getArmor in cls = " + ("getArmor" in cls));

//     //     local dad = cls[cls.SuperName];
//     //     logInfo("dad = " + dad);
//     //     logInfo("dad.getdelegate() = " + (dad ? dad.getdelegate() : "<no dad>"));
//     //     logInfo("getArmor in dad = " + ("getArmor" in dad));

//     //     local grandpa;
//     //     if (dad && "SuperName" in dad) {
//     //         grandpa = dad[dad.SuperName];
//     //         logInfo("grandpa = " + grandpa);
//     //         logInfo("grandpa.getdelegate() = " + grandpa.getdelegate());
//     //         logInfo("getArmor in grandpa = " + ("getArmor" in grandpa));
//     //     }

//     //     Debug.log("cls", cls);
//     //     Debug.log("dad", dad);
//     //     // local getName = "getName" in cls ? cls.getName : cls[cls.SuperName].getName;
//     // })
//     //

    // local clones = {};
    // local function getMember(cls, name) {
    //     while (!(name in cls)) cls = cls[cls.SuperName];
    //     local script = ::IO.scriptFilenameByHash(cls.ClassNameHash)
    //     return clones[script][name];
    // }

    // local bound = {};

    // ::mods_addHook("inherit", function (baseScript, script, cls) {
    //     clones[script] <- clone cls;
    // })

    // ::mods_hookExactClass("entity/tactical/player", function (cls) {
    //     local getName = getMember(cls, "getName");
    //     cls.getName <- function () {
    //         return getName() + "!"
    //     }
    // })

//     return

//     local function getFunc(cls) {
//         return "getName" in cls ? cls.rawget("getName") : "null"
//     }
//     ::mods_hookExactClass("entity/tactical/actor", function (cls) {
//         logInfo("hook actor: getName = " + cls.getName);
//         logInfo("hook actor: entity.getName = " + cls.entity.getName);
//         // local getName = cls.getName;
//         // cls.getName <- function () {
//         //     logInfo("actor: this = " + this + " getName = " + this.getName);
//         //     return getName();
//         // }
//         // logInfo("hook actor: getName = " + cls.getName + " (after)");
//     })
//     ::mods_hookExactClass("entity/tactical/human", function (cls) {
//         logInfo("hook human: getName = " + getFunc(cls));
//         logInfo("hook human: actor.getName = " + getFunc(cls.actor));
//         logInfo("hook human: entity.getName = " + getFunc(cls.actor.entity));
//         cls.getName <- function () {
//             logInfo("human: this = " + this + " getName = " + this.getName);
//             logInfo("human: actor = " + this.actor + " actor.getName = " + this.actor.getName);
//             return this.actor.getName();
//         }
//         logInfo("hook human: getName = " + cls.getName + " (after)");
//     })
//     ::mods_hookExactClass("entity/tactical/player", function (cls) {
//         logInfo("hook player: getName = " + getFunc(cls));
//         logInfo("hook player: human.getName = " + getFunc(cls.human));
//         logInfo("hook player: actor.getName = " + getFunc(cls.human.actor));
//         logInfo("hook player: entity.getName = " + getFunc(cls.human.actor.entity));
//         // return;
//         // logInfo("hook: cls = " + cls);

//         // local dad = cls[cls.SuperName];
//         // logInfo("hook: dad = " + dad);
//         // local grandpa;
//         // if (dad && "SuperName" in dad) {
//         //     grandpa = dad[dad.SuperName];
//         //     logInfo("hook: grandpa = " + grandpa);
//         // }

//         // local ggpa;
//         // if (grandpa && "SuperName" in grandpa) {
//         //     ggpa = grandpa[grandpa.SuperName];
//         //     logInfo("hook: ggpa = " + ggpa);
//         //     logInfo("hook: ggpa.getdelegate() = " + ggpa.getdelegate());
//         //     logInfo("hook: ggpa.getdelegate()._get = " + ("_get" in ggpa.getdelegate()));
//         // }

//         // logInfo("hook player: parent.getName = " + cls.human.getName);
//         // logInfo("hook player: grandpa.getName = " + cls.human.actor.getName);
//         // logInfo("hook player: ggpa.getName = " + cls.human.actor.entity.getName);

//         cls.getName <- function () {
//             logInfo("-----------------------------------------------------------------");
//             logInfo("player: this = " + this + " getName = " + this.getName);
//             logInfo("player: human = " + this.human + " human.getName = " + this.human.getName);
//             logInfo("player: human.actor = " + this.human.actor + " human.getName = " + this.human.actor.getName);
//             local name = this.human.getName();
//             logInfo("player: NAME = " + name);
//             return name;
//         }
//         logInfo("hook player: getName = " + cls.getName + " (after)");
//     })
// })

// // ::mods_hookExactClass("items/weapons/named/named_shamshir", function(cls) {
// //     local onUpdateProperties = "onUpdateProperties" in cls ? cls.onUpdateProperties : null;
// //     local parentName = cls.SuperName;
// //     cls.onUpdateProperties <- function( _properties ) {
// //         (onUpdateProperties || this[parentName].onUpdateProperties)(_properties);
// //     }
// // });

// // ::mods_hookExactClass("items/weapons/named/named_shamshir", function(cls) {
// //     local onUpdateProperties = "onUpdateProperties" in cls
// //         ? cls.onUpdateProperties : cls[cls.SuperName].onUpdateProperties;
// //     cls.onUpdateProperties <- function( _properties ) {
// //         onUpdateProperties.bindenv(this)(_properties);
// //        ...
// //     }
// // });
