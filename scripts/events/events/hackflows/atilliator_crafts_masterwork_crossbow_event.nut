this.atilliator_crafts_masterwork_crossbow_event <- this.inherit("scripts/events/event", {
	m = {
		Atilliator = null,
		OtherBro1 = null,
		OtherBro2 = null
	},
	function create()
	{
		this.m.ID = "event.atilliator_crafts_masterwork_crossbow";
		this.m.Title = "Close to Town...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] %atilliator% the atilliator approaches you with hat in hand. Evidently he\'s been gathering high quality crossbow components with his own coin in order to build a legendary crossbow, but is lacking the crowns for several crucial pieces.\n\n 5,000 crowns is certainly a very hefty price, but %atilliator% has drawn up a schematic and is confident he can build one. \n\n You get the feeling that if you deny him now he won\'t have another chance to gather the remaining pieces.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Craft a crossbow that can pierce through the thickest armor!",
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
				this.Characters.push(_event.m.Atilliator.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] The final product does not appear to be all that remarkable. It isn\'t bigger than a standard heavy crossbow, and though the weapon looks beautiful functionally there seems to be no difference. \n\n That is, until you load a bolt and loose it towards a tree off in the distance. The sound of impact comes much sooner than you anticipated, and upon closer examination the bolt is buried almost fully into the sturdy trunk. You congratulate the atilliator for a job well done.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It\'s almost as if I\'m holding a cannon...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Atilliator.getImagePath());
				this.World.Assets.addMoney(-5000);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]5,000[/color] Crowns"
				});
				local item = this.new("scripts/items/weapons/hackflows/masterwork_crossbow");
				item.m.Name = _event.m.Atilliator.getNameOnly() + "\'s Masterwork Crossbow";
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				_event.m.Atilliator.improveMood(2.0, "Crafted a weapon of exceptional quality");

				if (_event.m.Atilliator.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Atilliator.getMoodState()],
						text = _event.m.Atilliator.getName() + this.Const.MoodStateEvent[_event.m.Atilliator.getMoodState()]
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

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 8 && bro.getBackground().getID() == "background.hackflows_atilliator")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Atilliator = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = candidates.len() * 300;
	}

	function onPrepare()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		foreach( bro in brothers )
		{
			if (bro.getID() != this.m.Atilliator.getID())
			{
				this.m.OtherBro1 = bro;
				break;
			}
		}

		foreach( bro in brothers )
		{
			if (bro.getID() != this.m.Atilliator.getID() && bro.getID() != this.m.OtherBro1.getID())
			{
				this.m.OtherBro2 = bro;
				break;
			}
		}
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"atilliator",
			this.m.Atilliator.getNameOnly()
		]);
		_vars.push([
			"otherbro1",
			this.m.OtherBro1.getName()
		]);
		_vars.push([
			"otherbro2",
			this.m.OtherBro2.getName()
		]);
	}

	function onClear()
	{
		this.m.Atilliator = null;
		this.m.OtherBro1 = null;
		this.m.OtherBro2 = null;
	}

});

