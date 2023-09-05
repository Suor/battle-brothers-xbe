this.arbalester_vs_hunter_event <- this.inherit("scripts/events/event", {
	m = {
		Arbalester = null,
		Hunter = null
	},
	function create()
	{
		this.m.ID = "event.arbalester_vs_hunter";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_05.png[/img][M] As the %companyname% marches along you hear two of your men in hot debate. You hear %arbalester% the arbalester say, %SPEECH_ON%I\'ll say it for the last time, the crossbow is the superior ranged weapon. It actually has the power to punch through heavy armor and do more than tickle a man wearing a proper helmet! Regular bow might be quick to shoot, but it shoots bloody pine needles!%SPEECH_OFF% %hunter% the hunter spits on the ground and retorts, %SPEECH_ON%By the time you get one bolt reloaded, our boys out front will be pincushions! Not like brigands or monsters are wearing full plate anyhow! What\'s more, a good bowman can shoot at things you can\'t even see with your spring loaded toy.%SPEECH_OFF% The two notice you listening and ask for your input as the troop commander.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I value the speed and range of the bow.",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "I prefer the power and extra accuracy of the crossbow.",
					function getResult( _event )
					{
						return "C";
					}

				},
				{
					Text = "Actually, I think that the sling is the best ranged option.",
					function getResult( _event )
					{
						return "D";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Arbalester.getImagePath());
				this.Characters.push(_event.m.Hunter.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[M] You tell the two men that you prefer the flexibility of the bow. %hunter% grins. %SPEECH_ON%Good to see that our captain, at least, has a good head on his shoulders.%SPEECH_OFF% %arbalester% turns his head away and begins cursing under his breath. You don\'t hear much of what he\'s saying, other than the fact that he seems to be calling SOMEONE a needle-dicked, meatheaded, shitsack every few moments he can get.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Can\'t please them all.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Arbalester.getImagePath());
				this.Characters.push(_event.m.Hunter.getImagePath());
				_event.m.Arbalester.worsenMood(1.5, "You didn\'t take his side in an argument");

				if (_event.m.Arbalester.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Arbalester.getMoodState()],
						text = _event.m.Arbalester.getName() + this.Const.MoodStateEvent[_event.m.Arbalester.getMoodState()]
					});
				}

				_event.m.Hunter.improveMood(1.0, "You took his side in an argument");

				if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				_event.m.Arbalester.getBaseProperties().Bravery += 2;
				_event.m.Arbalester.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/bravery.png",
					text = _event.m.Arbalester.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+2[/color] Resolve"
				});
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[M] You tell the two men that the bow just can\'t hold a candle to the sheer power and bonus accuracy of the crossbow. %arbalester% belts out a smug laugh. %SPEECH_ON%Good to see that our leadership at least understands reason.%SPEECH_OFF% %hunter% shakes his head glumly and goes silent, and the conversation ends.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Can\'t please them all.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Arbalester.getImagePath());
				this.Characters.push(_event.m.Hunter.getImagePath());
				_event.m.Hunter.worsenMood(1.5, "You didn\'t take his side in an argument");

				if (_event.m.Hunter.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
					});
				}

				_event.m.Arbalester.improveMood(1.0, "You took his side in an argument");

				if (_event.m.Arbalester.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Arbalester.getMoodState()],
						text = _event.m.Arbalester.getName() + this.Const.MoodStateEvent[_event.m.Arbalester.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[M] You scoff and tell the two quarreling mercenaries that the best ranged weapon is actually the stone sling. The two look back at you as if you\'ve suddenly grown a second head. %hunter% slowly says, %SPEECH_ON%Pardon me, cap...I have good ears on account of the years in the forest, but I could have sworn that you just said you prefer the stone sling...%SPEECH_OFF% %arbalester% suddenly laughs a hearty laugh. %SPEECH_ON%I get it, captain, and I agree. Bows are quite good for sniping the squishy, important fuckers, I\'ll grant them that.%SPEECH_OFF% %hunter% looks back at the arbalester in surprise and his face also breaks into a smile. %SPEECH_ON%Aye, and I agree that my least favorite enemy has probably got to be an ugly shite holding a log shooter.%SPEECH_OFF% The two clap each other on the back and change topics to mead and women.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Looks like my work here is done.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Arbalester.getImagePath());
				this.Characters.push(_event.m.Hunter.getImagePath());
				_event.m.Arbalester.improveMood(1.0, "Bonded with a fellow ranged brother");

				if (_event.m.Arbalester.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Arbalester.getMoodState()],
						text = _event.m.Arbalester.getName() + this.Const.MoodStateEvent[_event.m.Arbalester.getMoodState()]
					});
				}

				_event.m.Hunter.improveMood(1.0, "Bonded with a fellow ranged brother");

				if (_event.m.Hunter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Hunter.getMoodState()],
						text = _event.m.Hunter.getName() + this.Const.MoodStateEvent[_event.m.Hunter.getMoodState()]
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

		local candidates_arbalester = [];
		local candidates_hunter = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.arbalester")
			{
				candidates_arbalester.push(b);
			}

			if (b.getBackground().getID() == "background.hunter")
			{
				candidates_hunter.push(b);
			}
		}

		if (candidates_arbalester.len() == 0 || candidates_hunter.len() == 0)
		{
			return;
		}

		this.m.Hunter = candidates_hunter[this.Math.rand(0, candidates_hunter.len() - 1)];
		this.m.Arbalester = candidates_arbalester[this.Math.rand(0, candidates_arbalester.len() - 1)];
		// looks too low, will never fire unless it gets to 500, i.e. 10 of them
		this.m.Score = candidates_hunter.len() * 50 + candidates_arbalester.len() * 50;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"arbalester",
			this.m.Arbalester.getName()
		]);
		_vars.push([
			"hunter",
			this.m.Hunter.getName()
		]);
	}

	function onClear()
	{
		this.m.Arbalester = null;
		this.m.Hunter = null;
	}

});

