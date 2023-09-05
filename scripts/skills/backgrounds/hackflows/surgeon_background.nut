this.surgeon_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.surgeon";
		this.m.Name = "Surgeon";
		this.m.Icon = "ui/backgrounds/background_surgeon.png";
		this.m.BackgroundDescription = "Capable surgeons are a rare find, and often have their hands full with patching up wounded soldiers and villagers alike. They are used to the sight of blood and have operated in high stress situations, but are below average combatants.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 730; // TODO: fix these two
		this.m.DailyCost = 13;
		this.m.Excluded = [
			"trait.iron_jaw",
			"trait.tough",
			"trait.strong",
			"trait.cocky",
			"trait.fat",
			"trait.bright",
			"trait.fearless",
			"trait.brave",
			"trait.determined",
			"trait.deathwish",
			"trait.greedy",
			"trait.athletic"
		];
		this.m.Titles = [
			"the Surgeon",
			"the Doc",
			"the Doctor",
			"the Medic"
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Skinny;
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
		return "{Learned medical men are a treasured rarity in these troubled times. Nonetheless, %name% is one such man, serving for years as a medic for noble armies and saving the lives of countless soldiers. However, when he failed to save an important nobleman\'s son, he was dishonorably discharged. Lacking the resources and assistants to work his previous miracles, %name% now seeks a much humbler life as a medic for a merceary group, stating that he has been due for some real adventure.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [4, 4]
			Stamina = [0, 0]
			MeleeSkill = [4, 4]
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
		items.equip(this.new("scripts/items/armor/butcher_apron"));
	}

});

