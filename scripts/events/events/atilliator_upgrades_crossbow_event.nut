this.atilliator_upgrades_crossbow_event <- this.inherit("scripts/events/event", {
	m = {
		Atilliator = null
	},
	function create()
	{
		this.m.ID = "event.atilliator_upgrades_crossbow";
		this.m.Title = "At camp...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] As you\'re taking inventory during camp, %atilliator% walks in and hands you a nice looking crossbow. %SPEECH_ON%Had some spare components on me, captain. Figured I would perform some upgrades to one of the crossbows we had. Used to make these for a living, after all.%SPEECH_OFF% Without waiting for an answer, %atilliator% walks away, leaving you to your work.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Excellent.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Atilliator.getImagePath());
				local stash = this.World.Assets.getStash().getItems();

				foreach( i, item in stash )
				{
					if (item != null && item.getID() == "weapon.crossbow")
					{
						stash[i] = null;
						this.List.push({
							id = 10,
							icon = "ui/items/" + item.getIcon(),
							text = "You lose " + item.getName()
						});
						break;
					}
				}

				local item = this.new("scripts/items/weapons/heavy_crossbow");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 4 && bro.getBackground().getID() == "background.hackflows_atilliator")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		local stash = this.World.Assets.getStash().getItems();
		local crossbowInInventory = false;

		foreach( item in stash )
		{
			if (item != null && item.getID() == "weapon.crossbow")
			{
				crossbowInInventory = true;
				break;
			}
		}

		if (!crossbowInInventory)
		{
			return;
		}

		this.m.Atilliator = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 5.0 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"atilliator",
			this.m.Atilliator.getNameOnly()
		]);
	}

	function onClear()
	{
		this.m.Atilliator = null;
	}

});

