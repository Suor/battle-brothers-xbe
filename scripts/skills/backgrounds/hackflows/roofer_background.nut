this.roofer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.roofer";
		this.m.Name = "Roofer";
		this.m.Icon = "ui/backgrounds/background_roofer.png";
		this.m.BackgroundDescription = "Due to the time spent atop ladders and in high places for their profession, roofers are sure-footed and have no issue maintaining their balance.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 330;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.bright",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.fainthearted",
			"trait.fat",
			"trait.fragile",
			"trait.hate_undead",
			"trait.night_blind",
			"trait.tiny",
			"trait.weasel"
		];
		this.m.Titles = [
			"the Roofer",
			"the Sure-footed",
			"the Tiler",
			"the Shingle Layer"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
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
		return "{%name% spent much of his life following the same trade as his father, inspecting, installing, and replacing roof materials to ensure that the buildings stayed upright and kept the cold out. Sadly, in recent times people have been much more concerned with getting food in their mouths instead of home maintenance. The roofer grumbles that winter will always come and that one day people will regret putting him out of work, but nonetheless until that day arrives he must find a way to get food in HIS mouth.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [2, 2]
			Bravery = [0, 0]
			Stamina = [5, 10]
			MeleeSkill = [0, 0]
			RangedSkill = [0, 0]
			MeleeDefense = [4, 6]
			RangedDefense = [0, 0]
			Initiative = [-3, -3]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local dirt = actor.getSprite("dirt");
		dirt.Visible = true;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/linen_tunic"));
	}

});

