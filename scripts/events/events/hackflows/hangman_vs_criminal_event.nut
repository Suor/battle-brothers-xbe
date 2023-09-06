this.hangman_vs_criminal_event <- this.inherit("scripts/events/event", {
	m = {
		Hangman = null,
		Criminal = null
	},
	function create()
	{
		this.m.ID = "event.hangman_vs_criminal";
		this.m.Title = "During Camp...";
		this.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_26.png[/img][M] After a long day of marching, your men are gathered around the campfire, sharing stories about their past. Soon it is %hangman% the hangman\'s turn to speak and he simply shrugs. %SPEECH_ON%Not much to say, boys. When I was young our village had a serial rapist. We caught the fucker and had him strung up. Vigilante justice and all that. I had the honor of doinging the stringing...guess folks liked how I did it because soon enough I was doing it for crowns. At some point we even set up a platform with a trapdoor and everything!%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "...",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Hangman.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_26.png[/img][M] The other men laugh and guffaw at the absurdity of it all. %hangman% points at %criminal% and continues. %SPEECH_ON%I really did hate that first fucker I executed. But truth is, over the years, it just became a way to keep food on the table. I\'ve pulled the lever on murderers, petty thieves, and captured bandits. Seen the end of graverobbers, poachers, and deserters. Even silenced peasants that spoke up a little too much about the local lords.%SPEECH_ON%The laughter and mirth stops and a silence falls over the campfire. %hangman% stares at %criminal% with steely eyes, before cracking a smile. %SPEECH_ON%Even as I cut their lives short, I felt nothing like the rush of that first hangin\'. I was living an empty life. That\'s the reason why I\'m here. That job was a load of horse shite. It\'s way more invigoratin\' to fight and bleed alongside fuckers like you.%SPEECH_OFF%At this, %criminal% lifts his finger and points back at the hangman. %SPEECH_ON%Same to you, you fuckin\' weirdo! Men like us fear the noose, not the man behind it. Crowns are crowns.%SPEECH_OFF%The atmosphere brightens and if anything becomes more positive than before. You get the feeling that this exchange has improved the morale of the men somewhat.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "All\'s well that ends well.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Hangman.getImagePath());
				this.Characters.push(_event.m.Criminal.getImagePath());
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getMoodState() <= this.Const.MoodState.Neutral && this.Math.rand(1, 100) <= 33)
					{
						bro.improveMood(1.0, "Heard a positive exchange between a hangman brother and another brother");

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
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_hangman = [];
		local candidates_criminal = [];

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_hangman")
			{
				this.candidates_town_watchman.push(b);
			}
			else if (b.getBackground().getID() == "background.killer_on_the_run" || b.getBackground().getID() == "background.graverobber" || b.getBackground().getID() == "background.thief" || b.getBackground().getID() == "background.hackflows_myrmidon" || b.getBackground().getID() == "background.deserter" || b.getBackground().getID() == "background.poacher" || b.getBackground().getID() == "background.hackflows_con_artist" || b.getBackground().getID() == "background.hackflows_dissenter" || b.getBackground().getID() == "background.hackflows_pirate" || b.getBackground().getID() == "background.raider")
			{
				candidates_criminal.push(b);
			}
		}

		if (candidates_hangman.len() == 0 || candidates_criminal.len() == 0)
		{
			return;
		}

		this.m.Criminal = candidates_criminal[this.Math.rand(0, candidates_criminal.len() - 1)];
		this.m.Hangman = candidates_hangman[this.Math.rand(0, candidates_hangman.len() - 1)];
		this.m.Score = candidates_hangman.len() * 10 + candidates_criminal.len() * 6;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"hangman",
			this.m.Hangman.getName()
		]);
		_vars.push([
			"criminal",
			this.m.Criminal.getName()
		]);
	}

	function onClear()
	{
		this.m.Hangman = null;
		this.m.Criminal = null;
	}

});

