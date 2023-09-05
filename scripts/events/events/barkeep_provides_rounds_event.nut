this.barkeep_provides_rounds_event <- this.inherit("scripts/events/event", {
	m = {
		Barkeep = null,
		Town = null
	},
	function create()
	{
		this.m.ID = "event.barkeep_provides_rounds";
		this.m.Title = "Near Town...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_24.png[/img][M] As your company makes its way near town %barkeep% the barkeep approaches you. %SPEECH_ON%Hey captain. Been real good friends with the tavern owner here at %townname% for a few years now. Turns out our company is pretty well known around these parts, and whenever we show up in town business starts booming and the mead starts flowing.%SPEECH_OFF% You ask him why he\'s bothering to tell you now. He grins. %SPEECH_ON%Business has been so good, he\'s managed to upgrade his stock to some stuff that actually feels good going down. He wants us to be around when he pulls out the select reserve. Won\'t take no for an answer. What do ya say? Shall we go?%SPEECH_OFF% You agree and before long, you and your company are having a grand old time telling stories and drinking high quality alcohol.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Cheers!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getSkills().hasSkill("trait.ailing"))
					{
						continue;
					}
					else if (bro.getSkills().hasSkill("trait.addict") || bro.getSkills().hasSkill("trait.drunkard"))
					{
						bro.improveMood(2.0, "Very much appreciated the drinks.");
					}
					else
					{
						bro.improveMood(1.0, "Appreciated the round of drinks.");
					}

					if (bro.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}

				_event.m.Barkeep.improveMood(0.5, "Sourced some good drinks.");

				if (_event.m.Barkeep.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Barkeep.getMoodState()],
						text = _event.m.Barkeep.getName() + this.Const.MoodStateEvent[_event.m.Barkeep.getMoodState()]
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
		local towns = this.World.EntityManager.getSettlements();
		local playerTile = this.World.State.getPlayer().getTile();
		local nearTown = false;
		local town;

		if (brothers.len() < 2)
		{
			return;
		}

		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return;
		}

		foreach( t in towns )
		{
			if (t.isMilitary() || t.isSouthern())
			{
				continue;
			}

			local f = t.getFactionOfType(this.Const.FactionType.Settlement);
			this.logInfo(f);

			if (f.getPlayerRelation() >= 70 && t.getTile().getDistanceTo(playerTile) <= 3 && t.isAlliedWithPlayer())
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

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.barkeep")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Town = town;
		this.m.Barkeep = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = candidates.len() * 500;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"barkeep",
			this.m.Barkeep.getName()
		]);
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
	}

	function onClear()
	{
		this.m.Barkeep = null;
		this.m.Town = null;
	}

});

