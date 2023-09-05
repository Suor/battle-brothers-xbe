this.aging_master_archer_preview_event <- this.inherit("scripts/events/event", {
	m = {
		Master_Archer = null
	},
	function create()
	{
		this.m.ID = "event.aging_master_archer_preview";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_128.png[/img][M] You find %master_archer% gazing off into the distance. %SPEECH_ON%Been a long time since I last won my last archery tournament. Hitting marks in front of crowds just lost it\'s charm long ago. I\'ve long since graduated to putting arrows in heads, and along the way time\'s gone and snuck up on me. I\'ve grown old. Probably killed more men than struck targets, all, well almost all, from a comfortable distance away.%SPEECH_OFF% You walk up next to him and cross your hands behind your back. He continues. %SPEECH_ON%I robbed these men, captain. Robbed them not just of the rest of their lives, but of a dignified death. I rarely see their faces as they fall, silently, behind their comrades, their last words unheard as they fall forwards into the earth and muck. Someday I\'ll be caught unawares by a stray projectile too, or worse, get rushed down by some quick little bastard and gutted. No matter how I go it\'ll be just the same as all these men I\'ve killed...%SPEECH_OFF% His last words trail off into an uneasy silence, and wordlessly, the two of you fall back into formation.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I hope he cheers up.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Master_Archer.getImagePath());
				_event.m.Master_Archer.worsenMood(1.0, "Realized he\'s getting old");

				if (_event.m.Master_Archer.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Master_Archer.getMoodState()],
						text = _event.m.Master_Archer.getName() + this.Const.MoodStateEvent[_event.m.Master_Archer.getMoodState()]
					});
				}

				_event.m.Master_Archer.getFlags().add("aging_preview");
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 6
				&& bro.getBackground().getID() == "background.hackflows_master_archer"
				&& !bro.getFlags().has("aging_preview")
				&& !bro.getSkills().hasSkill("trait.old")
				&& !bro.getFlags().has("IsRejuvinated"))
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() > 0)
		{
			this.m.Master_Archer = candidates[this.Math.rand(0, candidates.len() - 1)];
			this.m.Score = this.m.Master_Archer.getLevel();
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

