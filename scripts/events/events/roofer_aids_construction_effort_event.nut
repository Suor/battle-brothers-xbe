this.roofer_aids_construction_effort_event <- this.inherit("scripts/events/event", {
	m = {
		Town = null,
		Roofer = null
	},
	function create()
	{
		this.m.ID = "event.roofer_aids_construction_effort";
		this.m.Title = "In Town...";
		this.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_77.png[/img][M] While near the town of %townname%, your mercenary troop is approached by what appears to be a village elder and some desperate looking peasants. They look harmless enough, so you and your men leave your weapons sheathed and hear them out. The elder is the first to speak. %SPEECH_ON%Good day to you gents. I see that you are a crew of tough men with worldy knowledge about yourselves.%SPEECH_OFF% You tell the man to get to the point. %SPEECH_ON%Situation\'s like this, sir. One of our storehouse rooves collapsed just this morn. We\'ve no shortage of strong men or timber, but we lack a man with the ability to lay out roof tiles. Perhaps...?%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "%roofer%, sounds like you\'re perfect for the job.",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "This isn\'t our problem.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_77.png[/img][M] You nod towards %roofer% the roofer. %SPEECH_ON%Right, captain, suppose if you can spare me I can help the poor sods out.%SPEECH_OFF% The villagers perk up and lead %roofer% off in the direction of the ruined storehouse. \n\n After several hours, %roofer% returns, looking none the worse for the wear and holding a small pouch of crowns. %SPEECH_ON%Couple of younger lads picked up the knowledge damn quick, barely had to lift a finger myself other than to show \'em how to lay out the tiles. Good thing, cause the little squirts could climb up there faster than I could. Paid me well, too. Drinks on me tonight!%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Roofer.getImagePath());
				this.World.Assets.addMoney(100);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]100[/color] Crowns"
				});
				_event.m.Roofer.improveMood(1.0, "Used his past expertise to make some easy money");

				if (_event.m.Roofer.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Roofer.getMoodState()],
						text = _event.m.Roofer.getName() + this.Const.MoodStateEvent[_event.m.Roofer.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getTile().getDistanceTo(playerTile) <= 4)
			{
				nearTown = true;
				town = t;
				break;
			}
		}

		if (!nearTown)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates_roofer = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_roofer")
			{
				candidates_roofer.push(b);
			}
		}

		if (candidates_roofer.len() == 0)
		{
			return;
		}

		this.m.Town = town;
		this.m.Roofer = candidates_roofer[this.Math.rand(0, candidates_roofer.len() - 1)];
		this.m.Score = candidates_roofer.len() * 50;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"roofer",
			this.m.Roofer.getName()
		]);
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
	}

	function onClear()
	{
		this.m.Town = null;
		this.m.Roofer = null;
	}

});

