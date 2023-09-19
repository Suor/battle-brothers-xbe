this.blacksmith_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_blacksmith";
		this.m.Name = "Blacksmith";
		this.m.Icon = "ui/backgrounds/background_blacksmith.png";
		this.m.BackgroundDescription = "The endurance and precision needed to forge weapons of war gives blacksmiths a head start in becoming combat ready.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 1000;
		this.m.DailyCost = 11;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.dumb",
			"trait.fainthearted",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.hesitant",
			"trait.insecure",
			"trait.irrational",
			"trait.swift",
			"trait.tiny",
			"trait.weasel"
		];
		this.m.Titles = [
			"the Smith",
			"the Smithy",
			"the Blacksmith",
			"the Metalworker",
			"the Forgemaster",
			"the Swordmaker",
			"the Crafter",
			"the Hammerer",
			"the Furnacemaster",
			"the Metalcaster"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
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
		return "{%name%’s father was a smith, and that man’s father before him as well, so naturally, he was quick to pick up the trade. | When his father passed at a young age, %name% was forced to start providing for the family, taking up smithing to keep mouths fed. | %name%’s family sword was a priceless heirloom passed down from generations, but after it disappeared in a break-in, %name% turned to smithing to forge a new blade for his family to take pride in.} {But when a local nobleman was unhappy with a dagger he commissioned, he sent his men to put the smith’s shop to the torch. | Filled with wanderlust, he set out to join a mercenary company, determined not to wither away in the shop he’s spent his whole life in. | Yet when his father rose from the grave and the rest of the cemetery with him, %name% vowed to put his hammer to a more righteous cause.}  {He tells you he can forge a blade so sharp it can cut through stone. You don’t know about that, but a blacksmith of his experience would be a fit for any company. | The man’s muscled arms are proof enough that he’s no stranger to the hammer - perhaps you can help him put it to a new use. | It’s doubtful the man has swung a sword in his life. But he has a soldier’s build, and with the proper training, you think you can mold him into a true fighter. | While he may not be a fearsome warrior, a smith like him is always handy to have around. You just hope he’s as good at striking foes as he is at striking nails. | He figured a band a of mercenaries would suit him, and while he’s no swordmaster, the might of his hammer arm suggests he might be right.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [4, 4]
			Bravery = [0, 0]
			Stamina = [4, 4]
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
		local r;
		r = this.Math.rand(0, 6);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/polehammer"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/warbrand"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/arming_sword"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/winged_mace"));
		}
		else
		{
			items.equip(this.new("scripts/items/weapons/warhammer"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/mail_hauberk"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/mail_shirt"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/kettle_hat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/padded_kettle_hat"));
		}
	}

});

