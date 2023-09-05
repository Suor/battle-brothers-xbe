this.herbalist_cures_asthma_event <- this.inherit("scripts/events/event", {
	m = {
		Herbalist = null,
		AsthmaticBro = null
	},
	function create()
	{
		this.m.ID = "event.herbalist_cures_asthma";
		this.m.Title = "On the March...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_128.png[/img][M] While on the march, you hear %asthmaticBro% wheezing near the back of the formation. He has always had problems keeping up on account of his lung condition, but today in particular the company is being held up much more than usual. \n\n That is, until %herbalist% pulls out a mixture of herbal medicine and smellingsalts and hands them over to %asthmaticBro%. \n\n His nose wrinkles after the first whiff, but the remedy has an immediate effect. %asthmaticBro% grins and thanks %herbalist% enthusiastically. It seems that the provided trinket has offset the negative effects of his asthma!",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We\'re lucky to have an herbalist with us.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Herbalist.getImagePath());
				this.Characters.push(_event.m.AsthmaticBro.getImagePath());
				_event.m.AsthmaticBro.getSkills().removeByID("trait.asthmatic");
				this.List = [
					{
						id = 10,
						icon = "ui/traits/trait_icon_22.png",
						text = _event.m.AsthmaticBro.getName() + " is no longer asthmatic"
					}
				];
				_event.m.Herbalist.improveMood(0.5, "Cured a fellow brother of asthma");

				if (_event.m.Herbalist.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Herbalist.getMoodState()],
						text = _event.m.Herbalist.getName() + this.Const.MoodStateEvent[_event.m.Herbalist.getMoodState()]
					});
				}

				_event.m.AsthmaticBro.improveMood(1.5, "Was cured of his asthma");

				if (_event.m.AsthmaticBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.AsthmaticBro.getMoodState()],
						text = _event.m.AsthmaticBro.getName() + this.Const.MoodStateEvent[_event.m.AsthmaticBro.getMoodState()]
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

		local candidates_herbalist = [];
		local candidates_asthmaticBro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.asthmatic"))
			{
				candidates_asthmaticBro.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_herbalist" && b.getLevel() >= 4)
			{
				candidates_herbalist.push(b);
			}
		}

		if (candidates_asthmaticBro.len() == 0 || candidates_herbalist.len() == 0)
		{
			return;
		}

		this.m.Herbalist = candidates_herbalist[this.Math.rand(0, candidates_herbalist.len() - 1)];
		this.m.AsthmaticBro = candidates_asthmaticBro[this.Math.rand(0, candidates_asthmaticBro.len() - 1)];
		this.m.Score = 15 * candidates_herbalist.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"herbalist",
			this.m.Herbalist.getName()
		]);
		_vars.push([
			"asthmaticBro",
			this.m.AsthmaticBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Herbalist = null;
		this.m.AsthmaticBro = null;
	}

});

