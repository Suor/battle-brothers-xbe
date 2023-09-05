this.atilliator_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_atilliator";
		this.m.Name = "Atilliator";
		this.m.Icon = "ui/backgrounds/background_atilliator.png";
		this.m.BackgroundDescription = "Atilliators tend to have some knowledge about how to use the ranged weaponry they used to craft.";
		this.m.GoodEnding = "While at a jousting tournament, a young boy was using an oddly shaped, yet perfectly crafted bow. His aiming hand was shaky, yet the arrows did not wobble upon being loosed. After he won the competition, you inquired about where the boy had gotten such an incredible bow. He stated that a bowyer by the name of %name% had crafted it. Apparently, he\'s known for making the finest bows in all the land!";
		this.m.BadEnding = "After you left the %companyname%, you sent a letter inquiring about the status of %name% the bowyer. You got word that he had discovered a way to craft the finest bow possible and, instead of giving this secret to the company, he departed to start his own business. He did not get far: whatever he had learned about his trade died with him on a muddy road out {north | south | west | east} of here, his body ironically skewered with what is said to have been a dozen arrows.";
		this.m.HiringCost = 80;
		this.m.DailyCost = 8;
		this.m.Excluded = [
			"trait.fear_undead",
			"trait.hate_undead",
			"trait.iron_jaw",
			"trait.athletic",
			"trait.clumsy",
			"trait.short_sighted",
			"trait.fearless",
			"trait.brave",
			"trait.iron_lungs",
			"trait.strong",
			"trait.tough",
			"trait.cocky",
			"trait.dumb",
			"trait.brute",
			"trait.bloodthirsty"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.MeleeSkill
		];
		this.m.Titles = [
			"the Crossbow Crafter",
			"the Atilliator",
			"the Crafter",
			"the Patient"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function onBuildDescription()
	{
		return "{With deft fingers and a gift for linking together machinery, %name% actually began his career as an architect for siege engines. However, after his lord\'s castle was assailed by catapaults and trebuchets of %name%\'s own design, %name% was forced to flee for his life and undergo a hasty career change. Fortunately for him his gift with machines applies just as well to crossbows as it does rockslingers. Having recently caught wind that his original lord has been on the hunt for him, %name% now seeks a more mobile occupation.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [-5, 0]
			Stamina = [-5, 0]
			MeleeSkill = [0, 0]
			RangedSkill = [10, 13]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 0]
			Initiative = [0, 0]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 100);

		if (r > 60)
		{
			items.equip(this.new("scripts/items/weapons/crossbow"));
		}
		else
		{
			items.equip(this.new("scripts/items/weapons/light_crossbow"));
		}

		items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		items.equip(this.new("scripts/items/armor/apron"));
		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}
	}

});

