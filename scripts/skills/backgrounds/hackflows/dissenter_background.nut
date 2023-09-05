this.dissenter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.dissenter";
		this.m.Name = "Dissenter";
		this.m.Icon = "ui/backgrounds/background_dissenter.png";
		this.m.BackgroundDescription = "Dissenters have trouble keeping their mouths shut, seeking mercenary work as a means to escape a grisly end at the hands of goons hired by the targets of their denunciations.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 80;
		this.m.DailyCost = 5;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.athletic",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.dexterous",
			"trait.disloyal",
			"trait.drunkard",
			"trait.fainthearted",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.gluttonous",
			"trait.greedy",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hate_undead",
			"trait.hesitant",
			"trait.huge",
			"trait.insecure",
			"trait.iron_jaw",
			"trait.optimist",
			"trait.pessimist",
			"trait.strong",
			"trait.survivor",
			"trait.teamplayer",
			"trait.weasel"
		];
		this.m.Titles = [
			"the Dissenter",
			"the Loudmouth",
			"the Disagreeable",
			"Sharptongue",
			"the Just"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.IsOffendedByViolence = true;
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
		return "{After watching his father executed without trial for a crime he didn\'t commit and his mother burned at the stake because of a bogus accusation, %name% the dissenter\'s heart has been filled with nothing but absolute hatred for nobility. Lacking the strength or skill to kill kings himself, his spends his time shouting for the peasantry to rise up and overthrow the existing political order. However, his vocalizations have largely fallen on deaf ears. You surmise that the reason %name% yet lives is that no one important takes him as a serious threat. As if reading your mind, the dissenter tells you that THAT is the exact reason he is looking to join a mercenary band.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0]
			Bravery = [15, 23]
			Stamina = [0, 0]
			MeleeSkill = [0, 0]
			RangedSkill = [0, 0]
			MeleeDefense = [-3, -3]
			RangedDefense = [-1, 1]
			Initiative = [0, 0]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}

		if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_wraps"));
		}
	}

});

