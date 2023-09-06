this.cultist_requests_nose_removal_event <- this.inherit("scripts/events/event", {
	m = {
		Cultist = null,
		Surgeon = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_cultist_requests_nose_removal";
		this.m.Title = "During a Quiet Moment...";
		this.m.Cooldown = 15.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_03.png[/img][M] While on the march, you are approached by %surgeon% the surgeon and %cultist% the cultist. You raise an eyebrow and wait for one of them to speak. The cultist only stares at you with a vacant expression. Noticing this, %surgeon% opens his mouth to speak.%SPEECH_ON%It\'s damn uncanny captain. Not but a few moments ago this damned lunatic wouldn\'t shut up about \'Dave Cool\' or some shit. Madman says he needs his nose sliced off.%SPEECH_OFF%%surgeon% shakes his head at you incredulously.%SPEECH_ON%Truth is, captain, I\'ve heard of a procedure...and if the lout wants his nose off then I can make that happen. Seeing as you\'re the boss of this outfit, I\'ll let you decide. But this will run you 200 crowns. I sure as hell didn\'t sign up for this nonsense.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Do as he asks. I will ensure you are compensated.",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "This is madness. Save the slicing and dicing for our enemies on the battlefield!",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cultist.getImagePath());
				this.Characters.push(_event.m.Surgeon.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_03.png[/img][M] You give %surgeon% the nod and he grins back at you grimly. %SPEECH_ON%Crowns are crowns, cap.%SPEECH_OFF%%surgeon% removes a grisly looking saw from his trousers and beckons to the cultist. %cultist% grunts in understanding and the two make their way to a more secluded area.\n\nAround a half hour later, the two men make their reappearance. The cultist has a bandage wrapped almost entirely around his face, with just one eye exposed. It is fixed on you with a piercing focus directly contrasting its prior vacancy. Meanwhile, %surgeon% the surgeon follows behind, arms dangling limply by his side. He mutters, %SPEECH_ON%Davkul awaits us all.%SPEECH_OFF%The cultist nods and repeats, %SPEECH_ON%Davkul awaits us all.%SPEECH_OFF%The two return to the main campsite, but before they do you notice that the bandages around the cultist\'s head are curiously absent of blood. You have no idea what to make of these events but before long the daily tasks of managing a mercenary company push this to the back of your mind.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Davkul awaits us all, I guess.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cultist.getImagePath());
				this.Characters.push(_event.m.Surgeon.getImagePath());
				this.World.Assets.addMoney(-200);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]200[/color] Crowns"
				});
				local injury = _event.m.Cultist.addInjury([
					{
						ID = "injury.missing_nose",
						Threshold = 0.0,
						Script = "injury_permanent/missing_nose_injury"
					}
				]);
				this.List.push({
					id = 10,
					icon = injury.getIcon(),
					text = _event.m.Cultist.getName() + " suffers " + injury.getNameOnly()
				});
				_event.m.Surgeon.improveMood(1.0, "Made a few quick crowns with his expertise as a surgeon");

				if (_event.m.Surgeon.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Surgeon.getMoodState()],
						text = _event.m.Surgeon.getName() + this.Const.MoodStateEvent[_event.m.Surgeon.getMoodState()]
					});
				}

				_event.m.Cultist.improveMood(3.0, "Got the aid of a fellow brother to please Davkul");

				if (_event.m.Cultist.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Cultist.getMoodState()],
						text = _event.m.Cultist.getName() + this.Const.MoodStateEvent[_event.m.Cultist.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_03.png[/img][M] You shake your head. As an extra precaution, you try to frame the refusal on the grounds of the surgical fee. However, %cultist%\'s eyes snap back into focus. %SPEECH_ON%Davkul will remember this.%SPEECH_OFF%Suddenly, you hear a sickening crunch and %surgeon% doubles over in pain, with both hands covering his face. He curses. %SPEECH_ON%Bloody shite...m\' phuggin\' nose.%SPEECH_OFF%%surgeon% stumbles away to treat himself and %cultist% wanders off, leaving you alone and bewildered about this turn of events.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "What the hell just happened?",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cultist.getImagePath());
				this.Characters.push(_event.m.Surgeon.getImagePath());
				local broken_nose_injury = [
					{
						ID = "injury.broken_nose",
						Threshold = 0.25,
						Script = "injury/broken_nose_injury"
					}
				];
				this.injury = _event.m.Surgeon.addInjury(broken_nose_injury);
				this.List = [
					{
						id = 10,
						icon = this.injury.getIcon(),
						text = _event.m.Surgeon.getName() + " suffers " + this.injury.getNameOnly()
					}
				];
				_event.m.Surgeon.worsenMood(2.5, "Suffered a broken nose from a supernatural force");

				if (_event.m.Surgeon.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Surgeon.getMoodState()],
						text = _event.m.Surgeon.getName() + this.Const.MoodStateEvent[_event.m.Surgeon.getMoodState()]
					});
				}

				_event.m.Cultist.worsenMood(2.0, "Was denied a request that would have pleased Davkul");

				if (_event.m.Cultist.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Cultist.getMoodState()],
						text = _event.m.Cultist.getName() + this.Const.MoodStateEvent[_event.m.Cultist.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.Assets.getMoney() < 1500)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_surgeon = [];
		local candidates_cultist = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.hackflows_surgeon" && !bro.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				candidates_surgeon.push(bro);
			}
			else if (bro.getBackground().getID() == "background.cultist" && !bro.getSkills().hasSkill("injury.missing_nose"))
			{
				candidates_cultist.push(bro);
			}
		}

		if (candidates_surgeon.len() == 0 || candidates_cultist.len() == 0)
		{
			return;
		}

		this.m.Surgeon = candidates_surgeon[this.Math.rand(0.0, candidates_surgeon.len() - 1)];
		this.m.Cultist = candidates_cultist[this.Math.rand(0.0, candidates_cultist.len() - 1)];
		this.m.Score = 20 * candidates_cultist.len() + 15 * candidates_surgeon.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"cultist",
			this.m.Cultist.getName()
		]);
		_vars.push([
			"surgeon",
			this.m.Surgeon.getName()
		]);
	}

	function onClear()
	{
		this.m.Cultist = null;
		this.m.Surgeon = null;
	}

});

