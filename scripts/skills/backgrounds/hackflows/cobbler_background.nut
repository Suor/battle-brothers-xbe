this.cobbler_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_cobbler";
		this.m.Name = "Cobbler";
		this.m.Icon = "ui/backgrounds/background_cobbler.png";
		this.m.BackgroundDescription = "Cobblers are humble folk making a living by crafting footwear of all kinds.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 70;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.athletic",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.cocky",
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
		this.m.ExcludedTalents = [
			this.Const.Attributes.Bravery
		];
		this.m.Titles = [
			"the Shoemaker",
			"the Cobbler",
			"the Shoemender",
			"the Cordwainer",
			"Bootsmith",
			"Shoesmith"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
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
		return "{%name% the cobbler, much like the vast majority of peasants, has no interesting backstory. When you ask why he wishes to become a mercenary, he simply shrugs his shoulders, and mumbles something to the effect of shoemaking not making enough coin. Your eyebrows raise in surprise; his asking salary is pretty low as it is, so you accurately surmise that shoemaking is not the best craft to invest into.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [0, 0]
			Stamina = [0, 0]
			MeleeSkill = [2, 2]
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

