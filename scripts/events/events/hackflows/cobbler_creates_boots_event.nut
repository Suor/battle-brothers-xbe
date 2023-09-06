this.cobbler_creates_boots_event <- this.inherit("scripts/events/event", {
	m = {
		Cobbler = null,
		OtherBro1 = null,
		OtherBro2 = null,
		OtherBro3 = null
	},
	function create()
	{
		this.m.ID = "event.cobbler_creates_boots";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_134.png[/img][M] %cobbler% the shoemaker approaches you. %SPEECH_ON%Say, captain. I\'ve been with the company for a good amount of time now, gotten used to fighting, defensive footwork and all that. Managed to spare some time to craft a few pairs of combat boots. Nice and lightweight, sturdy enough for marching in the cold. They cost more than what I used to make in half a year but thanks to this company I\'ve been able to sell a few pairs on the side. Figured as thanks some of our boys deserved some better gear.%SPEECH_OFF% He drops of a few pair of boots of surprising quality. %SPEECH_ON%More where that came from, sir.%SPEECH_OFF% You shake your head as he walks away. Had a lifetime of poverty hidden away this shoemaker\'s talents?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Damn, these are comfy.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cobbler.getImagePath());
				_event.m.Cobbler.improveMood(1, "Put his shoemaking skills to good use.");
				_event.m.OtherBro1.getBaseProperties().MeleeDefense += 5;
				_event.m.OtherBro2.getBaseProperties().MeleeDefense += 5;
				_event.m.OtherBro3.getBaseProperties().MeleeDefense += 5;
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.OtherBro1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+5[/color] Melee Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.OtherBro2.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+5[/color] Melee Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.OtherBro3.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+5[/color] Melee Defense"
				});
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 5)
		{
			return;
		}

		local candidates_cobbler = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_cobbler" && b.getLevel() >= 7)
			{
				candidates_cobbler.push(b);
			}
			else if (this.m.OtherBro1 == null)
			{
				this.m.OtherBro1 = b;
			}
			else if (this.m.OtherBro2 == null)
			{
				this.m.OtherBro2 = b;
			}
			else if (this.m.OtherBro3 == null)
			{
				this.m.OtherBro3 = b;
			}
		}

		if (candidates_cobbler.len() == 0 || this.m.OtherBro1 == null || this.m.OtherBro2 == null || this.m.OtherBro3 == null)
		{
			return;
		}

		this.m.Cobbler = candidates_cobbler[this.Math.rand(0, candidates_cobbler.len() - 1)];
		this.m.Score = candidates_cobbler.len() * 20;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"otherBro1",
			this.m.OtherBro1.getName()
		]);
		_vars.push([
			"otherBro2",
			this.m.OtherBro2.getName()
		]);
		_vars.push([
			"otherBro3",
			this.m.OtherBro3.getName()
		]);
		_vars.push([
			"cobbler",
			this.m.Cobbler.getName()
		]);
	}

	function onClear()
	{
		this.m.Cobbler = null;
		this.m.OtherBro1 = null;
		this.m.OtherBro2 = null;
		this.m.OtherBro3 = null;
	}

});

