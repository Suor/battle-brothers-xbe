this.carpenter_lumberjack_quality_wood_event <- this.inherit("scripts/events/event", {
	m = {
		Carpenter = null,
		Lumberjack = null
	},
	function create()
	{
		this.m.ID = "event.carpenter_lumberjack_quality_wood";
		this.m.Title = "Near the Forests...";
		this.m.Cooldown = 15.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_25.png[/img][M] As your company rests near the treeline, %lumberjack% the lumberjack saunters casually into the forest. Before you can so much as call out to him, you can hear sounds of whistling and chopping. \n \n After a time, he emerges with a bundle of logs. \n \n %carpenter% perks up and speaks. %SPEECH_ON%Those are some good bowmaking logs there. I know we need some wood for the campfire later on, but what say I cut those up nicely and we sell \'em at the next town?%SPEECH_OFF% %lumberjack% drops the logs and brings his woodcutter\'s axe over his shoulder. %SPEECH_ON%Don\'t mind going another round. First set barely got me warmed up anyhow.%SPEECH_OFF% %lumberjack% ambles back into the woods and your carpenter gets to work. Before long, a few units of high quality wood are added to your stockpile.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Excellent!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Lumberjack.getImagePath());
				this.Characters.push(_event.m.Carpenter.getImagePath());
				local item = this.new("scripts/items/trade/quality_wood_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				item = this.new("scripts/items/trade/quality_wood_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				item = this.new("scripts/items/trade/quality_wood_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				item = this.new("scripts/items/trade/quality_wood_item");
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
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local currentTile = this.World.State.getPlayer().getTile();

		if (currentTile.Type != this.Const.World.TerrainType.Forest && currentTile.Type != this.Const.World.TerrainType.LeaveForest && currentTile.Type != this.Const.World.TerrainType.AutumnForest)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates_carpenter = [];
		local candidates_lumberjack = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.carpenter")
			{
				candidates_carpenter.push(b);
			}

			if (b.getBackground().getID() == "background.lumberjack")
			{
				candidates_lumberjack.push(b);
			}
		}

		if (candidates_carpenter.len() == 0 || candidates_lumberjack.len() == 0)
		{
			return;
		}

		this.m.Carpenter = candidates_carpenter[this.Math.rand(0, candidates_carpenter.len() - 1)];
		this.m.Lumberjack = candidates_lumberjack[this.Math.rand(0, candidates_lumberjack.len() - 1)];
		this.m.Score = candidates_carpenter.len() * 20 + candidates_lumberjack.len() * 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"lumberjack",
			this.m.Lumberjack.getName()
		]);
		_vars.push([
			"carpenter",
			this.m.Carpenter.getName()
		]);
	}

	function onClear()
	{
		this.m.Lumberjack = null;
		this.m.Carpenter = null;
	}

});

