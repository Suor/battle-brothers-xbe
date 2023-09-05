this.skirmisher_trains_stealth_event <- this.inherit("scripts/events/event", {
	m = {
		Skirmisher = null,
		OtherBro1 = null,
		OtherBro2 = null,
		OtherBro3 = null
	},
	function create()
	{
		this.m.ID = "event.skirmisher_trains_stealth";
		this.m.Title = "On the March...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_134.png[/img][M] While on the move, you discover %skirmisher% the skirmisher lecturing three other members of your company. It appears that he is trying to give an impromptu lesson on guerilla fighting. %SPEECH_ON%Listen, meatheads, it\'s all about getting as much of the enemy fucker\'s attention as you can. You gotta trick the marksman into thinking you forgot about him, when actually your shield\'s already ready to block.%SPEECH_OFF% %otherBro1% speaks. %SPEECH_ON%How the hell are we supposed to do that without risking catching one of the pointy fucks with our gut?%SPEECH_OFF% %skirmisher% responds: %SPEECH_ON%You have to be quick with your shield arm, simple as that. Only way to avoid being shot is to never be shot at, and even then with all the shite flying around you can never be too sure.%SPEECH_OFF% The discussion continues further, but it seems that eventually some of your men pick up some techniques for dodging ranged attacks.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Nice work.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Skirmisher.getImagePath());
				_event.m.Skirmisher.improveMood(0.5, "Taught some brothers to dodge arrows.");

				if (_event.m.Skirmisher.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Skirmisher.getMoodState()],
						text = _event.m.Skirmisher.getName() + this.Const.MoodStateEvent[_event.m.Skirmisher.getMoodState()]
					});
				}

				_event.m.OtherBro1.getBaseProperties().RangedDefense += 6;
				_event.m.OtherBro2.getBaseProperties().RangedDefense += 6;
				_event.m.OtherBro3.getBaseProperties().RangedDefense += 6;
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.OtherBro1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+6[/color] Ranged Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.OtherBro2.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+6[/color] Ranged Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.OtherBro3.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+6[/color] Ranged Defense"
				});
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 5)
		{
			return;
		}

		local candidates_skirmisher = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_skirmisher")
			{
				candidates_skirmisher.push(b);
			}
			else if (this.m.OtherBro1 == null)
			{
				this.m.OtherBro1 = b;
			}
			else if (this.m.OtherBro2 == null)
			{
				this.m.OtherBro2 = b;
			}
			else if (this.m.OtherBro3 == null)
			{
				this.m.OtherBro3 = b;
			}
		}

		if (candidates_skirmisher.len() == 0 || this.m.OtherBro1 == null || this.m.OtherBro2 == null || this.m.OtherBro3 == null)
		{
			return;
		}

		this.m.Skirmisher = candidates_skirmisher[this.Math.rand(0, candidates_skirmisher.len() - 1)];
		this.m.Score = candidates_skirmisher.len() * 20;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"otherBro1",
			this.m.OtherBro1.getName()
		]);
		_vars.push([
			"otherBro2",
			this.m.OtherBro2.getName()
		]);
		_vars.push([
			"otherBro3",
			this.m.OtherBro3.getName()
		]);
		_vars.push([
			"skirmisher",
			this.m.Skirmisher.getName()
		]);
	}

	function onClear()
	{
		this.m.Skirmisher = null;
		this.m.OtherBro1 = null;
		this.m.OtherBro2 = null;
		this.m.OtherBro3 = null;
	}

});

