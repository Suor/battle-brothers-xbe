this.town_watchman_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.town_watchman";
		this.m.Name = "Town Watchman";
		this.m.Icon = "ui/backgrounds/background_town_watchman.png";
		this.m.BackgroundDescription = "Town Watchmen are hired by burgomeisters to keep the peace and identify early threats to a town.";
		this.m.GoodEnding = "A former militiaman such as %name% eventually left the %companyname%. He traveled the lands, visiting villages and helping them establish credible militias with which to defend themselves. Finding success in an increasingly dangerous world, %name% eventually came to be a known name, called upon as a sort of \'fixer\' to come and ensure these villages would remain safe. Last you heard, he\'s purchased a plot of land and was raising a family far from the strife of the world.";
		this.m.BadEnding = "%name% left the collapsing company and returned to his village. Back in the militia, it wasn\'t long until {greenskins | raiders} attacked and he was called to action. It\'s said that he stood tall, rallying the defense as he slew through countless enemies before succumbing to mortal wounds. When you visited the village, you found children playfighting beneath a statue made in the militiaman\'s image.";
		this.m.HiringCost = 75;
		this.m.DailyCost = 8;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clubfooted",
			"trait.craven",
			"trait.dastard",
			"trait.fat",
			"trait.hate_undead",
			"trait.insecure",
			"trait.night_blind",
			"trait.short_sighted"
		];
		this.m.Titles = [
			"the Overseer",
			"the Watcher",
			"the Town Watchman",
			"the Night Owl",
			"the Patrolman",
			"the Sentry"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.IsLowborn = true;
	}

	function onBuildDescription()
	{
		return "{To be able to combat a threat, one must first know of its existence. %name% the town watchman was responsible for just that, able to spot threats at a distance and rouse the town militia whenever enemies were on the approach. However, one night after a town festival %name% was too plastered to notice brigands creeping up for a raid, and the resulting losses weighed too heavily on his conscience for him to continue serving at his post. Now he seeks to join a mercenary crew, knowing fully well that they go after bandits at the source on a regular basis.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 3]
			Bravery = [-3, 5]
			Stamina = [5, 5]
			MeleeSkill = [5, 5]
			RangedSkill = [6, 7]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 0]
			Initiative = [0, 5]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		local weapons = [
			"weapons/bludgeon",
			"weapons/wooden_stick",
			"weapons/militia_spear"
		];
		items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));

		if (this.Math.rand(1, 100) <= 50)
		{
			items.equip(this.new("scripts/items/shields/buckler_shield"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/straw_hat"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/open_leather_cap"));
		}
	}

});

