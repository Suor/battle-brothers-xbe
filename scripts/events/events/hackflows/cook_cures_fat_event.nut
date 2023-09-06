this.cook_cures_fat_event <- this.inherit("scripts/events/event", {
	m = {
		Cook = null,
		FatBro = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_cook_cures_fat";
		this.m.Title = "On the March...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_61.png[/img][M] It seems that having %cook% around has been having a positive effect on the more...portly members of the company. %fatBro% seems to have slimmed down significantly due to the quality of the meals that %cook% has been meticulously preparing. %cook% beams with pride. %SPEECH_ON%A well balanced meal; a well fed company. These things can win you battles before they even happen, captain!%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We\'re lucky to have an cook with us.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cook.getImagePath());
				this.Characters.push(_event.m.FatBro.getImagePath());
				_event.m.FatBro.getSkills().removeByID("trait.fat");
				this.List = [
					{
						id = 10,
						icon = "ui/traits/trait_icon_10.png",
						text = _event.m.FatBro.getName() + " is no longer fat"
					}
				];
				_event.m.Cook.improveMood(0.5, "Prepared meals that improved the health of a fellow brother.");

				if (_event.m.Cook.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Cook.getMoodState()],
						text = _event.m.Cook.getName() + this.Const.MoodStateEvent[_event.m.Cook.getMoodState()]
					});
				}

				_event.m.FatBro.improveMood(0.5, "Slimmed down from eating healthy meals.");

				if (_event.m.FatBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.FatBro.getMoodState()],
						text = _event.m.FatBro.getName() + this.Const.MoodStateEvent[_event.m.FatBro.getMoodState()]
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

		local candidates_cook = [];
		local candidates_fatBro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.fat"))
			{
				candidates_fatBro.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_cook" && b.getLevel() >= 2)
			{
				candidates_cook.push(b);
			}
		}

		if (candidates_fatBro.len() == 0 || candidates_cook.len() == 0)
		{
			return;
		}

		this.m.Cook = candidates_cook[this.Math.rand(0, candidates_cook.len() - 1)];
		this.m.FatBro = candidates_fatBro[this.Math.rand(0, candidates_fatBro.len() - 1)];
		this.m.Score = 15 * candidates_cook.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"cook",
			this.m.Cook.getName()
		]);
		_vars.push([
			"fatBro",
			this.m.FatBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Cook = null;
		this.m.FatBro = null;
	}

});

