this.aging_master_archer_event <- this.inherit("scripts/events/event", {
	m = {
		Master_Archer = null
	},
	function create()
	{
		this.m.ID = "event.aging_master_archer";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_17.png[/img][M] You find %master_archer% sitting hunched on a tree stump, bow slung over his back. You watch as he squints hard into the distance, clenching and unclenching both outstretched hands with an agonzing slowness. He does not seem to be gazing at a physical target, but rather the concept of a time long past, a prize unrecognized until it became impossible to attain. %master_archer% closes his eyes and sighs, bringing his calloused left hand to his eyelids and gently massaging them. %SPEECH_ON%Don\'t need to look to tell that someone is watching, captain. That ability, at least, hasn\'t left me yet.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "How are you doing?",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Master_Archer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_17.png[/img][M] %master_archer% slowly shifts his body to face you. %SPEECH_ON%Man and beast are not so different. We are born into this world, live our short lives, and get ground up into dust in due time.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "You didn\'t answer my question.",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Master_Archer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_17.png[/img][M] The man continues. %SPEECH_ON%Ever wondered what animal you would be if you weren\'t a man, captain?%SPEECH_OFF% %master_archer% doesn\'t wait for your answer. %SPEECH_ON%Always fancied myself an eagle, when I was younger. Up in the sky, casting my gaze and shadow over everything, able to strike anything with absolute impunity...%SPEECH_OFF% A flicker of a smile crosses his face before the corners of his mouth turn back downwards. %SPEECH_ON%Therein lies the problem. I\'m an archer, and I\'m getting old. My eyesight is definitely not what it used to be. And a blind archer is like an eagle without wings. Totally useless.%SPEECH_OFF% He sighs. %SPEECH_ON%I\'ll manage, though. Least I\'m not a frontliner. Eyes might be shot, but the guys I CAN see are still right fucked.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Time marches on.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Master_Archer.getImagePath());
				local old_trait = this.new("scripts/skills/traits/old_trait");
				_event.m.Master_Archer.getSkills().add(old_trait);
				_event.m.Master_Archer.setHitpoints(this.Math.min(_event.m.Master_Archer.getHitpoints(), _event.m.Master_Archer.getHitpointsMax()));
				this.List = [
					{
						id = 13,
						icon = old_trait.getIcon(),
						text = _event.m.Master_Archer.getName() + " has gotten older"
					}
				];
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 9
				&& bro.getBackground().getID() == "background.hackflows_master_archer"
				&& !bro.getSkills().hasSkill("trait.old")
				&& !bro.getFlags().has("IsRejuvinated"))
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() > 0)
		{
			this.m.Master_Archer = candidates[this.Math.rand(0, candidates.len() - 1)];
			this.m.Score = this.m.Master_Archer.getLevel() - 5;
		}
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"master_archer",
			this.m.Master_Archer.getName()
		]);
	}

	function onClear()
	{
		this.m.Master_Archer = null;
	}

});

