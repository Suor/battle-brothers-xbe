this.town_watchman_improves_scouting_event <- this.inherit("scripts/events/event", {
	m = {
		TownWatchman = null
	},
	function create()
	{
		this.m.ID = "event.town_watchman_improves_scouting";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_90.png[/img][M] While on the move, %townwatchman% the town watchman taps your shoulder to get your attention. He speaks. %SPEECH_ON%Captain, when you hired me you knew I had been a town watchman. You never questioned why I suddenly wanted to become a mercenary.%SPEECH_OFF% Sensing that the man was going to say more, you simply remain silent and nod at him. %SPEECH_ON%Truth of the matter is, life of a watchman is pretty easy. You rarely actually need to be on the front lines. Hell, if you come from a bigger town, most of the time all you need to be able to do is sound the alarm. Still, around town you were treated as one of the milita, one of the brave souls trusted to keep the townsfolk safe. \n\n ...Which brings me back to what I was meaning to say. Dumb fuck like me, had a bit much to drink after a local holiday. Should have let my partner take my shift for the night, but didn\'t let him. By the time I noticed the danger and sounded the alarm the fucking bandits were already in, looting and pillaging.%SPEECH_OFF% %townwatchman%\'s eyes well up with tears for the first time since you hired him. %SPEECH_ON%All of my fellow militiamen, my friends, who time and again had surged forth to defend our hometown at my call...they fought bravely, but many didn\'t have time to put on all their armor.%SPEECH_OFF% He trails off, and for a time the two of you march side by side in silence.%SPEECH_ON%They died because of me, captain. Obviously I could not show my face at home ever again, but I made a vow that whatever mercenary company I joined with would not meet their end by ambush...not on my watch. \n\n It was difficult to hone my observation on the move. On town watch duty the environment was always the same, you see. But now that I\'ve gotten used to mercenary life, you\'ll see that day or night, any slimy fuck will have a hard time sneaking about while I\'m around.%SPEECH_OFF% %townwatchman% straightens his back defiantly. You guess that he has been seeking atonement for his past ever since he joined the company and give him a friendly pat on the back, and soon the two of you settle back into the marching line.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I wish you luck, and thank you.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.TownWatchman.getImagePath());
				_event.m.TownWatchman.improveMood(0.5, "Improved the sight capabilities of the company");
				_event.m.TownWatchman.improveMood(1.0, "Had a meaningful talk with the captain");

				if (_event.m.TownWatchman.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.TownWatchman.getMoodState()],
						text = _event.m.TownWatchman.getName() + this.Const.MoodStateEvent[_event.m.TownWatchman.getMoodState()]
					});
				}

				local gt = this.getroottable();
				gt.Const.World.TerrainTypeVisionRadiusMult <- [
					1.1,
					1.1,
					1.1,
					1.1,
					2.2,
					1.1,
					1.1,
					1.1,
					1.1,
					6.5999999,
					1.1,
					1.1,
					1.1,
					1.1,
					1.1,
					1.1,
					1.1
				];
				this.List.push({
					id = 10,
					icon = "ui/icons/special.png",
					text = "Your company can now see further when moving about on the overworld"
				});
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_town_watchman = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.town_watchman" && b.getLevel() >= 10)
			{
				candidates_town_watchman.push(b);
			}
		}

		if (candidates_town_watchman.len() == 0)
		{
			return;
		}

		this.m.TownWatchman = candidates_town_watchman[this.Math.rand(0, candidates_town_watchman.len() - 1)];
		this.m.Score = 50;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"townwatchman",
			this.m.TownWatchman.getName()
		]);
	}

	function onClear()
	{
		this.m.TownWatchman = null;
	}

});

