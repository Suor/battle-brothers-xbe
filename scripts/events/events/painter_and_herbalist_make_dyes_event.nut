this.painter_and_herbalist_make_dyes_event <- this.inherit("scripts/events/event", {
	m = {
		Painter = null,
		Herbalist = null
	},
	function create()
	{
		this.m.ID = "event.painter_and_herbalist_make_dyes";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_55.png[/img][M] As your company pauses briefly to make camp, you spot %painter% the painter and %herbalist% the herbalist together with just about every pot and cauldron the company owns. As you approach to check out what is going on, you are greeted by a swirl of color. %painter% pulls his arms out of a pot, turns around, and beams. %SPEECH_ON%Hey there, captain. Been somewhat of a personal challenge for me to figure out how to make some vibrant colors.%SPEECH_OFF% He reaches out to clap %herbalist% on the back, but sees some dye dripping off his fingers and thinks the better of it. %SPEECH_ON%This man right here\'s a right genius. This project is as much his as it is mine. I sorted out the color theory, and %herbalist% pulled out the plants from his bag of tricks. I\'ve got plenty of stuff to paint with, now.%SPEECH_OFF% You ask which of the two men will be responsible for scrubbing the cooking pot clean before the next meal. %herbalist% laughs. %SPEECH_ON%Make another fucker do it, cap. We\'ll pay you off by letting you sell the excess off at the next trading town, and the poor sods on cleaning duty will have their next night at the tavern covered by the two of us.%SPEECH_OFF% %painter% chimes in. %SPEECH_ON%We gotta get this stuff off ourselves anyway. Won\'t be able to do much besides spread it around in our current state.%SPEECH_OFF% Deciding that they make a fair point, you decide to head back to camp and mull it over.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Still well worth the mess.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Herbalist.getImagePath());
				this.Characters.push(_event.m.Painter.getImagePath());

				for( local i = 0; i < 4; i++ )
				{
					local item = this.new("scripts/items/trade/dies_item");
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

		if (brothers.len() < 4)
		{
			return;
		}

		local candidates_painter = [];
		local candidates_herbalist = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.painter")
			{
				candidates_painter.push(b);
			}

			if (b.getBackground().getID() == "background.herbalist")
			{
				candidates_herbalist.push(b);
			}
		}

		if (candidates_painter.len() == 0 || candidates_herbalist.len() == 0)
		{
			return;
		}

		this.m.Herbalist = candidates_herbalist[this.Math.rand(0, candidates_herbalist.len() - 1)];
		this.m.Painter = candidates_painter[this.Math.rand(0, candidates_painter.len() - 1)];
		this.m.Score = candidates_herbalist.len() * 10 + candidates_painter.len() * 20;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"herbalist",
			this.m.Herbalist.getName()
		]);
		_vars.push([
			"painter",
			this.m.Painter.getName()
		]);
	}

	function onClear()
	{
		this.m.Painter = null;
		this.m.Herbalist = null;
	}

});

