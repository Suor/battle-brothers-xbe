this.torturer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.torturer";
		this.m.Name = "Torturer";
		this.m.Icon = "ui/backgrounds/background_torturer.png";
		this.m.BackgroundDescription = "All noblemen employ torturers, though few would admit it openly. Torturers\' personalities vary wildly from cruel detachment to psychotic malice. Nevertheless, they are all brutally efficient at inflcting pain and permanent damage.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 200;
		this.m.DailyCost = 8;
		this.m.Excluded = [
			"trait.athletic",
			"trait.bleeder",
			"trait.brave",
			"trait.clumsy",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.deathwish",
			"trait.drunkard",
			"trait.dumb",
			"trait.eagle_eyes",
			"trait.fainthearted",
			"trait.fearless",
			"trait.fragile",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hate_undead",
			"trait.impatient",
			"trait.insecure",
			"trait.iron_lungs",
			"trait.loyal",
			"trait.lucky",
			"trait.optimist",
			"trait.paranoid",
			"trait.pessimist",
			"trait.quick",
			"trait.superstitious",
			"trait.sure_footing",
			"trait.swift",
			"trait.teamplayer",
			"trait.tiny"
		];
		this.m.Titles = [
			"the Psychotic",
			"the Malicious",
			"the Torturer",
			"the Bloodletter",
			"the Cruel"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Thick;
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
		return "{Even in his youth, it was clear that %name%\'s mind was wired in a sinister way. He reveled in the suffering of the weak, torturing frogs, rabbits, and even cats with perverse glee. It wasn\'t long before his father begged the local lord to either cure the lad or lock him away. The lord however, sensed talent and did neither; opting instead to hire him as a torturer. You don\'t know why he is looking for mercenary work now...but you get the feeling that you don\'t want to know.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [5, 10]
			Bravery = [-5, 5]
			Stamina = [2, 3]
			MeleeSkill = [3, 4]
			RangedSkill = [0, 0]
			MeleeDefense = [0, -3]
			RangedDefense = [-3, 0]
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

