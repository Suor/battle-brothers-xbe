local hx = ::HackflowsExp <- {
    ID = "mod_hackflows"
    Name = "Hackflow's Expansion"
    Version = "0.1.0"
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
})


// Renamer
::mods_queue(hx.ID, null, function () {
    local romanLookup = [[1000 "M"], [900 "CM"], [500 "D"], [400 "CD"], [100 "C"], [90 "XC"],
                         [50 "L"], [40 "XL"], [10 "X"], [9 "IX"], [5 "V"], [4 "IV"], [1 "I"]];
    local romanStr = {I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000}, romanChar = {};
    foreach (k, v in romanStr) romanChar[k[0]] <- v; // Need to convert keys to chars

    local function toRoman(num) {
        local roman = "";
        foreach (pair in romanLookup) {
            local value = pair[0], r = pair[1];
            while (num >= value) {
                roman += r;
                num -= value;
            }
        }
        return roman;
    }

    local function fromRoman(roman) {
        if (roman.len() == 0) return null;

        local num = romanChar[roman[0]];
        for (local i = 1; i < roman.len(); i ++) {
            local curr = romanChar[roman[i]], prev = romanChar[roman[i - 1]];
            num += (curr <= prev ? curr : curr - prev * 2);
        }
        return num;
    }

    local function re_find(re, s) {
        local capture = regexp(re).capture(s);
        if (!capture) return null;
        return s.slice(capture[1].begin, capture[1].end)
    }

    local function extractNumber(name) {
        local roman = re_find(" ([IVXLC]+)$", name);
        return roman ? fromRoman(roman) : 1; // If absent then he is the first
    }

    local aliases = {
        "Adventurous Noble": "High Noble"
        "Caravan Hand": "Caravaner"
        "Disowned Noble": "Low Noble"
        "Farmhand": "Farmer"
        "Fisherman": "Fisher"
        "Hedge Knight": "Knight"
        "Killer on the Run": "Killer"
        "Retired Soldier": "Retired"
        "Indebted": "Slave"
        // Hacflows Exp
        "Town Watchman": "Watchman"
        // Chosen
        "Chosen Aspirant": "Aspirant"
    }

    ::mods_hookNewObject("entity/tactical/player", function (obj) {
        local onHired = obj.onHired;
        obj.onHired = function() {
            this.logInfo("hx: hired " + this.getName());
            onHired();
            // World.Statistics.m.Fallen
            local bgID = this.getBackground().getID()
            local bgName = this.getBackground().getNameOnly();
            local bgAlias = bgName in aliases ? aliases[bgName] : bgName;

            local lastNum = 0;
            foreach (bro in World.getPlayerRoster().getAll()) {
                if (bro == this) continue;
                if (bro.getBackground().getID() != bgID) continue;
                local num = extractNumber(bro.getTitle());
                if (num && num > lastNum) lastNum = num;
            }
            foreach (fallen in World.Statistics.getFallen()) {
                if (fallen.Name.find(bgAlias) == null && fallen.Name.find(bgName) == null) continue;
                local num = extractNumber(fallen.Name);
                if (num && num > lastNum) lastNum = num;
            }

            this.getFlags().set("renamer_initialTitle", this.getTitle());
            this.setTitle(bgAlias + " " + toRoman(lastNum + 1));
        }
    });
})

::mods_queue(hx.ID, null, function () {
    // ::mods_hookExactClass("states/world_state", function (o) {
    //     local onUpdate = o.onUpdate;
    //     o.onUpdate = function() {
    //         if (this.m.AIEngageCallback != null) {
    //             if (!(this.m.IsGamePaused || this.m.IsGameAutoPaused))
    //                 ::logInfo("hx_world_state: AIEngageCallback");
    //         }
    //         else if (this.m.AutoEnterLocation != null && !this.m.AutoEnterLocation.isNull()) {
    //             if (!(this.m.IsGamePaused || this.m.IsGameAutoPaused))
    //                 ::logInfo("hx_world_state: AutoEnterLocation "
    //                     + this.m.Player.getDistanceTo(this.m.AutoEnterLocation.get())
    //                     + " -> " + this.Const.World.CombatSettings.CombatPlayerDistance);
    //         }
    //         else if (this.m.AutoAttack != null && !this.m.AutoAttack.isNull() && this.m.AutoAttack.isAlive() && !this.m.AutoAttack.isHiddenToPlayer()) {
    //             if (!(this.m.IsGamePaused || this.m.IsGameAutoPaused))
    //                 ::logInfo("hx_world_state: AutoEnterLocation "
    //                     + this.m.Player.getDistanceTo(this.m.AutoAttack.get())
    //                     + " -> " + this.Const.World.CombatSettings.CombatPlayerDistance);
    //         }
    //         onUpdate();
    //     }
    // });

    ::mods_hookNewObjectOnce("events/event_manager", function (o) {
        ::logInfo("hx: hook event_manager");

        local function showEvents(em) {
            // if (em.m.ActiveEvent) {
                local events = [], score = 0;
                foreach (e in em.m.Events) {
                    if (e.m.Score > 0) events.push(e.getID() + " " + e.m.Score);
                    score += e.m.Score;
                }
                this.logInfo("hx_events: TOTAL SCORE " + score)
                std.Debug.log("hx_events: events", events);
                std.Debug.log("hx_events: active", em.m.ActiveEvent);
            // }
        }

        // local selectEvent = o.selectEvent;
        // o.selectEvent = function() {
        //     local gen = selectEvent();
        //     while (true) {
        //         if (resume gen == true) {
        //             showEvents(this);
        //             return true;
        //         }
        //         if (this.m.ActiveEvent) showEvents(this);
        //         yield false;
        //     }
        // }

        o.selectEvent = function () {
            // Function is a generator.
            local score = 0;
            local eventToFire;
            local isNewsReady = this.World.Statistics.isNewsReady();

            for( local i = 0; i < this.m.Events.len(); i = ++i )
            {
                if (this.m.LastEventID == this.m.Events[i].getID() && !this.m.Events[i].isSpecial())
                {
                    this.m.Events[i].clear();
                }
                else
                {
                    this.m.Events[i].update();
                }
                // Instrumenting
                local event = this.m.Events[i];
                if (event.getScore() > 0) {
                    local timeSinceBattle = this.Time.getVirtualTimeF() - this.m.LastBattleTime;
                    this.logInfo("selectEvent " + i + " " + event.getID()
                        + " SCORE=" + event.getScore() + " special=" + event.isSpecial()
                        + (isNewsReady ? " NEWS" : "")
                        + (timeSinceBattle < 5.0? " AFTER BATTLE " + timeSinceBattle + "/5.0" : ""))
                }

                if (i % 2 == 0)
                {
                    yield false;
                }

                if (this.m.Events[i].getScore() <= 0 || isNewsReady && this.m.Events[i].getScore() < 2000 || this.Time.getVirtualTimeF() - this.m.LastBattleTime < 5.0 && this.m.Events[i].getScore() < 500)
                {
                }
                else
                {
                    score = score + this.m.Events[i].getScore();
                }
            }

            local pick = this.Math.rand(1, score);
            yield false;

            local timeSinceBattle = this.Time.getVirtualTimeF() - this.m.LastBattleTime;
            this.logInfo("selectEvent after pick=" + pick + " score=" + score
                + (timeSinceBattle < 5.0 ? " AFTER BATTLE " + timeSinceBattle + "/5.0" : ""))

            for( local i = 0; i < this.m.Events.len(); i = ++i )
            {
                if (this.m.Events[i].getScore() <= 0 || isNewsReady && this.m.Events[i].getScore() < 2000 || this.Time.getVirtualTimeF() - this.m.LastBattleTime < 5.0 && this.m.Events[i].getScore() < 500)
                {
                }
                else
                {
                    if (pick <= this.m.Events[i].getScore())
                    {
                        eventToFire = this.m.Events[i];
                        break;
                    }

                    pick = pick - this.m.Events[i].getScore();
                }
            }

            if (eventToFire == null)
            {
                showEvents(this);
                this.logDebug("no event???");
                return true;
            }

            yield false;
            this.m.ActiveEvent = eventToFire;
            this.m.ActiveEvent.clear();
            this.m.ActiveEvent.update();
            showEvents(this);

            if (this.m.ActiveEvent.getScore() == 0)
            {
                this.logInfo("selectEvent SCORE ZERO " + this.m.ActiveEvent.getID());
                this.m.ActiveEvent.clear();
                this.m.ActiveEvent = null;
                return true;
            }

            if (this.m.ActiveEvent.getScore() < 500)
            {
                local parties = this.World.getAllEntitiesAtPos(this.World.State.getPlayer().getPos(), 400.0);

                foreach( party in parties )
                {
                    if (!party.isAlliedWithPlayer())
                    {
                        this.logInfo("selectEvent ENEMY AROUND " + this.m.ActiveEvent.getID()
                            + " party " + party.getName());
                        this.m.ActiveEvent.clear();
                        this.m.ActiveEvent = null;
                        return true;
                    }
                }
            }

            if (this.m.ActiveEvent.getScore() < 2000)
            {
                this.m.LastEventTime = this.Time.getVirtualTimeF();
            }

            this.logInfo("selectEvent fire " + this.m.ActiveEvent.getID());

            this.m.ActiveEvent.fire();
            this.m.IsEventShown = this.World.State.showEventScreen(this.m.ActiveEvent);
            return true;
        }


        local update = o.update;
        o.update = function () {
            if (this.World.State.getMenuStack().hasBacksteps() || this.LoadingScreen != null && (this.LoadingScreen.isAnimating() || this.LoadingScreen.isVisible()))
            {
                ::logInfo("hx_events: backsteps or loading");
                return;
            }

            if (("State" in this.Tactical) && this.Tactical.State != null)
            {
                ::logInfo("hx_events: tactical state");
                return;
            }

            if (this.m.ActiveEvent != null)
            {
                ::std.Debug.log("hx_events: active event", this.m.ActiveEvent);
                if (!this.m.IsEventShown && (this.m.ActiveEvent.getScore() != 0 || this.m.ActiveEvent.isSpecial()))
                {
                    if (!this.m.ActiveEvent.isSpecial() && this.m.ActiveEvent.getScore() < 500)
                    {
                        local parties = this.World.getAllEntitiesAtPos(this.World.State.getPlayer().getPos(), 400.0);

                        foreach( party in parties )
                        {
                            if (!party.isAlliedWithPlayer())
                            {
                                return;
                            }
                        }
                    }

                    if (this.m.ForceScreen != null)
                    {
                        this.m.ActiveEvent.setScreen(this.m.ActiveEvent.getScreen(this.m.ForceScreen));
                        this.m.ForceScreen = null;
                    }

                    this.m.IsEventShown = this.World.State.showEventScreen(this.m.ActiveEvent) != false;
                }

                return;
            }

            if (this.updateSpecialEvents())
            {
                ::std.Debug.log("hx_events: special events", this.m.ActiveEvent);
                return;
            }

            if (this.m.Thread != null)
            {
                // ::logInfo("hx_events: thread after special events");
                if (resume this.m.Thread != false)
                {
                    this.m.Thread = null;
                }
                // showEvents(this);

                return;
            }

            if (this.Time.getVirtualTimeF() - this.m.LastBattleTime < 2.0)
            {
                ::logInfo("hx_events: LastBattleTime "
                    + (this.Time.getVirtualTimeF() - this.m.LastBattleTime) + "/2.0");
                return;
            }

            if (this.m.LastEventTime + this.Const.Events.GlobalMinDelay > this.Time.getVirtualTimeF())
            {
                ::logInfo("hx_events: GlobalMinDelay "
                    + (this.Time.getVirtualTimeF() - this.m.LastEventTime) + "/" + Const.Events.GlobalMinDelay);
                return;
            }

            if (this.Time.getVirtualTimeF() - this.m.LastCheckTime <= this.World.getTime().SecondsPerHour * 2)
            {
                ::logInfo("hx_events: LastCheckTime "
                    + (this.Time.getVirtualTimeF() - this.m.LastCheckTime)
                    + "/" + (World.getTime().SecondsPerHour * 2));
                return;
            }

            this.m.LastCheckTime = this.Time.getVirtualTimeF();
            local timeSinceLastEvent = this.Time.getVirtualTimeF() - this.m.LastEventTime - this.Const.Events.GlobalMinDelay;
            local chanceToFireEvent = this.Const.Events.GlobalBaseChance + timeSinceLastEvent * this.Const.Events.GlobalChancePerSecond;
            ::logInfo("hx_events: !!! chanceToFireEvent " + chanceToFireEvent + " timeSinceLastEvent " + timeSinceLastEvent);

            if (this.Time.getVirtualTimeF() - this.m.LastBattleTime >= 5.0 && this.Math.rand(1, 100) > chanceToFireEvent)
            {
                ::logInfo("hx_events: NO LUCK");
                return;
            }

            local parties = this.World.getAllEntitiesAtPos(this.World.State.getPlayer().getPos(), 400.0);

            foreach( party in parties )
            {
                if (!party.isAlliedWithPlayer())
                {
                    ::logInfo("hx_events: enemies around");
                    return;
                }
            }

            ::logInfo("hx_events: selectEvent!!!");
            this.m.Thread = this.selectEvent();
            if (resume this.m.Thread != false)
            {
                this.m.Thread = null;
            }

            // showEvents(this);
        }
    })
})
