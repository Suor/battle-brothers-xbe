this.skirmisher_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_skirmisher";
		this.m.Name = "Skirmisher";
		this.m.Icon = "ui/backgrounds/background_skirmisher.png";
		this.m.BackgroundDescription = "Skirmishers are light combatants that specialize in harassing larger groups of heavily armored soldiers. They can do a surprising amount of damage, but are unsuited to direct confrontation.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 330;
		this.m.DailyCost = 10;
		this.m.Excluded = [
			"trait.brave",
			"trait.clubfooted",
			"trait.fat",
			"trait.fearless",
			"trait.hate_undead",
			"trait.loyal",
			"trait.night_blind",
			"trait.short_sighted"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Bravery
		];
		this.m.Titles = [
			"the Skirmisher",
			"the Lightfooted",
			"the Ambusher"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsCombatBackground = true;
		this.m.IsLowborn = true;
		this.m.Level = this.Math.rand(1, 2);
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
		return "{%name% the skirmisher is a member of an emerging class of fighters specializing in midranged combat. Armed only with several packs of throwing weapons, and light armor, %name% has dedicated his life to dealing maximum damage to the enemy while skirting the edge of disaster. You ask %name% how he summons the courage to pursue such an aggressive fighting style. He merely shrugs and tells you that becoming a frontliner wasn\'t likely to earn him any heavier defensive gear anyway.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-5, 0]
			Bravery = [-4, 0]
			Stamina = [6, 8]
			MeleeSkill = [5, 5]
			RangedSkill = [15, 7]
			MeleeDefense = [0, 2]
			RangedDefense = [0, 3]
			Initiative = [10, 10]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r == 0 && this.Const.DLC.Wildmen)
		{
			items.equip(this.new("scripts/items/weapons/barbarians/heavy_javelin"));
			items.addToBag(this.new("scripts/items/weapons/javelin"));
		}
		else if (r == 1 || r == 0)
		{
			items.equip(this.new("scripts/items/weapons/javelin"));
			items.addToBag(this.new("scripts/items/weapons/javelin"));
		}
		else
		{
			items.equip(this.new("scripts/items/weapons/throwing_axe"));
			items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
		}

		items.equip(this.new("scripts/items/shields/heater_shield"));
		items.equip(this.new("scripts/items/armor/padded_surcoat"));
	}

});

