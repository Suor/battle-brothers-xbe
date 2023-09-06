this.torturer_removes_fainthearted_event <- this.inherit("scripts/events/event", {
	m = {
		Torturer = null,
		FaintheartedBro = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_torturer_removes_fainthearted";
		this.m.Title = "During a Spare Moment...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_64.png[/img][M] During the monotonous march to the company\'s next great adventure, you pass within earshot of %torturer% and %faintheartedbro%. You internally raise an eyebrow, as the torturer has always been chatty about his previous occupation and %faintheartedbro% has been quite faint of heart ever since he joined the company. %faintheartedbro% has frequently not-so-subtly avoided marching in line with %torturer% before.\n\n You imagine that %faintheartedbro% would be cringing at whatever gruesome tales that the torturer had to tell, but instead you see the man rather cheerfully listening to his companion.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let\'s listen in on the conversation...",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.FaintheartedBro.getImagePath());
				this.Characters.push(_event.m.Torturer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[M]%SPEECH_ON%So you see, %faintheartedbro%, the tales I tell are of breaking downright stout-hearted men. Knights that wouldn\'t bat an eyelash at cutting down wee lads and fair lasses for their lords, spies indoctrinated with crazy patriotism for their noble houses, sellswords who\'ve seen all of that and then some. Truth is most men are rather pathetic sods, and even draggin\' them before the table is enough to set \'em howling that they\'ll submit.%SPEECH_OFF% The torturer shakes his head. %SPEECH_ON%Takes the fun out of it, I say. Anyhow, %faintheartedbro%, just standing out on the battlefield facing down the shite we face for coin means you got more guts than plenty of men I\'ve carved open in the past. We can prove it later if you like.%SPEECH_OFF% At this, %torturer% grins as %faintheartedbro%\'s expression briefly distorts into horror before realizing the joke and belting out a heartier guffaw than normal. As you fall back into line, it seems that the encouragement from the torturer was not lost on %faintheartedbro%. His march is with renewed purpose, his back a little straighter. You hope that this turn in attitude will carry over to the battlefield.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Looks like the scaredy cat\'s got some guts now.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Torturer.getImagePath());
				this.Characters.push(_event.m.FaintheartedBro.getImagePath());
				_event.m.FaintheartedBro.getSkills().removeByID("trait.fainthearted");
				this.List = [
					{
						id = 10,
						icon = "ui/traits/trait_icon_41.png",
						text = _event.m.FaintheartedBro.getName() + " is no longer fainthearted"
					}
				];
				_event.m.Torturer.improveMood(0.5, "Used his past to give a nice pep talk");

				if (_event.m.Torturer.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Torturer.getMoodState()],
						text = _event.m.Torturer.getName() + this.Const.MoodStateEvent[_event.m.Torturer.getMoodState()]
					});
				}

				_event.m.FaintheartedBro.improveMood(0.5, "Got over his squeamishness of combat");

				if (_event.m.FaintheartedBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.FaintheartedBro.getMoodState()],
						text = _event.m.FaintheartedBro.getName() + this.Const.MoodStateEvent[_event.m.FaintheartedBro.getMoodState()]
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

		local candidates_torturer = [];
		local candidates_faintheartedbro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.fainthearted"))
			{
				candidates_faintheartedbro.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_torturer" && b.getLevel() >= 3)
			{
				candidates_torturer.push(b);
			}
		}

		if (candidates_faintheartedbro.len() == 0 || candidates_torturer.len() == 0)
		{
			return;
		}

		this.m.Torturer = candidates_torturer[this.Math.rand(0, candidates_torturer.len() - 1)];
		this.m.FaintheartedBro = candidates_faintheartedbro[this.Math.rand(0, candidates_faintheartedbro.len() - 1)];
		this.m.Score = 15 * candidates_torturer.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"torturer",
			this.m.Torturer.getName()
		]);
		_vars.push([
			"faintheartedbro",
			this.m.FaintheartedBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Torturer = null;
		this.m.FaintheartedBro = null;
	}

});

