this.locksmith_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.locksmith";
		this.m.Name = "Locksmith";
		this.m.Icon = "ui/backgrounds/background_locksmith.png";
		this.m.BackgroundDescription = "Locksmiths are men handy to have around when brute force isn\'t enough to crack open a door, catacomb, or treasure chest.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 80;
		this.m.DailyCost = 7;
		this.m.Excluded = [
			"trait.bloodthirsty",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.dumb",
			"trait.fat",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hate_undead",
			"trait.hesitant",
			"trait.huge",
			"trait.insecure",
			"trait.loyal",
			"trait.night_blind",
			"trait.paranoid",
			"trait.short_sighted",
			"trait.strong",
			"trait.teamplayer"
		];
		this.m.Titles = [
			"the Keymaster",
			"the Locksmith",
			"the Keymaker",
			"Lightfingered",
			"the Lockpicker",
			"the Nimble"
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
		return "{As a locksmith by trade, %name% has always had a knack for breaking open hard to open doors, chests, or vaults to reveal the hidden treasures inside. However, when hard times struck his hometown %name% found a shortage of things worth cracking open. Now he seeks to join a mercenary troop, seeking to use his skills to uncover undiscovered riches hidden away in the wilderness.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [0, 0]
			Stamina = [0, 0]
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

