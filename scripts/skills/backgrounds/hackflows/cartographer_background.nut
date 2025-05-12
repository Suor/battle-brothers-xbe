this.cartographer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_cartographer";
		this.m.Name = "Cartographer";
		this.m.Icon = "ui/backgrounds/background_cartographer.png";
		this.m.BackgroundDescription = "Cartographers specialize in the creation of accurate maps. Unlike historians, they have modest experience outdoors from their time spent travelling with supply caravans to map the landscape.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 8;
		this.m.Excluded = [
			"trait.athletic",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.cocky",
			"trait.dexterous",
			"trait.dumb",
			"trait.hate_beasts",
			"trait.impatient",
			"trait.iron_jaw",
			"trait.iron_lungs",
			"trait.irrational",
			"trait.spartan",
			"trait.strong",
			"trait.superstitious",
			"trait.tough"
		];
		this.m.Titles = [
			"the Studious",
			"the Cartographer",
			"the Mapmaker",
			"the Sketcher",
			"the Observant"
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.IsOffendedByViolence = true;
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
		return "{Plagued by a chronic illness since birth, %name% was never able to grow to the health and constitution of even an average man. Unable to help his hometown defend itself by joining the militia, %name% was scorned by his peers. Aghast at the shame he felt he was bringing upon his family, he one day risked life and limb by charting the local area and discovering locations of bandit hideouts. This information proved critical in repelling the next raid, and jeers turned quickly to praise for %name%\'s ability. Now he seeks to map places uncharted by man. He would be better suited to hire a mercenary band than join one; but nevertheless you muse that it would be nice to have another man with brains in the outfit.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-10, -5]
			Bravery = [-2, -2]
			Stamina = [-3, -3]
			MeleeSkill = [0, 0]
			RangedSkill = [0, 0]
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
		items.equip(this.new("scripts/items/armor/linen_tunic"));
		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}
	}

});

