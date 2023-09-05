this.master_archer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_master_archer";
		this.m.Name = "Master Archer";
		this.m.Icon = "ui/backgrounds/background_master_archer.png";
		this.m.BackgroundDescription = "Master archers have spent their lives honing their abilities. Though they are extremely talented marksmen, they are incompetent melee fighters.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.athletic",
			"trait.bleeder",
			"trait.bloodthirsty",
			"trait.bright",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.dumb",
			"trait.fainthearted",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.gluttonous",
			"trait.hesitant",
			"trait.huge",
			"trait.impatient",
			"trait.insecure",
			"trait.iron_lungs",
			"trait.irrational",
			"trait.paranoid",
			"trait.strong",
			"trait.tiny",
			"trait.tough",
			"trait.weasel"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.MeleeDefense,
			this.Const.Attributes.MeleeSkill
		];
		this.m.Titles = [
			"the Master Marksman",
			"Sure-shot",
			"the Sniper",
			"the Headhunter",
			"the Longbowman",
			"the Peerless",
			"the Precise"
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.Level = this.Math.rand(3, 5);
		this.m.IsCombatBackground = true;
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
		return "{%name% is considered to be one of the most dangerous bowmen to walk the earth. Legends say that once, he slew 20 men at range in as many seconds, and that subdivisions of noble spy networks would be dedicated to tracking his movements. Sadly, as time went on his old age has deteriorated the most important sense for an archer: sight. Suspecting that if he settled down eventually someone would seek to kill him, %name% now seeks to keep his skills sharp out on the battlefield.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-16, -16]
			Bravery = [4, 4]
			Stamina = [-12, -5]
			MeleeSkill = [-12, -7]
			RangedSkill = [30, 30]
			MeleeDefense = [-5, -5]
			RangedDefense = [5, 8]
			Initiative = [10, 10]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/weapons/war_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/weapons/dagger"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else
		{
			items.equip(this.new("scripts/items/helmets/hunters_hat"));
		}
	}

});

