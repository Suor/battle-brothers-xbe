this.paladin_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_paladin_commander";
		this.m.Name = "Paladin";
		this.m.Icon = "ui/backgrounds/background_paladin.png";
		this.m.BackgroundDescription = "Paladins are men whose deeds have achieved legendary status. It is a rare sight to see one for hire, and rarer still for a mercenary group to be able to afford one.";
		this.m.GoodEnding = "A man like %name% would always find a way. The hedge knight eventually, if not inevitably, left the company and set out on his own. Unlike many other brothers, he did not spend his crowns on land or ladders with which to climb the noble life. Instead, he bought himself the finest war horses and the talents of armorers. The behemoth of a man rode from one jousting tournament to the next, winning them all with ease. He\'s still at it to this day, and you think he won\'t stop until he\'s dead. The hedge knight simply knows no other life.";
		this.m.BadEnding = "%name% the hedge knight eventually left the company. He traveled the lands, returning to his favorite past time of jousting, which was really a cover for his real favorite past time of lancing men off horses in a shower of splinters and glory. At some point, he was ordered to \'throw\' a match against a pitiful and gangly prince to earn the nobleman some prestige. Instead, the hedge knight drove his lance through the man\'s skull. Furious, the lord of the land ordered the hedge knight killed. They say over a hundred soldiers took to his home and only half returned alive.";
		this.m.HiringCost = 6000;
		this.m.DailyCost = 66;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.bloodthirsty",
			"trait.bright",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.deathwish",
			"trait.disloyal",
			"trait.drunkard",
			"trait.dumb",
			"trait.eagle_eyes",
			"trait.fainthearted",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.gluttonous",
			"trait.greedy",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.hesitant",
			"trait.impatient",
			"trait.insecure",
			"trait.irrational",
			"trait.lucky",
			"trait.night_blind",
			"trait.night_owl",
			"trait.paranoid",
			"trait.pessimist",
			"trait.quick",
			"trait.short_sighted",
			"trait.spartan",
			"trait.superstitious",
			"trait.tiny",
			"trait.weasel"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Initiative,
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.Titles = [
			"the Hero",
			"the Legend",
			"the Paladin",
			"the Lionhearted",
			"the Just",
			"the Smiter",
			"the Blessed",
			"the Heroic",
			"Lightsworn",
			"Darkslayer",
			"Lightbringer",
			"the Knight"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(5, 6);
		this.m.IsCombatBackground = true;
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
		return "{A popular saying states, there are two types of men: good men, and powerful ones. %name% is a true diamond in the rough, his very existence perfectly contradicting the idiom. Peasants herald the man as a hero, for wherever he goes monster attacks invariably lessen, and then disappear, in intensity. You ask why he is even looking for a mercenary company. He merely tells you that he knows of dens of monsters that even he cannot handle alone. His exhorbitant asking salary is simply to cover his services for non monster related contracts in the meantime.}";
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
			Hitpoints = [
				14,
				20
			],
			Bravery = [
				15,
				23
			],
			Stamina = [
				14,
				18
			],
			MeleeSkill = [
				14,
				14
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				8,
				8
			],
			RangedDefense = [
				-4,
				0
			],
			Initiative = [
				-8,
				0
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/weapons/named/named_greatsword"));
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/coat_of_plates"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/coat_of_scales"));
		}

		items.equip(this.new("scripts/items/helmets/full_helm"));
	}
});

