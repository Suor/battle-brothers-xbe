this.leper_gets_sick_event <- this.inherit("scripts/events/event", {
	m = {
		Leper = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_leper_gets_sick";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 20.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_18.png[/img][M] While on the march, you notice %leper% the leper lagging behind, shoulders sagging and back heaving. It seems that whatever affliction causing the damage to his skin has made him more vulnerable to conventional illnesses as well.\n\n You shake your head in sympathy of your comrade\'s plight, but make sure to remain at a safe distance. As if on cue, a few moments later %leper% doubles over and his most recent meal makes a surprise reappearance. Fortunately enough, the spray splatters harmlessly on the ground. In a profession filled with more than its fair share of vile odors, dealing with one less stench is in and of itself a blessing.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Gross...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Leper.getImagePath());
				local effect = this.new("scripts/skills/injury/sickness_injury");
				_event.m.Leper.getSkills().add(effect);
				this.List = [
					{
						id = 10,
						icon = effect.getIcon(),
						text = _event.m.Leper.getName() + " is sick"
					}
				];
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.hackflows_leper")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Leper = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 20 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"leper",
			this.m.Leper.getName()
		]);
	}

	function onClear()
	{
		this.m.Leper = null;
	}

});

