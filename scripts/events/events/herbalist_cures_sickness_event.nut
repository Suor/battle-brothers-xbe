this.herbalist_cures_sickness_event <- this.inherit("scripts/events/event", {
	m = {
		Herbalist = null,
		SickBro = null
	},
	function create()
	{
		this.m.ID = "event.herbalist_cures_sickness";
		this.m.Title = "On the road...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_18.png[/img][M] %sickbro%, who\'s come down with something downright nasty, has been pausing periodically to heave the inside of his guts on the side of the road. %herbalist% the herbalist finally reaches into his pouch and pulls out a jar filled with some purplish paste. He walks over to %sickbro% as he doubles over for the umpteenth time. %SPEECH_ON%Choke some of this stuff down. It\'ll taste like shite but should keep your stomach from turning inside out and sideways.%SPEECH_OFF% %sickbro% dips his fingers into the jar, scoops some of the viscous goop and manages to get some into his moutn. His gaunt expression sours in dismay, but he summons the willpower to swallow. %herbalist% pats him on the back encouragingly. %SPEECH_ON%Good man. Soon enough you\'ll be right as rain.%SPEECH_OFF% The men fall back into line and sure enough, it seems that in the next few hours %sickbro%\'s mood and health recover somewhat.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We are lucky to have an herbalist with us.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Herbalist.getImagePath());
				this.Characters.push(_event.m.SickBro.getImagePath());
				_event.m.SickBro.getSkills().removeByID("injury.sickness");
				this.List = [
					{
						id = 10,
						icon = "ui/injury/injury_icon_25.png",
						text = _event.m.SickBro.getName() + " is no longer sick"
					}
				];
				_event.m.Herbalist.improveMood(0.5, "Cured a fellow brother of an illness");

				if (_event.m.Herbalist.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Herbalist.getMoodState()],
						text = _event.m.Herbalist.getName() + this.Const.MoodStateEvent[_event.m.Herbalist.getMoodState()]
					});
				}

				_event.m.SickBro.improveMood(1.0, "Was cured of his illness");

				if (_event.m.SickBro.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.SickBro.getMoodState()],
						text = _event.m.SickBro.getName() + this.Const.MoodStateEvent[_event.m.SickBro.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_herbalist = [];
		local candidates_sickbro = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("injury.sickness"))
			{
				candidates_sickbro.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_herbalist" && b.getLevel() >= 4)
			{
				candidates_herbalist.push(b);
			}
		}

		if (candidates_herbalist.len() == 0 || candidates_sickbro.len() == 0)
		{
			return;
		}

		this.m.Herbalist = candidates_herbalist[this.Math.rand(0, candidates_herbalist.len() - 1)];
		this.m.SickBro = candidates_sickbro[this.Math.rand(0, this.candidates_SickBro.len() - 1)];
		this.m.Score = 250 * candidates_herbalist.len();
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
			"sickbro",
			this.m.SickBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Herbalist = null;
		this.m.SickBro = null;
	}

});

