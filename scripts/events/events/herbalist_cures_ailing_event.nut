this.herbalist_cures_ailing_event <- this.inherit("scripts/events/event", {
	m = {
		Herbalist = null,
		AilingBro = null
	},
	function create()
	{
		this.m.ID = "event.herbalist_cures_ailing";
		this.m.Title = "On the Road...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_128.png[/img][M] While on the march, you hear %ailingBro% retching pitifully near the back of the formation. It could have been something he ate, something in the air, the smell of blood from the last battle, or whatever other horse shite reason. \n\n As the company is forced to slow down for what seems like the 10th time today, %herbalist% reaches into his personal pack, pulls out a vial of green solution, and hands it to %ailingBro%. %SPEECH_ON%Drink this.%SPEECH_OFF%. %ailingBro% grimaces and complains, %SPEECH_ON%You tryin\' to kill me, ya farkin\' kook? Can\'t you tell I\'m green enough as is?%SPEECH_OFF% You tell him that as it is, his illness is already slowing progress to a crawl. %ailingBro% begrdugingly accepts the vial and holds back his heaving long enough to down the contents in one go. \n\n He immediately begins sputtering and cursing at the horrifically bitter taste, with the worst of the insults directed at %herbalist% and his mother. %herbalist% seems to take this in stride. %SPEECH_ON%Words won\'t have an effect on me, so long as they keep you from spilling your guts onto my boots.%SPEECH_OFF% %ailingBro% pauses briefly in realization before lowering his head, offering a surprisingly sincere apology, and falling back into line.",
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
				this.Characters.push(_event.m.AilingBro.getImagePath());
				_event.m.AilingBro.getSkills().removeByID("trait.ailing");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_59.png",
					text = _event.m.AilingBro.getName() + " is no longer ailing"
				});
				_event.m.Herbalist.improveMood(0.5, "Restored the vitality of an ailing brother");

				if (_event.m.Herbalist.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Herbalist.getMoodState()],
						text = _event.m.Herbalist.getName() + this.Const.MoodStateEvent[_event.m.Herbalist.getMoodState()]
					});
				}

				_event.m.AilingBro.improveMood(1.5, "Had his vitality restored by an herbalist");

				if (_event.m.AilingBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.AilingBro.getMoodState()],
						text = _event.m.AilingBro.getName() + this.Const.MoodStateEvent[_event.m.AilingBro.getMoodState()]
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
		local candidates_ailingBro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.ailing"))
			{
				candidates_ailingBro.push(b);
			}
			else if (b.getBackground().getID() == "background.herbalist" && b.getLevel() >= 4)
			{
				candidates_herbalist.push(b);
			}
		}

		if (candidates_ailingBro.len() == 0 || candidates_herbalist.len() == 0)
		{
			return;
		}

		this.m.Herbalist = candidates_herbalist[this.Math.rand(0, candidates_herbalist.len() - 1)];
		this.m.AilingBro = candidates_ailingBro[this.Math.rand(0, candidates_ailingBro.len() - 1)];
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
			"ailingBro",
			this.m.AilingBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Herbalist = null;
		this.m.AilingBro = null;
	}

});

