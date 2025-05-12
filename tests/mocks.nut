// Provide this stubs to enable simple testing

// Helpers, maybe should just use stdlib
::Str <- {
    function startswith(s, sub) {
        if (s.len() < sub.len()) return false;
        return s.slice(0, sub.len()) == sub;
    }
    function endswith(s, sub) {
        if (s.len() < sub.len()) return false;
        return s.slice(-sub.len()) == sub;
    }
}

// Basic things
::IO <- {
    _files = null
    function enumerateFiles(prefix) {
        if (this._files == null) this._files = dofile("tests/_files.nut");

        foreach (name in this._files) {
            if (!Str.startswith(name, prefix) || !Str.endswith(name, ".nut")) continue;
            yield name.slice(0, -4)
        }
    }
}
::include <- function (script) {
    return dofile(script + ".nut", true)
}
::new <- function (script) {
    return dofile(script + ".nut")
    // if (script == "scripts/skills/cursed_skill" || script == "scripts/skills/cursed_effect") {
    //     dofile("../../" + script + ".nut");
    // }

    return {
        script = script
        function getArmor() {return 39}
        function getArmorMax() {return 80}
        function setArmor(val) {}
    }
}
::inherit <- function (super, props) {
    return {
        super = super
        props = props
    }
}
Math <- {
    minf = @(a, b) a <= b ? a : b
    maxf = @(a, b) a >= b ? a : b
    min = @(a, b) (a <= b ? a : b).tointeger()
    max = @(a, b) (a >= b ? a : b).tointeger()
    function rand(min, max) {
        min = floor(min);
        max = floor(max);
        return (min + floor(gt.rand() * (max - min + 0.99999) / RAND_MAX)).tointeger();
    }
    pow = pow
}

// Game stuff
logInfo <- function(s) {
    print(s + "\n")
}
Const <- {
    SkillType = {Active = 1}
    ItemSlot = {Mainhand = 0, Body = 2, Head = 3}
    CharacterBackgrounds = []
    CharacterLaborerBackgrounds = []
    CharacterVillageBackgrounds = []
    CharacterThiefBackgrounds = []
    CharacterPiracyBackgrounds = []
    CharacterVeteranBackgrounds = []
    Strings = {}
}
local Days = 110;
World <- {
    FactionManager = {
        function getFaction(faction) {
            return {getType = @() faction, ClassName = "undead_faction"}
        }
    }
    Assets = {getCombatDifficulty = @() 1}
    function getTime() {
        return {Days = Days}
    }
}
createColor <- function (color) {return color}

// Mod hooks mock
::mods_registerMod <- function (x, y, x) {}
::mods_getRegisteredMod <- function (name) {return false}
::mods_queue <- function (x, y, func) {
    func()
}
::mods_hookClass <- function (x, func) {
    func({});
}
::mods_hookExactClass <- function (x, func) {
    func({
        onShow = @() null
    })
}
::mods_hookChildren <- function (x, func) {
    func({})
}
::mods_hookBaseClass <- function (x, func) {
    func({})
}
::mods_hookDescendants <- function (x, func) {
    func({})
}
::mods_hookNewObject <- function (x, func) {
    func({})
}
::mods_addHook <- function(name, func) {
    func("some/parent", "some/parent/child", {})
}
