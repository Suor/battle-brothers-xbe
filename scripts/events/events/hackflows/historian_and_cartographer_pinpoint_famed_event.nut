this.historian_and_cartographer_pinpoint_famed_event <- this.inherit("scripts/events/event", {
	m = {
		Cartographer = null,
		Historian = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_historian_and_cartographer_pinpoint_famed";
		this.m.Title = "During Camp...";
		this.m.Cooldown = 12.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_45.png[/img][M] You are in the middle of taking inventory when %cartographer% the cartographer and %historian% the historian both rush in and simultaneously begin chattering excitedly. You roar at them to get a grip and the two abruptly fall silent and look at each other. After a brief pause, %historian% speaks up. %SPEECH_ON%Sir, we have something quite important to report to you. I have been keeping tabs on rumors of named items and combining what I\'ve heard with my personal knowledge and study materials. It was mostly for some idle fun...it certainly beats conversation with most of the brutes in the %companyname%. I didn\'t expect anything to come of it, until I got to talking with %cartographer% here...%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Get to the point.",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cartographer.getImagePath());
				this.Characters.push(_event.m.Historian.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_45.png[/img][M] The historian continues. %SPEECH_ON%The mapmaker here has also been keeping notes of landmarks and locations to identify some places of interest for us. The two of us are almost certain that there is something around here housing a famous item.%SPEECH_OFF% The cartographer unfurls a map and the historian jabs a finger to a spot. %SPEECH_ON%It could be anything; a piece of armor, a weapon, maybe even a shield or helm. Sadly my information lacks a proper description of what the item is. I\'d stake fifty days of wages that if we cleared the area we would find something incredible though!%SPEECH_OFF% The two men grin broadly. As you examine their papers you muse that obtaining famous items would certainly go far towards boosting the strength and renown of %companyname%.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "What are we waiting for? We go grab it!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cartographer.getImagePath());
				this.Characters.push(_event.m.Historian.getImagePath());
				local goblinSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Goblins).getSettlements();
				local orcSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getSettlements();
				local zombieSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).getSettlements();
				local undeadSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Zombies).getSettlements();
				local banditSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getSettlements();
				local barbarianSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Barbarians).getSettlements();
				local selector = this.Math.rand(0, 5);
				local settlementPool;

				if (selector == 0)
				{
					settlementPool = goblinSettlements;
				}
				else if (selector == 1)
				{
					settlementPool = orcSettlements;
				}
				else if (selector == 2)
				{
					settlementPool = zombieSettlements;
				}
				else if (selector == 3)
				{
					settlementPool = undeadSettlements;
				}
				else if (selector == 4)
				{
					settlementPool = banditSettlements;
				}
				else
				{
					settlementPool = barbarianSettlements;
				}

				local settlement = settlementPool[this.Math.rand(0, settlementPool.len() - 1)];
				local destination = this.WeakTableRef(settlement);
				local destinationName = settlement.getName();
				destination.setDiscovered(true);
				this.World.uncoverFogOfWar(destination.getTile().Pos, 500.0);
				this.World.getCamera().moveTo(destination.get());
				this.List.push({
					id = 10,
					icon = "ui/icons/special.png",
					text = "Your cartographer uncovered a location named " + destinationName
				});
				local type = this.Math.rand(20, 100);

				if (type <= 50)
				{
					local weapons = clone this.Const.Items.NamedWeapons;

					if (settlement.m.NamedWeaponsList != null && settlement.m.NamedWeaponsList.len() != 0)
					{
						weapons.extend(settlement.m.NamedWeaponsList);
						weapons.extend(settlement.m.NamedWeaponsList);
					}

					settlement.m.Loot.add(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
				}
				else if (type <= 60)
				{
					local shields = clone this.Const.Items.NamedShields;

					if (settlement.m.NamedShieldsList != null && settlement.m.NamedShieldsList.len() != 0)
					{
						shields.extend(settlement.m.NamedShieldsList);
						shields.extend(settlement.m.NamedShieldsList);
					}

					settlement.m.Loot.add(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
				}
				else if (type <= 80)
				{
					local helmets = clone this.Const.Items.NamedHelmets;

					if (settlement.m.NamedHelmetsList != null && settlement.m.NamedHelmetsList.len() != 0)
					{
						helmets.extend(settlement.m.NamedHelmetsList);
						helmets.extend(settlement.m.NamedHelmetsList);
					}

					settlement.m.Loot.add(this.new("scripts/items/" + helmets[this.Math.rand(0, helmets.len() - 1)]));
				}
				else if (type <= 100)
				{
					local armor = clone this.Const.Items.NamedArmors;

					if (settlement.m.NamedArmorsList != null && settlement.m.NamedArmorsList.len() != 0)
					{
						armor.extend(settlement.m.NamedArmorsList);
						armor.extend(settlement.m.NamedArmorsList);
					}

					settlement.m.Loot.add(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
				}

				this.List.push({
					id = 10,
					icon = "ui/icons/special.png",
					text = "Your historian has tracked down some kind of famed item to this location"
				});
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_cartographer = [];
		local candidates_historian = [];
		local scoreMultiplier = 1;

		foreach( b in brothers )
		{
			if (b.getBackground().getID() == "background.historian")
			{
				scoreMultiplier = scoreMultiplier + b.getLevel();
				candidates_historian.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_cartographer")
			{
				scoreMultiplier = scoreMultiplier + b.getLevel();
				candidates_cartographer.push(b);
			}
		}

		if (candidates_cartographer.len() == 0 || candidates_historian.len() == 0)
		{
			return;
		}

		this.m.Cartographer = candidates_cartographer[this.Math.rand(0, candidates_cartographer.len() - 1)];
		this.m.Historian = candidates_historian[this.Math.rand(0, candidates_historian.len() - 1)];
		this.m.Score = 20 * scoreMultiplier * (candidates_cartographer.len() + candidates_historian.len());

		if (this.World.Assets.getOrigin().getID() == "scenario.hackflows_treasure_hunters")
		{
			this.m.Score *= 2;
		}
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"cartographer",
			this.m.Cartographer.getName()
		]);
		_vars.push([
			"historian",
			this.m.Historian.getName()
		]);
	}

	function onClear()
	{
		this.m.Cartographer = null;
		this.m.Historian = null;
	}

});

