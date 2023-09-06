this.tailor_cures_clumsy_event <- this.inherit("scripts/events/event", {
	m = {
		Tailor = null,
		ClumsyBro = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_tailor_cures_clumsy";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_13.png[/img][M] The %companyname% is on the march. For a band of killers for hire, things are quiet...almost too quiet. Then you realize that you can no longer hear the characteristic clanking of %clumsybro%\'s gear as he drops his weapon for the umpteenth fucking time.\n\n As it turns out, %tailor% the tailor has been training the clumsy oaf with a devastatingly simple technique. %clumsybro% now keeps a scrap of purple cloth wrapped tightly around his dominant hand and the grip of his sword. This alone seems to have been enough to allow %clumsybro% to swing his weapon with as much competence as any average man. He still trips over his own two feet occassionally, but at list his sword swings should be less haphazard from here on out.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Almost sounds too good to be true.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.ClumsyBro.getImagePath());
				this.Characters.push(_event.m.Tailor.getImagePath());
				_event.m.ClumsyBro.getSkills().removeByID("trait.clumsy");
				this.List = [
					{
						id = 10,
						icon = "ui/traits/trait_icon_36.png",
						text = _event.m.ClumsyBro.getName() + " is no longer clumsy"
					}
				];
				_event.m.Tailor.improveMood(0.5, "Used some spare cloth and a neat mental trick to improve a fellow brother");

				if (_event.m.Tailor.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Tailor.getMoodState()],
						text = _event.m.Tailor.getName() + this.Const.MoodStateEvent[_event.m.Tailor.getMoodState()]
					});
				}

				_event.m.ClumsyBro.improveMood(0.5, "No longer as hindered by clumsiness as he was before");

				if (_event.m.ClumsyBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.ClumsyBro.getMoodState()],
						text = _event.m.ClumsyBro.getName() + this.Const.MoodStateEvent[_event.m.ClumsyBro.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_tailor = [];
		local candidates_clumsybro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.clumsy"))
			{
				candidates_clumsybro.push(b);
			}
			else if (b.getBackground().getID() == "background.tailor" && b.getLevel() >= 5)
			{
				candidates_tailor.push(b);
			}
		}

		if (candidates_clumsybro.len() == 0 || candidates_tailor.len() == 0)
		{
			return;
		}

		this.m.Tailor = candidates_tailor[this.Math.rand(0, candidates_tailor.len() - 1)];
		this.m.ClumsyBro = candidates_clumsybro[this.Math.rand(0, candidates_clumsybro.len() - 1)];
		this.m.Score = 25 * candidates_tailor.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"tailor",
			this.m.Tailor.getName()
		]);
		_vars.push([
			"clumsybro",
			this.m.ClumsyBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Tailor = null;
		this.m.ClumsyBro = null;
	}

});

