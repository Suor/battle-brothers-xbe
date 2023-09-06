this.blacksmith_crafts_masterwork_armor_event <- this.inherit("scripts/events/event", {
	m = {
		Blacksmith = null,
		OtherBro1 = null,
		OtherBro2 = null,
		Town = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_blacksmith_crafts_masterwork_armor";
		this.m.Title = "Close to Town...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] Near the town of %townname%, %blacksmith% the blacksmith approaches you as you are calculating wages for your brothers. He\'s got a gleam in his eyes and grips his forging hammer tightly as he begins to speak.\n\n He says that he recently had a dream involving knights in the finest armor fiercely doing battle against hordes of undead. Before you can say so much as \'Who gives a bloody shite\' he raises his hammer and turns his gaze towards it.\n\n Apparently, he believes that the furnaces in %townname% are the perfect place to craft a piece of the armor he has fixated in his mind\'s eye. He asks for 6,000 crowns to procure materials and gain access to the smelters.\n\n You narrow your eyes and try to read the man\'s face. 6,000 crowns could pay the entire company\'s wages for several weeks. However you see that not only is he serious, he\'s confident that the final product will be more than worthwhile.\n\n Either way, if you pass up this chance there\'s no doubt that present circumstances will not come to pass a second time.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Craft a chestpiece fit for a hero!",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "We can\'t spare the coin or materials for this right now.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Blacksmith.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] %blacksmith% eventually returns with the fruits of his labor wrapped carefully in a fine cloth and places it deferentially on your table. You slowly begin unravelling the bundle to get a closer look at the 6,000 crown investment.\n\n For an instant you believe that the smith decided against crafting the armor after all and is returning your crowns, but as more of the chestpiece is revealed your jaw drops as your realize the splendor of its craftsmanship.\n\n It banishes the darkness of the tent as if emanating light on its own. You congratulate the blacksmith for a job well done. The armor is sure to save a brother\'s life and bring additional renown to the company!",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "What excellent craftsmanship!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Blacksmith.getImagePath());
				this.World.Assets.addMoney(-6000);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]6,000[/color] Crowns"
				});
				local item = this.new("scripts/items/armor/named/golden_scale_armor");
				item.m.Name = _event.m.Blacksmith.getNameOnly() + "\'s Masterwork Chestplate of Heroes";
				item.m.Description = "A gleaming chestpiece that shimmers brilliantly when worn. The ability to craft armor of this quality was thought to be a lost art, but clearly it is not. It is much lighter than it appears, but provides incredible protection. Truly the work of a master smith!";
				item.m.StaminaModifier = -14;
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				_event.m.Blacksmith.improveMood(2.0, "Created armor worthy of heroes");

				if (_event.m.Blacksmith.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Blacksmith.getMoodState()],
						text = _event.m.Blacksmith.getName() + this.Const.MoodStateEvent[_event.m.Blacksmith.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.Assets.getMoney() < 12500)
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

		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getTile().getDistanceTo(playerTile) <= 4 && (t.isMilitary() || t.isSouthern()))
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

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 8
				&& bro.getBackground().getID() == "background.hackflows_blacksmith")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Blacksmith = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Town = town;
		this.m.Score = candidates.len() * 2000;
	}

	function onPrepare()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		foreach( bro in brothers )
		{
			if (bro.getID() != this.m.Blacksmith.getID())
			{
				this.m.OtherBro1 = bro;
				break;
			}
		}

		foreach( bro in brothers )
		{
			if (bro.getID() != this.m.Blacksmith.getID() && bro.getID() != this.m.OtherBro1.getID())
			{
				this.m.OtherBro2 = bro;
				break;
			}
		}
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"blacksmith",
			this.m.Blacksmith.getNameOnly()
		]);
		_vars.push([
			"otherbro1",
			this.m.OtherBro1.getName()
		]);
		_vars.push([
			"otherbro2",
			this.m.OtherBro2.getName()
		]);
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
	}

	function onClear()
	{
		this.m.Blacksmith = null;
		this.m.OtherBro1 = null;
		this.m.OtherBro2 = null;
		this.m.Town = null;
	}

});

