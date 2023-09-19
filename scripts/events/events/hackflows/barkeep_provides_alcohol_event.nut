this.barkeep_provides_alcohol_event <- this.inherit("scripts/events/event", {
	m = {
		Barkeep = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_barkeep_provides_alcohol";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_24.png[/img][M] As you and your men stop briefly to rest you spy out of the corner of your eye some shadowy figures making their way towards the supply caravan. You shout out, grab your sword, and begin rushing towards the cart when %barkeep% the barkeep pokes his head out and gives you a friendly wave. %SPEECH_ON%What\'s got you yellin\' out like that for, captain?%SPEECH_OFF% You curse and demand to know if he\'s seen anything, only to be greeted by several strangers stacking some crates near your campsite. %barkeep% beams. %SPEECH_ON%Not to worry, captain. Made a connection with the tavern owner here last time we finished up a contract. Word got out that we frequent the tavern, seemed to be really, really good for business.%SPEECH_OFF% He gestures towards the new crates. %SPEECH_ON%Next few rounds are on them!%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Cheers!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Barkeep.getImagePath());
				local beer = this.new("scripts/items/supplies/beer_item");
				this.World.Assets.getStash().add(beer);
				this.List.push({
					id = 10,
					icon = "ui/items/" + beer.getIcon(),
					text = "You gain some beer."
				});
				local preserved_mead = this.new("scripts/items/supplies/preserved_mead_item");
				this.World.Assets.getStash().add(preserved_mead);
				this.List.push({
					id = 10,
					icon = "ui/items/" + preserved_mead.getIcon(),
					text = "You gain some preserved mead."
				});
				local wine = this.new("scripts/items/supplies/wine_item");
				this.World.Assets.getStash().add(wine);
				this.List.push({
					id = 10,
					icon = "ui/items/" + wine.getIcon(),
					text = "You gain some wine."
				});
				_event.m.Barkeep.improveMood(0.5, "Sourced some good drinks.");

				if (_event.m.Barkeep.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Barkeep.getMoodState()],
						text = _event.m.Barkeep.getName() + this.Const.MoodStateEvent[_event.m.Barkeep.getMoodState()]
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

		local brothers = this.World.getPlayerRoster().getAll();
		local towns = this.World.EntityManager.getSettlements();
		local playerTile = this.World.State.getPlayer().getTile();
		local nearTown = false;

		if (brothers.len() < 2)
		{
			return;
		}

		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return;
		}

		foreach( t in towns )
		{
			if (t.isMilitary() || t.isSouthern())
			{
				continue;
			}

			if (t.getFactionOfType(this.Const.FactionType.Settlement).getPlayerRelation() >= 70 && t.getTile().getDistanceTo(playerTile) <= 3 && t.isAlliedWithPlayer())
			{
				nearTown = true;
				break;
			}
		}

		if (!nearTown)
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.hackflows_barkeep")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Barkeep = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = candidates.len() * 15;
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
	}

	function onClear()
	{
		this.m.Barkeep = null;
	}

});

