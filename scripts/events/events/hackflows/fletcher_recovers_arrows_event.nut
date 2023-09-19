this.fletcher_recovers_arrows_event <- this.inherit("scripts/events/event", {
	m = {
		Fletcher = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_fletcher_recovers_arrows";
		this.m.Title = "After the battle...";
		this.m.Cooldown = 10.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_22.png[/img][M] You survey the result of the gruesome fight. As you trudge through the heap of lifeless meat and broken remnants, you spy %fletcher% kicking bodies about and digging amongst the carnage. %SPEECH_ON%I can salvage some of the ammunition we spent here, sir. We can use it again someday to kill more of these bastards.%SPEECH_OFF% As he says this, he pulls an arrow by the shaft out of an eye socket; the action produces a sickening squelch as the eyeball is pulled out as well.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Excellent.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Fletcher.getImagePath());
				local amount = this.Math.rand(10, 20);

				if (_event.m.Fletcher.getBackground().getID() == "background.hackflows_fletcher")
				{
					amount = amount + 15;
				}

				this.World.Assets.addAmmo(amount);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_ammo.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + amount + "[/color] Ammunition."
				});
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.Statistics.getFlags().getAsInt("LastCombatResult") != 1)
		{
			return;
		}

		if (this.Time.getVirtualTimeF() - this.World.Events.getLastBattleTime() > 6.0)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_fletcher = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_fletcher" || b.getBackground().getID() == "background.bowyer" || b.getBackground().getID() == "background.hackflows_atilliator")
			{
				candidates_fletcher.push(b);
			}
		}

		if (candidates_fletcher.len() == 0)
		{
			return;
		}

		this.m.Fletcher = candidates_fletcher[this.Math.rand(0, candidates_fletcher.len() - 1)];
		this.m.Score = candidates_fletcher.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"fletcher",
			this.m.Fletcher.getName()
		]);
	}

	function onClear()
	{
		this.m.Fletcher = null;
	}

});

