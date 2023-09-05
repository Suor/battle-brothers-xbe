this.lancer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.lancer";
		this.m.Name = "Lancer";
		this.m.Icon = "ui/backgrounds/background_lancer.png";
		this.m.BackgroundDescription = "Lancers, true to their namesake, are extremely proficient with lances and polearms. Though they perfom well in jousting tournaments, in terms of general combat hardiness they fall short of true knights.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 22;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard",
			"trait.dumb",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.gluttonous",
			"trait.hesitant",
			"trait.huge",
			"trait.impatient",
			"trait.insecure",
			"trait.irrational",
			"trait.night_blind",
			"trait.paranoid",
			"trait.pessimist",
			"trait.short_sighted",
			"trait.superstitious",
			"trait.tiny"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.Titles = [
			"the Lancer",
			"the Lance",
			"the Jouster",
			"the Spearman",
			"the Child of Light",
			"the Stabber"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.IsCombatBackground = true;
		this.m.Level = this.Math.rand(2, 4);
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
		return "{Having received special combat training in his youth, %name% used his spear proficiency to earn his living by entering and winning jousting tournaments. Yet as time went on the lancer felt the glory in the jousting ring to be incomplete. Now he seeks to make a name for himself in no holds barred combat.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [10, 3]
			Stamina = [4, 8]
			MeleeSkill = [13, 10]
			RangedSkill = [0, 0]
			MeleeDefense = [2, 4]
			RangedDefense = [0, 4]
			Initiative = [5, 5]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/weapons/fighting_spear"));
		items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
		r = this.Math.rand(1, 100);

		if (r > 95)
		{
			items.equip(this.new("scripts/items/helmets/sallet_helmet"));
		}
		else if (r > 70)
		{
			items.equip(this.new("scripts/items/helmets/closed_mail_coif"));
		}
		else if (r > 30)
		{
			items.equip(this.new("scripts/items/helmets/rusty_mail_coif"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/leather_lamellar"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_scale_armor"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}
	}

});

