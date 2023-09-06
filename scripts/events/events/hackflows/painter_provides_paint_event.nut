this.painter_provides_paint_event <- this.inherit("scripts/events/event", {
	m = {
		Painter = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_painter_provides_paint";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_128.png[/img][M] You and your company are on the road when %painter% the painter taps your shoulder and asks for a moment. %SPEECH_ON%Hey captain. Last time we stopped by a settlement I was able to get some materials for mixing paints. Had a few friends from back in the day, you see. Might not seem like much, but I managed to mix together some sets in the same colors as our banner. Should be able to paint our shields in company colors now!%SPEECH_OFF% You thank %painter% for his efforts. Gaudy as colors and artwork may be to the average mercenary crew, perhaps the visual unity they would bring to the crew would tigthen the bonds between the brothers over time.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Much appreciated.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Painter.getImagePath());

				for( local i = 0; i < 6; i++ )
				{
					local item = this.new("scripts/items/misc/paint_set_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}
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
			if (bro.getBackground().getID() == "background.hackflows_painter")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Painter = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 10.0 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"painter",
			this.m.Painter.getName()
		]);
	}

	function onClear()
	{
		this.m.Painter = null;
	}

});

