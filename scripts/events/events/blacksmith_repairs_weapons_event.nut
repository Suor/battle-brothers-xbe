this.blacksmith_repairs_weapons_event <- this.inherit("scripts/events/event", {
	m = {
		Blacksmith = null
	},
	function create()
	{
		this.m.ID = "event.blacksmith_repairs_weapons";
		this.m.Title = "At camp...";
		this.m.Cooldown = 5.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] While doing a quick patrol around camp you encounter %blacksmith% industriously repairing damaged weaponry. To his right is a small pile of weapons at various stages of disrepair; to his left are a few pieces that look almost brand new.%SPEECH_ON%Oh, hello sir. Sorry for not mentioning I was borrowing these from our armory. Smith\'s gotta keep his hands active, you see.%SPEECH_OFF% You wave off his apology and ask where he sourced the tools for his efforts.%SPEECH_ON%Oh, y\'know. The same way every smithy gets \'em.%SPEECH_OFF% You most certainly don\'t know, but it seems that %blacksmith% is happy and free repairs are certainly a big boon for your company. The blacksmith begins whistling cheerfully as you walk away.",
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
				this.Characters.push(_event.m.Blacksmith.getImagePath());
				local stash = this.World.Assets.getStash().getItems();
				local items = 0;

				foreach( item in stash )
				{
					if (item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.getCondition() < item.getConditionMax())
					{
						item.setCondition(item.getConditionMax());
						this.List.push({
							id = 10,
							icon = "ui/items/" + item.getIcon(),
							text = "Your " + item.getName() + " is repaired"
						});
						items = ++items;
						items = items;

						if (items > 5)
						{
							break;
						}
					}
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

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates_blacksmith = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.blacksmith")
			{
				candidates_blacksmith.push(b);
			}
		}

		if (candidates_blacksmith.len() == 0)
		{
			return;
		}

		this.m.Blacksmith = candidates_blacksmith[this.Math.rand(0, candidates_blacksmith.len() - 1)];
		this.m.Score = 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"blacksmith",
			this.m.Blacksmith.getName()
		]);
	}

	function onClear()
	{
		this.m.Blacksmith = null;
	}

});

