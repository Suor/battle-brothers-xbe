this.locksmith_unlocks_vault_event <- this.inherit("scripts/events/event", {
	m = {
		Locksmith = null
	},
	function create()
	{
		this.m.ID = "event.locksmith_unlocks_vault";
		this.m.Title = "After the Battle...";
		this.m.Cooldown = 20.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[M] As your men cut down the last brigand that hasn\'t already turned tail and fled, you begin to question why the cutthroats even decided to set up a base camp here. As you swivel your head back and forth you spy at least three places not more than a few hundred yards that would have been more defensible. \n\n Your question is answered as your men begin scouring the camp for loot and your locksmith cries out in surprise. %SPEECH_ON%Damn, must be the biggest farkin\' door I\'ve ever seen!%SPEECH_OFF% ",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let\'s check out what he\'s found.",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Locksmith.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[M] You and your men quickly follow the sound of the locksmith\'s yell and as you catch up to him your earlier question is answered. Before you is an massive door, over twice your height and wide enough for six burly mend to walk through shoulder to shoulder. It is sunken slightly into the earth and embedded into a solid chunk of rock. \n\n Numerous broken picks and scratches all over the door itself suggests that the brigands you just slew had not long ago been sparing no effort to get inside. %locksmith% seems to read your mind and shoots you a smug grin. %SPEECH_ON%Aye, the door is large. But don\'t let that fool ya, the keyhole is normal sized. Fucker sure was hard to find, though. No wonder the bandits couldn\'t find it.%SPEECH_OFF% He points at a small but deliberately placed slit at knee height.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "You think you can get it open?",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Locksmith.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[M] You ask if the locksmith can put his skills to use and get the door open. He laughs and says, %SPEECH_ON%Sure I can do it, cap\'n, but I\'ll need a bit of time. This isn\'t an average merchant\'s lockbox or jammed dungeon cell door.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Take your time.",
					function getResult( _event )
					{
						return "D";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Locksmith.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_04.png[/img][M] You and the rest of your men leave %locksmith% to his work, taking the opportunity to repair weapons, catch your breaths, and get some food in your bellies. After a couple hours, %locksmith% shouts out in triumph, and you rush over to his voice a second time. \n\n You arrive just in time to see the door sliding to the side by some unseen mechanism to reveal the contents of the vault. %locksmith%\'s efforts are rewarded, and how! The two of you stand in awe as you see piles of crowns, and a weapon rack with some armaments in surprisingly good repair. You grab %locksmith%\'s hand and shake vigorously, telling him to take a chunk of treasure as the finder\'s fee and extending heartfelt congratulations.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Treasure!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Locksmith.getImagePath());
				this.World.Assets.addMoney(2000);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]2,000[/color] Crowns"
				});
				local item1 = this.new("scripts/items/weapons/three_headed_flail");
				this.World.Assets.getStash().add(item1);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item1.getIcon(),
					text = "You gain " + item1.getName()
				});
				local item2 = this.new("scripts/items/weapons/ancient/crypt_cleaver");
				this.World.Assets.getStash().add(item2);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item2.getIcon(),
					text = "You gain " + item2.getName()
				});
				local item3 = this.new("scripts/items/weapons/two_handed_hammer");
				this.World.Assets.getStash().add(item3);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item3.getIcon(),
					text = "You gain " + item3.getName()
				});
				_event.m.Locksmith.improveMood(2.0, "Made excellent use of his past skills to uncover a great treasure");

				if (_event.m.Locksmith.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Locksmith.getMoodState()],
						text = _event.m.Locksmith.getName() + this.Const.MoodStateEvent[_event.m.Locksmith.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (this.World.Statistics.getFlags().getAsInt("LastCombatResult") != 1 || this.World.Statistics.getFlags().getAsInt("LastLocationDestroyedFaction") != this.Const.Faction.Bandits)
		{
			return;
		}

		if (this.Time.getVirtualTimeF() - this.World.Events.getLastBattleTime() > 6.0)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_locksmith = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_locksmith")
			{
				candidates_locksmith.push(b);
			}
		}

		if (candidates_locksmith.len() == 0)
		{
			return;
		}

		this.m.Locksmith = candidates_locksmith[this.Math.rand(0, candidates_locksmith.len() - 1)];
		this.m.Score = candidates_locksmith.len() * 100;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"locksmith",
			this.m.locksmith.getName()
		]);
	}

	function onClear()
	{
		this.m.Locksmith = null;
	}

});

