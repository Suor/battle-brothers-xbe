this.cartographer_discovers_location_event <- this.inherit("scripts/events/event", {
	m = {
		Cartographer = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_cartographer_discovers_location";
		this.m.Title = "At Camp...";
		this.m.Cooldown = 5.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_45.png[/img][M] As you are making your nightly rounds checking up on the status of your men, you pass by %cartographer%\'s tent and discover the man deep in thought, a stick in hand and with several scrolls sprawled out on a small bench before him. He looks up at you and nods. %SPEECH_ON%Ho, captain. Been examining some of the maps I created during our travels. Got my hands on some new ones during our travels too. I think I\'ve triangulated the location of something interesting...%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "What info do you have?",
					function getResult( _event )
					{
						local randomNum = this.Math.rand(0, 2);

						if (randomNum == 0)
						{
							return "B";
						}
						else if (randomNum == 1)
						{
							return "C";
						}
						else
						{
							return "D";
						}
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cartographer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_45.png[/img][M] The cartographer furrows his brow in concentration before tapping his stick onto a few different pieces of parchment at particular places. %SPEECH_ON%Judging by the pattern of attacks from brigands and barbarians, and the landmarks that the survivors of such attacks described, there likely is a camp they\'ve made their base at around here...%SPEECH_OFF%The two of you converse more and you take careful notes about the cartographer\'s discovery.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Good to know where the knaves have their home base.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cartographer.getImagePath());
				local banditSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getSettlements();
				local barbarianSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Barbarians).getSettlements();
				local undiscoveredDestinations = [];

				foreach( settlement in banditSettlements )
				{
					local destination = this.WeakTableRef(settlement);

					if (!destination.isDiscovered())
					{
						undiscoveredDestinations.push(destination);
					}
				}

				foreach( settlement in barbarianSettlements )
				{
					local destination = this.WeakTableRef(settlement);

					if (!destination.isDiscovered())
					{
						undiscoveredDestinations.push(destination);
					}
				}

				local finalDestination = undiscoveredDestinations[this.Math.rand(0, undiscoveredDestinations.len() - 1)];

				if (finalDestination != null)
				{
					finalDestination.setDiscovered(true);
					this.World.uncoverFogOfWar(finalDestination.getTile().Pos, 500.0);
					this.World.getCamera().moveTo(finalDestination.get());
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",
						text = "Your cartographer uncovered the location of a camp"
					});
				}
				else
				{
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",
						text = "Your cartographer discovered a camp, but you already knew of its existence"
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_45.png[/img][M] The cartographer furrows his brow in concentration before tapping his stick onto a few different pieces of parchment at particular places. %SPEECH_ON%I used several incomplete local maps and compared the position of major landmarks to the world map I\'ve been drawing up as we travel. By my guess, there should be a tomb or other such undead location around this area...%SPEECH_OFF%The two of you converse more and you take careful notes about the cartographer\'s discovery.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Good that we know of a source of the undead scourge.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cartographer.getImagePath());
				local zombieSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).getSettlements();
				local undeadSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Zombies).getSettlements();
				local undiscoveredDestinations = [];

				foreach( settlement in zombieSettlements )
				{
					local destination = this.WeakTableRef(settlement);

					if (!destination.isDiscovered())
					{
						undiscoveredDestinations.push(destination);
					}
				}

				foreach( settlement in undeadSettlements )
				{
					local destination = this.WeakTableRef(settlement);

					if (!destination.isDiscovered())
					{
						undiscoveredDestinations.push(destination);
					}
				}

				local finalDestination = undiscoveredDestinations[this.Math.rand(0, undiscoveredDestinations.len() - 1)];

				if (finalDestination != null)
				{
					finalDestination.setDiscovered(true);
					this.World.uncoverFogOfWar(finalDestination.getTile().Pos, 500.0);
					this.World.getCamera().moveTo(finalDestination.get());
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",
						text = "Your cartographer uncovered the location of a camp"
					});
				}
				else
				{
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",
						text = "Your cartographer discovered a camp, but you already knew of its existence"
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_45.png[/img][M] The cartographer furrows his brow in concentration before tapping his stick onto a few different pieces of parchment at particular places. %SPEECH_ON%Looks like several different sources confirm that this area is a hub of greenskin activity. There is almost certainly a camp of the bastards somewhere in this area...%SPEECH_OFF%The two of you converse more and you take careful notes about the cartographer\'s discovery.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Good to be aware of the greenskin threat in that area.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cartographer.getImagePath());
				local goblinSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Goblins).getSettlements();
				local orcSettlements = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getSettlements();
				local undiscoveredDestinations = [];

				foreach( settlement in orcSettlements )
				{
					local destination = this.WeakTableRef(settlement);

					if (!destination.isDiscovered())
					{
						undiscoveredDestinations.push(destination);
					}
				}

				foreach( settlement in goblinSettlements )
				{
					local destination = this.WeakTableRef(settlement);

					if (!destination.isDiscovered())
					{
						undiscoveredDestinations.push(destination);
					}
				}

				local finalDestination = undiscoveredDestinations[this.Math.rand(0, undiscoveredDestinations.len() - 1)];

				if (finalDestination != null)
				{
					finalDestination.setDiscovered(true);
					this.World.uncoverFogOfWar(finalDestination.getTile().Pos, 500.0);
					this.World.getCamera().moveTo(finalDestination.get());
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",
						text = "Your cartographer uncovered the location of a camp"
					});
				}
				else
				{
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",
						text = "Your cartographer discovered a camp, but you already knew of its existence"
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.hackflows_cartographer")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Cartographer = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 40 * candidates.len();
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
	}

	function onClear()
	{
		this.m.Cartographer = null;
	}

});

