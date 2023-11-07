this.leper_becomes_famous_event <- this.inherit("scripts/events/event", {
	m = {
		Leper = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_leper_becomes_famous";
		this.m.Title = "In Town...";
		this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			// BROKEN vars ???
			Text = "[img]gfx/ui/events/event_92.png[/img][M] The renown of the %companyname% has been steadily growing as the exploits of your men have reached ears far and wide. As you make your way through town, you notice the townsfolk pointing at your leper, %leper%, while excitedly whispering amongst themselves. A young man emerges from the throng and approaches him in awe. %SPEECH_ON%Is it true, then? Is this the monster that faced down an orc warlord on his own and sent the whole pack fleeing? The same man that took an axe straight in the shoulder, slew the man who put it there, and finished the battle with it embedded in his body? The one who lost everything to disease before being reborn like a phoenix in the %companyname%?%SPEECH_OFF% %leper%\'s normally passive, downtrodden expression curls into a lopsided grin. %SPEECH_ON%Ain\'t an uglier man in our squad, lad. You\'re right. It\'s me. Wrong about the axe though, it was actually a cleaver.%SPEECH_OFF% The man\'s eyes widen like saucers in awe, and the remaining townsfolk are sent into a frenzy of energetic muttering.\n\n You and your men continue on your business, and you take the opportunity to sneakily side eye the leper. When he first joined the %companyname% he was truly a miserable specimen, cursing fate and sneering maliciously at any passersby that made the mistake of looking at him. Now he stands among your comrades, transformed. His physical appearance remains rather grotesque, but his mentality has undergone a complete turnaround. Indeed, %leper% looks much more stoic. His time in the %companyname% has done him much good, and in turn he continues to raise the renown of the company to new heights.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Long live %leper% and the %companyname%!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Leper.getImagePath());
				_event.m.Leper.improveMood(1.5, "Realized that he has become famous across the land");
				this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
				_event.m.Leper.getBaseProperties().Bravery += 20;
				_event.m.Leper.getBaseProperties().HitPoints += 10;
				_event.m.Leper.getBaseProperties().Stamina += 4;
				_event.m.Leper.getBaseProperties().MeleeDefense += 4;
				this.List.push({
					id = 16,
					icon = "ui/icons/bravery.png",
					text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+20[/color] Resolve"
				});
				this.List.push({
					id = 17,
					icon = "ui/icons/health.png",
					text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Max Hitpoints"
				});
				this.List.push({
					id = 17,
					icon = "ui/icons/fatigue.png",
					text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4[/color] Max Fatigue"
				});
				this.List.push({
					id = 17,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4[/color] Melee Defense"
				});
				this.List.push({
					id = 10,
					icon = "ui/icons/special.png",
					text = "The company has gained renown"
				});

				if (_event.m.Leper.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Leper.getMoodState()],
						text = _event.m.Leper.getName() + this.Const.MoodStateEvent[_event.m.Leper.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getSize() <= 1 || t.isMilitary() || t.isSouthern())
			{
				continue;
			}

			if (t.getTile().getDistanceTo(playerTile) <= 4 && t.isAlliedWithPlayer())
			{
				nearTown = true;
				town = t;
				break;
			}
		}

		if (!nearTown)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 11 && bro.getBackground().getID() == "background.hackflows_leper")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Leper = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 2000 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"leper",
			this.m.Leper.getName()
		]);
	}

	function onClear()
	{
		this.m.Leper = null;
	}

});

