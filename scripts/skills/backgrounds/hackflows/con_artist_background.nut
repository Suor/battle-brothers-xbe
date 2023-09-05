this.con_artist_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_con_artist";
		this.m.Name = "Con Artist";
		this.m.Icon = "ui/backgrounds/background_con_artist.png";
		this.m.BackgroundDescription = "Con artists make their living by swindling other folks. Those astute enough to realize when they are pressing their luck often turn to mercenary work to begin anew.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 90;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard",
			"trait.dumb",
			"trait.fainthearted",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hate_undead",
			"trait.hesitant",
			"trait.huge",
			"trait.insecure",
			"trait.loyal",
			"trait.night_blind",
			"trait.short_sighted",
			"trait.spartan",
			"trait.strong",
			"trait.teamplayer",
			"trait.tiny",
			"trait.tough"
		];
		this.m.Titles = [
			"the Con Artist",
			"the Scammer",
			"Two Face",
			"the Trickster",
			"the Thief",
			"the Untrustworthy",
			"the Cheat",
			"the Hustler"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
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
		return "{%name% the con artist eyes you nervously as you approach. Before you can a word out he exclaims that he doesn\'t owe you any money and that any purchases made were final. As it turns out, the scammer has been on the run for so long and from so many people that for a moment you begin to wonder if he really DOES owe you cash. He has a dangerous, desperate look in his eyes, and is undoubtedly looking for a mercenary crew for some protection. You know little else of his background, but what else is even relevant to know?";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [0, 0]
			Stamina = [0, 0]
			MeleeSkill = [4, 4]
			RangedSkill = [2, 2]
			MeleeDefense = [2, 2]
			RangedDefense = [2, 2]
			Initiative = [5, 5]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/noble_tunic"));
		}
		else
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}

		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}
	}

});

