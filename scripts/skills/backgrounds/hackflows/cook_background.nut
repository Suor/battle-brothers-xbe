this.cook_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_cook";
		this.m.Name = "Cook";
		this.m.Icon = "ui/backgrounds/background_cook.png";
		this.m.BackgroundDescription = "Cooks have little combat or travel experience, having spent most of their careers indoors preparing delicious meals for the local nobility.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 150;
		this.m.DailyCost = 8;
		this.m.Excluded = [
			"trait.ailing",
			"trait.athletic",
			"trait.bleeder",
			"trait.bloodthirsty",
			"trait.brave",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.cocky",
			"trait.deathwish",
			"trait.disloyal",
			"trait.eagle_eyes",
			"trait.greedy",
			"trait.hate_beasts",
			"trait.impatient",
			"trait.quick",
			"trait.spartan",
			"trait.strong",
			"trait.survivor",
			"trait.swift",
			"trait.tiny"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Fatigue
		];
		this.m.Titles = [
			"the Cook",
			"the Chef",
			"the Fat",
			"the Jolly"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
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
		return "{%name% the cook has always liked food. Once, during better times, a local lord contributed several delicacies to a peasant holiday. Upon sampling the baked treats, %name% was so overcome with emotion that he begged the lord to allow his chef to accept him as an understudy, so that he may bring smiles to other poor folk in the future. The gracious nobleman accepted, and for a time %name% spent happy years honing his craft. Sadly, after being caught sampling food from the larder during times of hardship, %name% has been kicked to the curb. Oddly enough, this hasn\'t seemed to bother the cook very much. He now seeks mercenary work so that he \'doesn\'t have to be so damn hungry all the time.\'}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [8, 14]
			Bravery = [-5, -5]
			Stamina = [2, -5]
			MeleeSkill = [0, 0]
			RangedSkill = [-4, 0]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 0]
			Initiative = [-4, -4]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/apron"));
	}

});

