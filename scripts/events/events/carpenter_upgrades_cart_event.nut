this.carpenter_upgrades_cart_event <- this.inherit("scripts/events/event", {
	m = {
		Carpenter = null
	},
	function create()
	{
		this.m.ID = "event.carpenter_upgrades_cart";
		this.m.Title = "On the road...";
		this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_128.png[/img][M] While on the march, you notice %carpenter% the carpenter duck back behind the supply wagon. When he fails to fall back into line after more than a few moments, you decide to go check on him. \n\n You find him busy at work slotting well cut boards of wood together and nailing them into place. Though the cart seemed quite packed to begin with, by the time %carpenter% is done working somehow some extra space seems to have opened up. You thank the carpenter for a job well done.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Always good to have a handyman around.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Carpenter.getImagePath());
				this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 18);
				this.List.push({
					id = 10,
					icon = "ui/icons/special.png",
					text = "You gain inventory space"
				});
				_event.m.Carpenter.improveMood(1.0, "Improved the company\'s cart");

				if (_event.m.Carpenter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Carpenter.getMoodState()],
						text = _event.m.Carpenter.getName() + this.Const.MoodStateEvent[_event.m.Carpenter.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (!this.World.Ambitions.getAmbition("ambition.cart").isDone())
		{
			return;
		}

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates_carpenter = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.hackflows_carpenter" && b.getLevel() >= 6)
			{
				candidates_carpenter.push(b);
			}
		}

		if (candidates_carpenter.len() == 0)
		{
			return;
		}

		this.m.Carpenter = candidates_carpenter[this.Math.rand(0, candidates_carpenter.len() - 1)];
		this.m.Score = candidates_carpenter.len() * 20;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"carpenter",
			this.m.Carpenter.getName()
		]);
	}

	function onClear()
	{
		this.m.Carpenter = null;
	}

});

