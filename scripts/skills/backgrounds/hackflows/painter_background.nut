this.painter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_painter";
		this.m.Name = "Painter";
		this.m.Icon = "ui/backgrounds/background_painter.png";
		this.m.BackgroundDescription = "Unsuited to the hardships of both combat and reality as a whole, painters nevertheless create beautiful artwork capable of briefly staving off the bleakness of life.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 140;
		this.m.DailyCost = 9;
		this.m.Excluded = [
			"trait.athletic",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.cocky",
			"trait.dexterous",
			"trait.dumb",
			"trait.hate_beasts",
			"trait.huge",
			"trait.impatient",
			"trait.iron_jaw",
			"trait.iron_lungs",
			"trait.irrational",
			"trait.paranoid",
			"trait.spartan",
			"trait.strong",
			"trait.superstitious",
			"trait.sure_footing",
			"trait.tough"
		];
		this.m.Titles = [
			"the Artist",
			"the Painter",
			"the Creator",
			"the Artisan"
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Thick;
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
		return "{In better days, %name% the painter spent his time painting beautiful landscapes and selling them to rich art collectors. Sadly, in these difficult times demand for such artwork has dried up. Lacking much in the way of other worldly skills, the hapless painter has been forced to turn to mercenary work. Though he certainly looks a little frail, he appears to be able to know his way around a sword about as well as any other man.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-8, -4]
			Bravery = [-5, 5]
			Stamina = [-2, 0]
			MeleeSkill = [0, 0]
			RangedSkill = [0, 0]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 0]
			Initiative = [0, 5]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/linen_tunic"));
	}

});

