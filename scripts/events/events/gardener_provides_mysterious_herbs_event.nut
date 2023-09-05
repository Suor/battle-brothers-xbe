this.gardener_provides_mysterious_herbs_event <- this.inherit("scripts/events/event", {
	m = {
		Gardener = null
	},
	function create()
	{
		this.m.ID = "event.gardener_provides_mysterious_herbs";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 40.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_25.png[/img][M] As the %companyname% is on the march, you make your way to the supply wagon to check on inventory. There, you spot %gardener% the gardener, trowel in hand, tending a few strange plants in a plot of soil made from an empty crate. Noticing your presence, %gardener% turns around and speaks. %SPEECH_ON%Good timing, captain. I\'ve been working on keeping my thumb green while on the road...figured it wouldn\'t be too much of a hassle to grow some medicinal herbs as I did so. Keep the skills sharp while helping the company, sir.%SPEECH_OFF%He puts the trowel down and hands you a few herbs.%SPEECH_ON%Most of these can be used to craft medicine. A couple here can also make a damn fine tea...I\'d like to keep these as a reminder of past happy days.%SPEECH_ON%His gaze shifts, as if by staring off into the distance he might better visualize his past. It lasts only a couple moments, but %gardener% coughs and awkwardly returns to his work. Not minding this turn of events, you add the herbs to the inventory and begin working on your task.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Perhaps we can make some use of these herbs...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Gardener.getImagePath());

				for( local i = 0; i < 4; i++ )
				{
					local item = this.new("scripts/items/misc/mysterious_herbs_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}

				this.World.Assets.addMedicine(6);
				this.result.push({
					id = 10,
					icon = "ui/icons/asset_medicine.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + 6 + "[/color] Medical Supplies."
				});
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.gardener")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Gardener = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 20.0 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"gardener",
			this.m.Gardener.getName()
		]);
	}

	function onClear()
	{
		this.m.Gardener = null;
	}

});

