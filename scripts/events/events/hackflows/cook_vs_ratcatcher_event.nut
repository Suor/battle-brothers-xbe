this.cook_vs_ratcatcher_event <- this.inherit("scripts/events/event", {
	m = {
		Cook = null,
		Ratcatcher = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_cook_vs_ratcatcher";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_52.png[/img][M] As the company stops for a brief rest, you hear a commotion near the supply caravan. You stride over to investigate and discover %ratcatcher% the ratcatcher arguing heatedly with %cook% the cook. %SPEECH_ON%Look, my lil fella always stays in my breast pocket anyhow. I feed \'im with morsels from my share of the provisions, and he never wanders far. None o\' the other lads have complained, what\'s the deal throwin\' such a hissy fit?%SPEECH_OFF% As you look on from out of sight, you see that %ratcatcher% has a pet rat nestled into his coat pocket, evidenced only by a tail hanging out the top and a gentle quivering of the lump in the cloth. %cook% seems to be beside himself at the concept of a pet rat. %SPEECH_ON%Keeping these squealy shits within spitting distance of the provisions. Are you mad? Where rats go, disease and pestilence are sure to follow! We paid folk like you to rid us of them, not to make friends with the fuzzy, diseased bastards!%SPEECH_OFF% %ratcatcher% raises his voice as well and retorts, %SPEECH_ON%I keep \'im cleaner than you are, ya fat fuck! Even if he did sneak into the supplies the damage would be peanuts compared to the havoc your greasy paws have wreaked on our larders!%SPEECH_OFF% You look around and it seems the rest of the men have remained uninterested in this squabble. You decide it best not to play the nanny this time around and move off to relieve yourself.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Best to let the two sort this out themselves.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cook.getImagePath());
				this.Characters.push(_event.m.Ratcatcher.getImagePath());
				_event.m.Cook.worsenMood(1.0, "Got into an argument over food sanitation practices");

				if (_event.m.Cook.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Cook.getMoodState()],
						text = _event.m.Cook.getName() + this.Const.MoodStateEvent[_event.m.Cook.getMoodState()]
					});
				}

				_event.m.Ratcatcher.worsenMood(1.0, "Got into an argument over food sanitation practices");

				if (_event.m.Ratcatcher.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Ratcatcher.getMoodState()],
						text = _event.m.Ratcatcher.getName() + this.Const.MoodStateEvent[_event.m.Ratcatcher.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_cook = [];
		local candidates_ratcatcher = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.ratcatcher")
			{
				candidates_ratcatcher.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_cook")
			{
				candidates_cook.push(b);
			}
		}

		if (candidates_cook.len() == 0 || candidates_ratcatcher.len() == 0)
		{
			return;
		}

		this.m.Cook = candidates_cook[this.Math.rand(0, candidates_cook.len() - 1)];
		this.m.Ratcatcher = candidates_ratcatcher[this.Math.rand(0, candidates_ratcatcher.len() - 1)];
		this.m.Score = 15 * (candidates_cook.len() + candidates_ratcatcher.len());
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
			"ratcatcher",
			this.m.Ratcatcher.getName()
		]);
	}

	function onClear()
	{
		this.m.Cook = null;
		this.m.Ratcatcher = null;
	}

});

