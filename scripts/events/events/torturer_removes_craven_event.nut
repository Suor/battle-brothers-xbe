this.torturer_removes_craven_event <- this.inherit("scripts/events/event", {
	m = {
		Torturer = null,
		CravenBro = null
	},
	function create()
	{
		this.m.ID = "event.torturer_removes_craven";
		this.m.Title = "During a Spare Moment...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_64.png[/img][M] During the monotonous march to the company\'s next great adventure, you pass within earshot of %torturer% and %cravenbro%. You internally raise an eyebrow, as the torturer has always been chatty about his previous occupation and %cravenbro% has been afraid of his own damn shadow for about as long as you can remember. %cravenbro% has frequently not-so-subtly avoided marching in line with %torturer%.\n\n You imagine that %cravenbro% would be cringing at whatever gruesome tales that the torturer had to tell, but instead you see the man rather cheerfully listening to his companion.",
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
				this.Characters.push(_event.m.CravenBro.getImagePath());
				this.Characters.push(_event.m.Torturer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[M]%SPEECH_ON%So you see, %cravenbro%, the tales I tell are of breaking downright stout-hearted men. Knights that wouldn\'t bat an eyelash at cutting down wee lads and fair lasses for their lords, spies indoctrinated with crazy patriotism for their noble houses, sellswords who\'ve seen all of that and then some. Truth is most men are rather pathetic sods, and even draggin\' them before the table is enough to set \'em howling that they\'ll submit.%SPEECH_OFF% The torturer shakes his head. %SPEECH_ON%Takes the fun out of it, I say. Anyhow, %cravenbro%, just standing out on the battlefield facing down the shite we face for coin means you got more guts than plenty of men I\'ve carved open in the past. We can prove it later if you like.%SPEECH_OFF% At this, %torturer% grins as %cravenbro%\'s expression briefly distorts into horror before realizing the joke and belting out a heartier guffaw than normal. As you fall back into line, it seems that the praise from the torturer was not wasted on %cravenbro%. The man\'s eyes now demonstrate a glint of determination instead of pathetic timidity. His movements become filled with purpose, with his back much straighter and knees much higher as he continues the march with renewed vigor. It seems incredible to you, but you begin to wonder how %cravenbro% will perform in the next battle.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "To think the cowardly bastard needed a pep talk from the fucking torturer of all people.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Torturer.getImagePath());
				this.Characters.push(_event.m.CravenBro.getImagePath());
				_event.m.CravenBro.getSkills().removeByID("trait.craven");
				this.List = [
					{
						id = 10,
						icon = "ui/traits/trait_icon_40.png",
						text = _event.m.CravenBro.getName() + " is no longer craven"
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

				_event.m.CravenBro.improveMood(0.5, "Got over his squeamishness of combat");

				if (_event.m.CravenBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.CravenBro.getMoodState()],
						text = _event.m.CravenBro.getName() + this.Const.MoodStateEvent[_event.m.CravenBro.getMoodState()]
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
		local candidates_cravenbro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.craven"))
			{
				candidates_cravenbro.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_torturer" && b.getLevel() >= 5)
			{
				candidates_torturer.push(b);
			}
		}

		if (candidates_cravenbro.len() == 0 || candidates_torturer.len() == 0)
		{
			return;
		}

		this.m.Torturer = candidates_torturer[this.Math.rand(0, candidates_torturer.len() - 1)];
		this.m.CravenBro = candidates_cravenbro[this.Math.rand(0, candidates_cravenbro.len() - 1)];
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
			"cravenrbro",
			this.m.CravenBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Torturer = null;
		this.m.CravenBro = null;
	}

});

