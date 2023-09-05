this.tailor_crafts_masterwork_armor_event <- this.inherit("scripts/events/event", {
	m = {
		Tailor = null
	},
	function create()
	{
		this.m.ID = "event.tailor_crafts_masterwork_armor";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_41.png[/img][M] While the company is on the march, %tailor% the tailor draws up alongside you. He smiles and speaks. %SPEECH_ON%Hey captain. I noticed that we\'ve been lugging around some of those direwolf hides since the last time we fought some of the relentless fuckers. How crazy would it be if we used the skins of our slain enemies to block some hits from the next unlucky sons o\' bitches we met out there on the battlefield? I have some basic materials for the armor on hand. If you can spare me some crowns to cover the costs and, of course, the pelts, I reckon I could make us a damn fine set of leather armor.%SPEECH_OFF% He looks at you with an excited sparkle in his eye. If you reject him now, he likely won\'t bring it up again, so you decide to carefully weigh the pros and cons of entertaining him on this little project.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "You can have the pelts, and here are the crowns. Get to work.",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Forget your tailoring ways and focus on being a sellsword.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Tailor.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_41.png[/img][M] What\'s the harm in letting %tailor% try his hand at his old craft? It isn\'t like you were planning on using those wolf pelts anytime soon anyhow. Furthermore, they are cluttering up valuable inventory space that could be used for storing other loot and materials. You give him the nod and he excitedly scampers off toward the supply wagons. \n\n Awhile later, he returns and presents to you his masterpiece. It is surprisingly well made and exceptionally light considering its durability. A wolf head is draped around the shoulders, a truly grotesque sight that is sure to intimidate foes of the %companyname%. You clap the tailor on the back and praise him for a job well done!",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I\'ll be damned, but this really is a fine piece of light armor.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Tailor.getImagePath());
				local stash = this.World.Assets.getStash().getItems();
				local numPelts = 0;

				foreach( i, item in stash )
				{
					if (item != null && item.getID() == "misc.werewolf_pelt")
					{
						numPelts = ++numPelts;
						numPelts = numPelts;
						stash[i] = null;
						this.List.push({
							id = 10,
							icon = "ui/items/" + item.getIcon(),
							text = "You lose " + item.getName()
						});

						if (numPelts >= 2)
						{
							break;
						}
					}
				}

				this.World.Assets.addMoney(-500);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]500[/color] Crowns"
				});
				local item = this.new("scripts/items/armor/named/black_leather_armor");
				item.m.Name = _event.m.Tailor.getNameOnly() + "\'s Masterwork Armor";
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				_event.m.Tailor.improveMood(2.0, "Crafted a suit of light armor of exceptional quality");

				if (_event.m.Tailor.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Tailor.getMoodState()],
						text = _event.m.Tailor.getName() + this.Const.MoodStateEvent[_event.m.Tailor.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (this.Const.DLC.Unhold)
		{
			return;
		}

		if (this.World.Assets.getMoney() < 5000)
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 8 && bro.getBackground().getID() == "background.tailor")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		local stash = this.World.Assets.getStash().getItems();
		local numPelts = 0;

		foreach( item in stash )
		{
			if (item != null && item.getID() == "misc.werewolf_pelt")
			{
				numPelts = ++numPelts;
				numPelts = numPelts;

				if (numPelts >= 2)
				{
					break;
				}
			}
		}

		if (numPelts < 2)
		{
			return;
		}

		this.m.Tailor = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = candidates.len() * 100;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"tailor",
			this.m.Tailor.getName()
		]);
	}

	function onClear()
	{
		this.m.Tailor = null;
	}

});

