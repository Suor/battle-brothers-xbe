// These are accessible globally to make them editable by other mods
local buildings = ::HackflowsExp.Data.BuildingDrafts <- {
    alchemist_building = []
    arena_building = [
        "gladiator_background"
        "gladiator_background"
        "gladiator_background"
        "paladin_background" // oathtaker
        "folk_hero_background"
        "champion_background"
        "myrmidon_background"
        "myrmidon_background"
        "myrmidon_background"
        "bounty_hunter_background"
        "bounty_hunter_background"
        "berserker_background"
        "berserker_background"
        "lancer_background"
        "lancer_background"
    ]
    armorsmith_building = ["blacksmith_background" "blacksmith_background"]
    // armorsmith_oriental_building inherits from armorsmith_building
    barber_building = []
    fletcher_building = ["atilliator_background", "fletcher_background"]
    kennel_building = []
    marketplace_building = []
    // marketplace_oriental_building inherits from marketplace_building
    port_building = [
        "pirate_background"
        "pirate_background"
        "outlander_background"
        "outlander_background"
    ]
    // port_oriental_building inherits from port_building
    tavern_building = [
        "barkeep_background"
        "barkeep_background"
        "con_artist_background"
        "drifter_background"
    ]
    taxidermist_building = []
    // taxidermist_oriental_building inherits from taxidermist_building
    temple_building = ["herbalist_background" "leper_background"]
    // temple_oriental_building inherits from temple_building
    training_hall_building = [
        "bounty_hunter_background"
        "bounty_hunter_background"
        "bounty_hunter_background"
        "lancer_background"
        "lancer_background"
        "champion_background"
    ]
    weaponsmith_building = [
        "blacksmith_background"
        "blacksmith_background"
    ]
    // weaponsmith_oriental_building inherits from weaponsmith_building
}
// std.Debug.log("buildings", buildings);

::mods_queue(::HackflowsExp.ID, "mod_hooks(>=20)", function() {
    ::mods_hookDescendants("entity/world/settlements/buildings/building", function (cls) {
        cls.hackflows_isBuilding <- true;
    })
    ::mods_addHook("inherit", function (baseScript, script, cls) {
        if (!("hackflows_isBuilding" in cls)) return;

        local name = split(script, "/").top();
        local backgrounds = name in buildings ? buildings[name] : [];
        if (backgrounds.len() == 0) return;
        this.logInfo("hx: hook building " + name + " dl=" + ("onUpdateDraftList" in cls));

        local original = "onUpdateDraftList" in cls ? cls.onUpdateDraftList : null;
        cls.onUpdateDraftList <- function (_list) {
            if (original) original(_list);
            _list.extend(backgrounds)
            if (cls.ClassName == "arena_building") ::std.Debug.log("drafts", _list);
        }
    })
})
