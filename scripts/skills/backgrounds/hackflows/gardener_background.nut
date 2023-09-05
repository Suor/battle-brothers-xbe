this.gardener_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.gardener";
		this.m.Name = "Gardener";
		this.m.Icon = "ui/backgrounds/background_gardener.png";
		this.m.BackgroundDescription = "Gardeners are men with green thumbs often hired by noblemen to maintain extravant gardens as status symbols.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 80;
		this.m.DailyCost = 9;
		this.m.Excluded = [
			"trait.fear_undead",
			"trait.hate_undead",
			"trait.dumb",
			"trait.clumsy",
			"trait.asthmatic",
			"trait.athletic",
			"trait.brute",
			"trait.bloodthirsty",
			"trait.ailing"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Bravery
		];
		this.m.Titles = [
			"the Gardener",
			"Green Thumbed",
			"the Caretaker"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Untidy;
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
		return "{A somewhat meek individual by nature, %name% spent much of his life tending to the gardens in the lavish castles of higher nobility. When the lord\'s wife became pregnant while he was out on campagin, the household required a scapegoat. Poor %name% drew the short straw, and lacking the courage to prove his innocence, fled the estate. He does seem a bit more timid to you than normal, but nonetheless carries himself like an outdoorsman.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [-3, -3]
			Stamina = [4, 4]
			MeleeSkill = [0, 2]
			RangedSkill = [0, 0]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 0]
			Initiative = [4, 4]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/linen_tunic"));
	}

});

