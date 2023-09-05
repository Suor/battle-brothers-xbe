this.fletcher_upgrades_large_quiver_of_arrows_event <- this.inherit("scripts/events/event", {
	m = {
		Fletcher = null
	},
	function create()
	{
		this.m.ID = "event.fletcher_upgrades_large_quiver_of_arrows";
		this.m.Title = "At camp...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] As you\'re taking inventory during camp, %fletcher% walks in and hands you a quiver packed tightly with arrows. %SPEECH_ON%Got a look at the quivers our bowmen had to work with, captain. Figured I would apply my knowledge to get them to hold a few extra. No big deal, had some spare materials and time to do it.%SPEECH_OFF% Without waiting for an answer, %fletcher% walks away, leaving you to your work.",
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
				this.Characters.push(_event.m.Fletcher.getImagePath());
				local stash = this.World.Assets.getStash().getItems();

				foreach( i, item in stash )
				{
					if (item != null && item.getID() == "ammo.arrows" && item.getAmmoMax() == 14)
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

				local item = this.new("scripts/items/ammo/huge_quiver_of_arrows");
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
			if (bro.getLevel() >= 4 && bro.getBackground().getID() == "background.fletcher")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		local stash = this.World.Assets.getStash().getItems();
		local largeQuiverInInventory = false;

		foreach( item in stash )
		{
			if (item != null && item.getID() == "ammo.arrows" && item.getAmmoMax() == 14)
			{
				largeQuiverInInventory = true;
				break;
			}
		}

		if (!largeQuiverInInventory)
		{
			return;
		}

		this.m.Fletcher = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 10.0 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"fletcher",
			this.m.Fletcher.getNameOnly()
		]);
	}

	function onClear()
	{
		this.m.Fletcher = null;
	}

});

