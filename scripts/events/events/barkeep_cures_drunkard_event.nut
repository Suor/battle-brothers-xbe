this.barkeep_cures_drunkard_event <- this.inherit("scripts/events/event", {
	m = {
		Barkeep = null,
		Drunkard = null
	},
	function create()
	{
		this.m.ID = "event.barkeep_cures_drunkard";
		this.m.Title = "On the March...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_61.png[/img][M] As your men pause for a brief rest, you overhear %barkeep% the barkeep berating %drunkard%. %SPEECH_ON%For fuck\'s sake, we are on the move! It isn\'t as if you\'ll never see a damn tavern again.%SPEECH_OFF% %drunkard% cringes at the onslaught, bottle in hand. %SPEECH_ON%The horrors we\'ve faced...the brothers we\'ve lost...their faces haunt me. The drink is the only thing that keeps them away.%SPEECH_OFF% %barkeep% yells, %SPEECH_ON%And who among us livin\' will be the next to join them? The captain? Me? If I go down because your drunk ass couldn\'t swing a sword properly I swear by the old gods that even drink won\'t keep me out your bloody nightmares!%SPEECH_OFF% The words seem to have an effect on %drunkard%. As you prepare to resume marching you see him hand over his bottle to %barkeep%.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "About time someone cut off the drunken sod.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Barkeep.getImagePath());
				this.Characters.push(_event.m.Drunkard.getImagePath());
				_event.m.Drunkard.getSkills().removeByID("trait.drunkard");
				this.List = [
					{
						id = 10,
						icon = "ui/traits/trait_icon_29.png",
						text = _event.m.Drunkard.getName() + " is no longer a drunkard"
					}
				];
				_event.m.Barkeep.improveMood(0.5, "Cut off a drunkard.");

				if (_event.m.Barkeep.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Barkeep.getMoodState()],
						text = _event.m.Barkeep.getName() + this.Const.MoodStateEvent[_event.m.Barkeep.getMoodState()]
					});
				}

				_event.m.Drunkard.worsenMood(1.5, "Was humiliated in front of the company.");

				if (_event.m.Drunkard.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Drunkard.getMoodState()],
						text = _event.m.Drunkard.getName() + this.Const.MoodStateEvent[_event.m.Drunkard.getMoodState()]
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

		local candidates_barkeep = [];
		local candidates_drunkard = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getSkills().hasSkill("trait.drunkard"))
			{
				candidates_drunkard.push(b);
			}
			else if (b.getBackground().getID() == "background.hackflows_barkeep" && b.getLevel() >= 2)
			{
				candidates_barkeep.push(b);
			}
		}

		if (candidates_drunkard.len() == 0 || candidates_barkeep.len() == 0)
		{
			return;
		}

		this.m.Barkeep = candidates_barkeep[this.Math.rand(0, candidates_barkeep.len() - 1)];
		this.m.Drunkard = candidates_drunkard[this.Math.rand(0, candidates_drunkard.len() - 1)];
		this.m.Score = 15 * candidates_barkeep.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"barkeep",
			this.m.Barkeep.getName()
		]);
		_vars.push([
			"drunkard",
			this.m.Drunkard.getName()
		]);
	}

	function onClear()
	{
		this.m.Barkeep = null;
		this.m.Drunkard = null;
	}

});

