this.cook_prepares_delicious_meals_event <- this.inherit("scripts/events/event", {
	m = {
		Cook = null
	},
	function create()
	{
		this.m.ID = "event.cook_prepares_delicious_meals";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_61.png[/img][M] The morale of the men has recently seemed to be at an all time high. You muse to yourself that you could attribute this to a variety of reasons; perhaps recent victories on the battlefield, wages coming in consistently, or even the concept of glory as the company increases in renown.\n\n Of course, you\'d be lying to yourself if the true reason wasn\'t abundantly obvious and simple: the food.\n\n Now that %cook% the cook has been integrated with %companyname% for some time, it seems that he has taken a particular interest in applying the skills of his previous profession to benefit his comrades. To say the man is able to work magic would be an understatement among the mercenaries. Even on days where provisions are short or particularly bland, %cook% manages to keep the daily fare somewhat interesting with methods and spices beyond the understanding of the culinary plebian.\n\n His efforts have not gone unnoticed, and more and more often other members of the %companyname% have offered to cover %cook%\'s guard duty shift in appreciation.\n\n After all, an army marches on its stomach!",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It really is amazing what effect a good cook can have on morale.",
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
					if (bro.getSkills().hasSkill("trait.spartan"))
					{
						continue;
					}
					else if (bro.getSkills().hasSkill("trait.gluttonous") || bro.getSkills().hasSkill("trait.fat"))
					{
						bro.improveMood(2.0, "Very much appreciated the meals prepped by the cook");
					}
					else
					{
						bro.improveMood(1.0, "Appreciated the meals prepped by the cook");
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

		foreach( b in brothers )
		{
			if (b.getBackground().getID() == "background.cook" && b.getLevel() >= 4)
			{
				candidates_cook.push(b);
			}
		}

		if (candidates_cook.len() == 0)
		{
			return;
		}

		this.m.Cook = candidates_cook[this.Math.rand(0, candidates_cook.len() - 1)];
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
	}

	function onClear()
	{
		this.m.Cook = null;
	}

});

