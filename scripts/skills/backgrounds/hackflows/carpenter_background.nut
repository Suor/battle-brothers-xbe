this.carpenter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_carpenter";
		this.m.Name = "Carpenter";
		this.m.Icon = "ui/backgrounds/background_carpenter.png";
		this.m.BackgroundDescription = "Carpenters can often be found in forest settlements, doing the critical work of converting logs to high quality planks.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 70;
		this.m.DailyCost = 7;
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
			"the Craftsman",
			"the Carpenter",
			"the Woodworker"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
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
		return "{From humble beginnings was raised a humble man. %name% the carpenter lived simply, taking up the fine work that his father and his grandfather had before. He and his older brother had made a great team. His brother had a much stronger build, and so chopped the wood that %name% would then cut into workable construction materials. One day %name%\'s brother ventured into the forests to chop wood, but never returned in the evening. %name%, seeking answers, small in stature but not in bravery, now seeks to solve the mystery of his older brother once and for all.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [4, 4]
			Bravery = [0, 0]
			Stamina = [-2, -2]
			MeleeSkill = [3, 3]
			RangedSkill = [0, 0]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 0]
			Initiative = [0, 0]
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

