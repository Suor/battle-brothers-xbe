this.barkeep_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.barkeep";
		this.m.Name = "Barkeep";
		this.m.Icon = "ui/backgrounds/background_barkeep.png";
		this.m.BackgroundDescription = "Barkeeps have some brawling experience from breaking up fights at the taverns they work in.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 130;
		this.m.DailyCost = 8;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard",
			"trait.fainthearted",
			"trait.fat",
			"trait.fear_undead",
			"trait.fragile",
			"trait.hate_undead",
			"trait.insecure",
			"trait.irrational",
			"trait.tiny",
			"trait.weasel"
		];
		this.m.Titles = [
			"the Bartender",
			"the Barkeep",
			"the Brewer",
			"the Burly",
			"the Tapmaster",
			"the Hopper",
			"the Beer Brewer"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsLowborn = true;
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
		return "{A lifetime in the tavern has shaped %name% the barkeep into a hardy, burly, muscular man. In troubled times, %name% often had had to \'resolve disagreements\', \'escort patrons to the door\', or \'ensure that customers paid fairly\' on his own. Having heard his share of tales of heroic deeds, violent clashes, and exciting treasure hunts, %name% is more than ready to see the wide world for himself. He has a solid build; he might make a name for himself yet!";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [5, 10]
			Bravery = [0, 0]
			Stamina = [4, 4]
			MeleeSkill = [4, 0]
			RangedSkill = [0, 0]
			MeleeDefense = [2, 2]
			RangedDefense = [0, 0]
			Initiative = [-5, -5]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/armor/apron"));
		r = this.Math.rand(1, 100);

		if (r > 80)
		{
			items.addToBag(this.new("scripts/items/accessory/recovery_potion_item"));
		}
		else if (r > 60)
		{
			items.addToBag(this.new("scripts/items/accessory/iron_will_potion_item"));
		}
		else if (r > 40)
		{
			items.addToBag(this.new("scripts/items/accessory/lionheart_potion_item"));
		}
		else if (r > 20)
		{
			items.addToBag(this.new("scripts/items/accessory/night_vision_elixir_item"));
		}
	}

});

