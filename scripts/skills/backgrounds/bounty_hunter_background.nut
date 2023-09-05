this.bounty_hunter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.bounty_hunter";
		this.m.Name = "Bounty Hunter";
		this.m.Icon = "ui/backgrounds/background_bounty_hunter.png";
		this.m.BackgroundDescription = "Persistence is key. Bounty hunters are paid good coin to recover any human target, dead or alive.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 31;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.deathwish",
			"trait.drunkard",
			"trait.dumb",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.hesitant",
			"trait.huge",
			"trait.insecure",
			"trait.iron_jaw",
			"trait.iron_lungs",
			"trait.irrational",
			"trait.loyal",
			"trait.night_blind",
			"trait.night_owl",
			"trait.optimist",
			"trait.paranoid",
			"trait.superstitious",
			"trait.teamplayer",
			"trait.tough"
		];
		this.m.Titles = [
			"the Hunter",
			"the Bounty Hunter",
			"the Relentless",
			"the Hound",
			"the Dog",
			"the Eagle",
			"the Reaper",
			"the Persistent",
			"the Tracker"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
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
		return "{%name%\'s past is a mystery, as even those that have worked with him the past have seldom heard more than a few sentences unrelated to the task at hand. What is abundantly clear though, is that just as beast slayers specialize in eliminating the monstrosities of the world, so too does %name% the bounty hunter hunt monstrosities, specializing particularly in those that hide behind the mask of man. His line of work is already quite similar to a mercenary\'s; forking over the coin for a man like %name% would certainly be worthwhile for any reputable outfit.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [6, 0]
			Stamina = [4, 2]
			MeleeSkill = [9, 12]
			RangedSkill = [8, 8]
			MeleeDefense = [4, 2]
			RangedDefense = [0, 0]
			Initiative = [8, 10]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/tools/reinforced_throwing_net"));
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/weapons/crossbow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}
		else if (r == 1)
		{
			items.addToBag(this.new("scripts/items/weapons/rondel_dagger"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/fighting_axe"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/military_cleaver"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/scramasax"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}

		if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/ragged_dark_surcoat"));
		}
	}

});

