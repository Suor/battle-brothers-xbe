this.hangman_hangs_wiederganger_event <- this.inherit("scripts/events/event", {
	m = {
		Hangman = null,
		OtherBro = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_hangman_hangs_wiederganger";
		this.m.Title = "During Camp...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_02.png[/img][M] You are in the midst of preparing camp when suddenly you begin hearing a chorus of hooting and hollering. You quickly rush to the source of the commotion to discover your men circled around a tree. You look up and see a torso strung up by the neck, arms limp and flapping about haphazardly. The bottom half of the corpse is nowhere to be seen.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "What the fuck is going on here?",
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
			Text = "[img]gfx/ui/events/event_02.png[/img][M] Amidst the jeering you roar for an explanation. Just then, %hangman% the hangman steps out from behind the tree, brushing his hands and beaming. He speaks. %SPEECH_ON%The boys and I discovered this miserable specimen dragging itself along the ground. Wouldn\'t do anyone any good to step on the bugger, so we figured we\'d have a spot of fun.%SPEECH_OFF%As if in response, the corpse gasps and raises its arms, reaching out as it lets out a snarl choked by the rope tightened around his windpipe. %hangman% laughs. %SPEECH_ON%Look, %otherbro%, I think it wants its papa! Why don\'t you give him a hug?%SPEECH_OFF%%otherbro% guffaws. %SPEECH_ON%No way the lad can be mine. He\'s got your massive forehead and cockeye!%SPEECH_OFF%Friendly banter like this passes from brother to brother. Understanding that there is no immediate danger, you return to continue preparing camp.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That\'s definitely one way to relieve stress...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Hangman.getImagePath());
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					bro.improveMood(1.0, "Entertained by a strung up zombie");

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

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_hangman = [];
		local candidates_other = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_hangman")
			{
				candidates_hangman.push(b);
			}
			else
			{
				candidates_other.push(b);
			}
		}

		if (candidates_hangman.len() == 0 || candidates_other.len() == 0)
		{
			return;
		}

		this.m.OtherBro = candidates_other[this.Math.rand(0, candidates_other.len() - 1)];
		this.m.Hangman = candidates_hangman[this.Math.rand(0, candidates_hangman.len() - 1)];
		this.m.Score = candidates_hangman.len() * 10;
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
			"otherbro",
			this.m.OtherBro.getName()
		]);
	}

	function onClear()
	{
		this.m.Hangman = null;
		this.m.OtherBro = null;
	}

});

