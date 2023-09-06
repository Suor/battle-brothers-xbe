this.cobbler_cures_clubfooted_event <- this.inherit("scripts/events/event", {
	m = {
		Cobbler = null,
		ClubfootedBro = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_cobbler_cures_clubfooted";
		this.m.Title = "On the March...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_61.png[/img][M] Once again, while on the move, it seems that %clubfootedBro% is lagging behind on account of his deformed feet. Your men have jeered and ridiculed each other for much worse, so you can\'t help but wonder why %clubfootedBro% is being spared. \n\n However, one look at %clubfootedBro% says it all; he wears a grim, stoic expression, valiantly struggling forward step by step so as to not hold back his comrades. Your other men glance at you, and you are tempted to give the order to make camp, but before you are able to say a word %cobbler% the cobbler falls back and presents the straggler with a pair of unremarkable looking boots. %SPEECH_ON%This pair\'s specially made. Me pa taught me how long ago. Boots should even out your gait and save you some pain.%SPEECH_OFF% %clubfootedBro%\'s expression softens as he accepts the boots and puts them on. His face cracks open into a wide grin as he takes his first few steps. %SPEECH_ON%%cobbler%, I dunno what to say, I...%SPEECH_OFF% %cobber% cuts him off. %SPEECH_ON%Speed up and we call it even. I\'m sure you\'ll save my arse one day.%SPEECH_OFF% Your company gets moving before, both faster and happier than before.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We\'re lucky to have a cobbler with us.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cobbler.getImagePath());
				this.Characters.push(_event.m.ClubfootedBro.getImagePath());
				_event.m.ClubfootedBro.getSkills().removeByID("trait.clubfooted");
				this.List = [
					{
						id = 10,
						icon = "ui/traits/trait_icon_23.png",
						text = _event.m.ClubfootedBro.getName() + " is no longer clubfooted"
					}
				];
				_event.m.Cobbler.improveMood(0.5, "Fashioned some boots that helped a fellow brother.");

				if (_event.m.Cobbler.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Cobbler.getMoodState()],
						text = _event.m.Cobbler.getName() + this.Const.MoodStateEvent[_event.m.Cobbler.getMoodState()]
					});
				}

				_event.m.ClubfootedBro.improveMood(1.5, "Received special footwear that helps him walk comfortably.");

				if (_event.m.ClubfootedBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.ClubfootedBro.getMoodState()],
						text = _event.m.ClubfootedBro.getName() + this.Const.MoodStateEvent[_event.m.ClubfootedBro.getMoodState()]
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

		local candidates_cobbler = [];
		local candidates_clubfootedBro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.clubfooted"))
			{
				candidates_clubfootedBro.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_cobbler" && b.getLevel() >= 2)
			{
				candidates_cobbler.push(b);
			}
		}

		if (candidates_clubfootedBro.len() == 0 || candidates_cobbler.len() == 0)
		{
			return;
		}

		this.m.Cobbler = candidates_cobbler[this.Math.rand(0, candidates_cobbler.len() - 1)];
		this.m.ClubfootedBro = candidates_clubfootedBro[this.Math.rand(0, candidates_clubfootedBro.len() - 1)];
		this.m.Score = 15 * candidates_cobbler.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"cobbler",
			this.m.Cobbler.getName()
		]);
		_vars.push([
			"clubfootedBro",
			this.m.ClubfootedBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Cobbler = null;
		this.m.ClubfootedBro = null;
	}

});

