this.drifter_joins_company_event <- this.inherit("scripts/events/event", {
	m = {
		Drifter = null,
		NewDrifter = null
	},
	function create()
	{
		this.m.ID = "event.drifter_joins_company";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_80.png[/img][M] Even though wanderers by their very nature disperse themselves across the whole wide world, some unseen force always conspires to draw them together. A perfect example of this is %drifter% the drifter. \n\nIt seems that somehow while on the march %drifter% made a friend with another drifter. Now that man is requesting to join the company. It doesn\'t seem like either man has an emotional stake in your decision, and having another fighting man in the line is always a boon, but then again it may not be best practice to accept just any random wanderer into your ranks...",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Welcome to the company!",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.NewDrifter);
						this.World.getTemporaryRoster().clear();
						_event.m.NewDrifter.onHired();
						return 0;
					}

				},
				{
					Text = "Move along, wanderer.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.NewDrifter = roster.create("scripts/entity/tactical/player");
				_event.m.NewDrifter.setStartValuesEx([
					"drifter_background"
				]);
				_event.m.NewDrifter.getBackground().buildDescription(true);

				if (_event.m.NewDrifter.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null)
				{
					_event.m.NewDrifter.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).removeSelf();
				}

				if (_event.m.NewDrifter.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
				{
					_event.m.NewDrifter.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand).removeSelf();
				}

				if (_event.m.NewDrifter.getItems().getItemAtSlot(this.Const.ItemSlot.Head) != null)
				{
					_event.m.NewDrifter.getItems().getItemAtSlot(this.Const.ItemSlot.Head).removeSelf();
				}

				this.Characters.push(_event.m.NewDrifter.getImagePath());
				this.Characters.push(_event.m.Drifter.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.drifter")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Drifter = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 10 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"drifter",
			this.m.Drifter.getName()
		]);
	}

	function onClear()
	{
		this.m.Drifter = null;
		this.m.NewDrifter = null;
	}

});

