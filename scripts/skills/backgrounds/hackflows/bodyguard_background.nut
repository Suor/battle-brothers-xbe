this.bodyguard_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_bodyguard";
		this.m.Name = "Bodyguard";
		this.m.Icon = "ui/backgrounds/background_bodyguard.png";
		this.m.BackgroundDescription = "Bodyguards are burly men that specialize in keeping people of interest from being killed.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 18;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.disloyal",
			"trait.drunkard",
			"trait.dumb",
			"trait.eagle_eyes",
			"trait.fainthearted",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.gluttonous",
			"trait.greedy",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hate_undead",
			"trait.hesitant",
			"trait.impatient",
			"trait.insecure",
			"trait.irrational",
			"trait.lucky",
			"trait.optimist",
			"trait.pessimist",
			"trait.quick",
			"trait.swift",
			"trait.tiny"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Initiative
		];
		this.m.Titles = [
			"the Bodyguard",
			"the Shield",
			"the Meatshield",
			"the Giant",
			"the Enforcer",
			"the Guard",
			"the Watchdog",
			"the Sentry",
			"the Invinicble",
			"the Impenetrable",
			"the Steadfast",
			"the Stalwart",
			"the Impregnable"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsCombatBackground = true;
		this.m.Level = this.Math.rand(2, 5);
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
		return "{The illegitimate son of a hedge knight, %name% was disowned by his father early in life for failing to inherit his \'killer\'s disposition\'. What %name% did inherit, however, was his father\'s towering physical build. He attracted the attention of a local lord after hearing news of a bear of a man singlehandedly repelling a bandit attack, and was hired on as a personal bodyguard. %name% served him faithfully for many years, until the lord eventually passed peacefully of old age. Because the lord lacked an heir, the succession struggle was messy, and soon %name% turned to mercenary work, in search of other great men to shield from evil.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [8, 8]
			Bravery = [5, 5]
			Stamina = [5, 5]
			MeleeSkill = [2, 2]
			RangedSkill = [-4, -4]
			MeleeDefense = [13, 15]
			RangedDefense = [6, 9]
			Initiative = [-15, -15]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(1, 100);

		if (r > 95)
		{
			items.equip(this.new("scripts/items/shields/named/named_full_metal_heater_shield"));
		}
		else if (r > 90)
		{
			items.equip(this.new("scripts/items/shields/named/named_golden_round_shield"));
		}
		else if (r > 45)
		{
			items.equip(this.new("scripts/items/shields/heater_shield"));
		}
		else
		{
			items.equip(this.new("scripts/items/shields/kite_shield"));
		}

		items.addToBag(this.new("scripts/items/accessory/bandage_item"));
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/heraldic_mail"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/flat_top_with_mail"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/kettle_hat_with_mail"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/kettle_hat"));
		}

		items.equip(this.new("scripts/items/weapons/winged_mace"));
	}

});

