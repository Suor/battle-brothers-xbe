this.champion_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.champion";
		this.m.Name = "Champion";
		this.m.Icon = "ui/backgrounds/background_champion.png";
		this.m.BackgroundDescription = "Champions are knights that have gained renown as one on one fighters. Men of such repute are usually in the employ of noble houses and as such not typically in the market for mercenary work.";
		this.m.GoodEnding = "A man like %name% would always find a way. The hedge knight eventually, if not inevitably, left the company and set out on his own. Unlike many other brothers, he did not spend his crowns on land or ladders with which to climb the noble life. Instead, he bought himself the finest war horses and the talents of armorers. The behemoth of a man rode from one jousting tournament to the next, winning them all with ease. He\'s still at it to this day, and you think he won\'t stop until he\'s dead. The hedge knight simply knows no other life.";
		this.m.BadEnding = "%name% the hedge knight eventually left the company. He traveled the lands, returning to his favorite past time of jousting, which was really a cover for his real favorite past time of lancing men off horses in a shower of splinters and glory. At some point, he was ordered to \'throw\' a match against a pitiful and gangly prince to earn the nobleman some prestige. Instead, the hedge knight drove his lance through the man\'s skull. Furious, the lord of the land ordered the hedge knight killed. They say over a hundred soldiers took to his home and only half returned alive.";
		this.m.HiringCost = 4000;
		this.m.DailyCost = 45;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.bright",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.disloyal",
			"trait.drunkard",
			"trait.dumb",
			"trait.fainthearted",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.gluttonous",
			"trait.hesitant",
			"trait.insecure",
			"trait.paranoid",
			"trait.pessimist",
			"trait.quick",
			"trait.tiny",
			"trait.weasel"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Initiative,
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.Titles = [
			"the Legendary",
			"the Mighty",
			"the Unbeatable",
			"the Undefeated",
			"the Favorite",
			"the Champion",
			"the Steady",
			"the Mountain",
			"Strongface",
			"the Unbreakable",
			"the Knightslayer"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsCombatBackground = true;
		this.m.Level = 6;
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
		return "{Some say that there are but two types of men: those that know no defeat whose deeds invariably become the stuff of legends, and completely irrelevant milkdrinkers. Regardless of the veracity of this little idiom, one look at %name% and it is abundantly clear which class he would fall into. Despite his relative youth, %name% has already spent several years as a combat instructor at the local training hall. Why he wants to join a mercenary company now is unclear. You look at his desired wages and almost burst out laughing. All %name% has to say is that he is willing to take a pay cut if it means experiencing adventure again.}";
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		if (this.Math.rand(1, 100) <= 25)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [12, 18]
			Bravery = [10, 10]
			Stamina = [10, 12]
			MeleeSkill = [14, 14]
			RangedSkill = [0, 0]
			MeleeDefense = [8, 8]
			RangedDefense = [4, 4]
			Initiative = [-18, -10]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();

		if (this.Math.rand(0, 2) == 2)
		{
			local actor = this.getContainer().getActor();
			actor.setTitle(this.Const.Strings.HedgeKnightTitles[this.Math.rand(0, this.Const.Strings.HedgeKnightTitles.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		if (this.Const.DLC.Unhold)
		{
			r = this.Math.rand(0, 2);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/two_handed_flanged_mace"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/greatsword"));
			}
			else if (r == 2)
			{
				items.equip(this.new("scripts/items/weapons/two_handed_flanged_mace"));
			}
		}
		else
		{
			r = this.Math.rand(0, 1);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/two_handed_flanged_mace"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/greatsword"));
			}
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/mail_hauberk"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/scale_armor"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/armor/worn_mail_shirt"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/mail_coif"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/bascinet_with_mail"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
		}
	}

});

