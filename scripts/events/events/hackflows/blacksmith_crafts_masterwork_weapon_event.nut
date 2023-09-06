this.blacksmith_crafts_masterwork_weapon_event <- this.inherit("scripts/events/event", {
	m = {
		Blacksmith = null,
		OtherBro1 = null,
		OtherBro2 = null,
		Town = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_blacksmith_crafts_masterwork_weapon";
		this.m.Title = "Close to Town...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] Near the town of %townname%, %blacksmith% the blacksmith approaches you while you are managing the company\'s inventory. He\'s twiddling his calloused fingers with a nervous energy uncharacteristic of a man of his age and build.\n\n You turn your gaze towards him and wait for several seconds, expecting bad news, until he suddenly blurts out that he\'s been overcome by inspiration he hasn\'t felt in years.\n\n He says that given a stack of 6,000 crowns and access to %townname%\'s furnaces for the day he can smith a greatsword of legends. \n\n One look at his face tells you that this man means business; that being said, 6,000 crowns is a small fortune that could supply the company with food, tools, and medical supplies for several weeks. \n\n However, something tells you that if you pass up this chance %blacksmith% will never be stricken by this level of weaponsmithing inspiration again.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Craft a zweihander that puts noble knights to shame!",
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
			Text = "[img]gfx/ui/events/event_82.png[/img][M] %blacksmith% eventually returns with the product of his hard work. The greatsword has a regal appearance, and you feel slightly intimidated just by looking at it.\n\n %blacksmith% proffers the blade to you almost as a squire would to a knight. Taken aback by his refined behavior, you accept the weapon rather clumsily.\n\n The greatsword is much lighter than you expected. You give it a few test swings, and though you are far from a master swordsman the swings are both swift and precise.\n\n From a distance, %otherbro1% whistles approvingly, and beside him %otherbro2% stands awestruck. Soon, the whole company is clamoring forward to admire the masterpiece.\n\n %blacksmith%\'s dignified expression quickly gives way to a wide grin as brother after brother claps him on the back amidst the boisterous cheering.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Craftsmanship like this makes me wonder why you left smithing behind...",
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
				local item = this.new("scripts/items/weapons/hackflows/masterwork_greatsword");
				item.m.Name = _event.m.Blacksmith.getNameOnly() + "\'s Masterwork Zweihander";
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				_event.m.Blacksmith.improveMood(2.0, "Crafted a weapon of exceptional quality");

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
			if (bro.getLevel() >= 8 && bro.getBackground().getID() == "background.hackflows_blacksmith")
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

