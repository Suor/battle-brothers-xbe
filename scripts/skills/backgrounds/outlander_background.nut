this.outlander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.outlander";
		this.m.Name = "Outlander";
		this.m.Icon = "ui/backgrounds/background_outlander.png";
		this.m.BackgroundDescription = "Outlanders come from faraway lands that take months or even years to reach by ship. They are hard to read at the best of times, but especially so in combat.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 24;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard",
			"trait.dumb",
			"trait.fainthearted",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.gluttonous",
			"trait.greedy",
			"trait.hate_undead",
			"trait.hesitant",
			"trait.huge",
			"trait.insecure",
			"trait.iron_jaw",
			"trait.tiny",
			"trait.tough"
		];
		this.m.Titles = [
			"the Outsider",
			"the Outlander",
			"the Outcast",
			"the Stranger",
			"the Foreigner",
			"the Silent",
			"the Unfamiliar"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.Names = this.Const.Strings.OutlanderNames;
		this.m.IsCombatBackground = true;
		this.m.IsNoble = true;
		this.m.Level = this.Math.rand(2, 3);
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
		return "{%name%\'s past is shrouded in mystery. There is only one thing for sure; the man is definitely not from here. How or why he ended up in this gods forsaken place, you do not know, and you have the distinct feeling you won\'t be finding out anytime soon.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 6]
			Bravery = [0, 10]
			Stamina = [0, 10]
			MeleeSkill = [13, 7]
			RangedSkill = [0, 13]
			MeleeDefense = [0, 3]
			RangedDefense = [0, 3]
			Initiative = [10, 10]
		};
		return c;
	}

	function onAddEquipment()
	{
		// local items = this.getContainer().getActor().getItems();

		// local weapons = ["noble_sword" "arming_sword"], weights = [1 3];
		// if (::Const.DLC.Wildmen) {
		// 	weapons.extend(["shamshir" "scimitar"]);
		// 	weights.extend([1 3]);
		// }
		// Items.setWeapon(items, Rand.choice(weapons, weights))
		// Items.setArmor(items, "noble_mail_armor");

		local items = this.getContainer().getActor().getItems();


		local r;

		if (this.Const.DLC.Wildmen)
		{
			r = this.Math.rand(1, 4);

			if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/shamshir"));
			}
			else
			{
				items.equip(this.new("scripts/items/weapons/scimitar"));
			}
		}
		else
		{
			items.equip(this.new("scripts/items/weapons/noble_sword"));
		}

		items.equip(this.new("scripts/items/armor/noble_mail_armor"));
	}

});

