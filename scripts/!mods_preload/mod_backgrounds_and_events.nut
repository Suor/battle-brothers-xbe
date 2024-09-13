local xbe = ::XBE <- {
    ID = "mod_backgrounds_and_events"
    Name = "More Backgrounds and Events"
    Version = 0.5
    Data = {}
};
::mods_registerMod(xbe.ID, xbe.Version, xbe.Name);

foreach (file in ::IO.enumerateFiles("hackflows/const/")) ::include(file);
foreach (file in ::IO.enumerateFiles("hackflows/world/")) ::include(file);

::mods_queue(hx.ID, ">mod_background_perks", function () {
    ::include("hackflows/background_perks");
    ::logInfo("xbe: LOADED");

    // // Debug draft lists
    // ::mods_hookChildren("scenarios/world/starting_scenario", function (cls) {
    //     local original = "onUpdateDraftList" in cls ? cls.onUpdateDraftList : null;
    //     cls.onUpdateDraftList <- function (_list) {
    //         if (original) original(_list);
    //         _list.sort(@(a, b) a <=> b);
    //         ::std.Debug.log("drafts", _list);
    //     }
    // })

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
})
