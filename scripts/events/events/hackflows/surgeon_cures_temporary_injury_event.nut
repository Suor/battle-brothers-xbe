this.surgeon_cures_temporary_injury_event <- this.inherit("scripts/events/event", {
	m = {
		Surgeon = null,
		InjuredBro = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_surgeon_cures_temporary_injury";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 15.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_34.png[/img][M] Knowing that %injuredbro% had suffered an injury recently, during a free moment you move to check up on him. After all, sometimes just letting a brother know that the captain is concerned about them is enough to raise their morale. However, you discover the man laughing genially with a friendly arm wrapped around %surgeon% the surgeon\'s shoulder, looking almost no worse for the wear. He looks up to you and happily says, %SPEECH_ON%Sir, the day you hired this man right here is the day %companyname% the divines were smiling upon us. Almost magic, what he pulled off. Not even sure what happened myself.%SPEECH_OFF% He points at the surgeon with his other hand. The surgeon simply cracks a small smile.%SPEECH_ON%The men in this world are made out of some tough stuff. %injuredbro% would have recovered just fine in due time...I just helped speed up the process a little.%SPEECH_ON%You return to your other duties, making note of the positive impact the surgeon has had on the company.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We are lucky to have a surgeon with us.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.InjuredBro.getImagePath());
				this.Characters.push(_event.m.Surgeon.getImagePath());
				local injuries = _event.m.InjuredBro.getSkills().query(this.Const.SkillType.TemporaryInjury);
				local injury = injuries[this.Math.rand(0, injuries.len() - 1)];
				this.List = [
					{
						id = 10,
						icon = injury.getIcon(),
						text = _event.m.InjuredBro.getName() + " no longer suffers from " + injury.getNameOnly()
					}
				];
				injury.removeSelf();
				_event.m.InjuredBro.updateInjuryVisuals();
				_event.m.InjuredBro.getSkills().update();
				_event.m.Surgeon.improveMood(1.0, "Helped cure a wound using his expertise as a surgeon");

				if (_event.m.Surgeon.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Surgeon.getMoodState()],
						text = _event.m.Surgeon.getName() + this.Const.MoodStateEvent[_event.m.Surgeon.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_injured = [];
		local candidates_surgeon = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() != "background.slave" && bro.getBackground().getID() != "background.hackflows_surgeon" && bro.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				candidates_injured.push(bro);
			}
			else if (bro.getBackground().getID() == "background.hackflows_surgeon")
			{
				candidates_surgeon.push(bro);
			}
		}

		if (candidates_injured.len() == 0 || candidates_surgeon.len() == 0)
		{
			return;
		}

		this.m.Surgeon = candidates_surgeon[this.Math.rand(0.0, candidates_surgeon.len() - 1)];
		this.m.InjuredBro = candidates_injured[this.Math.rand(0, candidates_injured.len() - 1)];
		this.m.Score = candidates_injured.len() * 10 + candidates_surgeon.len() * 20;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"surgeon",
			this.m.Surgeon.getName()
		]);
		_vars.push([
			"injuredbro",
			this.m.InjuredBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Surgeon = null;
		this.m.InjuredBro = null;
	}

});

