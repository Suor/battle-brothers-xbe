local hx = ::HackflowsExp <- {
    ID = "mod_hackflows"
    Name = "Hackflow's Expansion"
    Version = "0.1.0"
    Data = {}
};
::mods_registerMod(hx.ID, hx.Version, hx.Name);

foreach (file in ::IO.enumerateFiles("hackflows/const/")) ::include(file);
foreach (file in ::IO.enumerateFiles("hackflows/world/")) ::include(file);

::mods_queue(hx.ID, "mod_hooks(>=20), >mod_background_perks", function() {
    ::include("hackflows/background_perks");
    ::logInfo("hx: LOADED");
})
