this.blacksmith_repairs_armor_event <- this.inherit("scripts/events/event", {
	m = {
		Blacksmith = null
	},
	function create()
	{
		this.m.ID = "event.blacksmith_repairs_armor";
		this.m.Title = "At camp...";
		this.m.Cooldown = 5.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] While taking inventory you notice several pieces of armor are missing. Incensed at the prospect of a robber in your midst, you scour the campsite for clues about the perpetrator. You follow a heavy set of footprints to %blacksmith%, who is happily repairing the armor. He notices your approach and cracks a wide smile.%SPEECH_ON% Ho there, captain. Sorry for not letting you know sooner, but I figured I\'d keep my smithing skills sharp. Very useful skillset to have in these troubled times. Surely you agree, sir?%SPEECH_OFF%You nod approvingly, telling him to let you know next time he is in the mood to make some repairs.",
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
					if (item != null && item.isItemType(this.Const.Items.ItemType.Armor) && item.getCondition() < item.getConditionMax())
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

