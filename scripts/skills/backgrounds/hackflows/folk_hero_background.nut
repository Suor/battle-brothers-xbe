this.folk_hero_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_folk_hero";
		this.m.Name = "Folk Hero";
		this.m.Icon = "ui/backgrounds/background_folk_hero.png";
		this.m.BackgroundDescription = "Folk heroes are commoners that have achieved great heights, earning the admiration of the peasantry and begrudging respect of knights with their mythical deeds.";
		this.m.GoodEnding = "A man like %name% would always find a way. The hedge knight eventually, if not inevitably, left the company and set out on his own. Unlike many other brothers, he did not spend his crowns on land or ladders with which to climb the noble life. Instead, he bought himself the finest war horses and the talents of armorers. The behemoth of a man rode from one jousting tournament to the next, winning them all with ease. He\'s still at it to this day, and you think he won\'t stop until he\'s dead. The hedge knight simply knows no other life.";
		this.m.BadEnding = "%name% the hedge knight eventually left the company. He traveled the lands, returning to his favorite past time of jousting, which was really a cover for his real favorite past time of lancing men off horses in a shower of splinters and glory. At some point, he was ordered to \'throw\' a match against a pitiful and gangly prince to earn the nobleman some prestige. Instead, the hedge knight drove his lance through the man\'s skull. Furious, the lord of the land ordered the hedge knight killed. They say over a hundred soldiers took to his home and only half returned alive.";
		this.m.HiringCost = 5000;
		this.m.DailyCost = 25;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.bloodthirsty",
			"trait.brute",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.disloyal",
			"trait.drunkard",
			"trait.dumb",
			"trait.fainthearted",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.greedy",
			"trait.hesitant",
			"trait.impatient",
			"trait.insecure",
			"trait.irrational",
			"trait.quick",
			"trait.spartan",
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
			"the Folk Hero",
			"the Lionhearted",
			"the Just",
			"the Magnanimous",
			"the Storied",
			"the Humble"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsCombatBackground = true;
		this.m.IsLowborn = true;
		this.m.Level = this.Math.rand(5, 6);
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
		return "{Some say that men are born into their stations, destined either for great things or utter medocrity by the circumstances of their birth. %name% is a picture perfect contradiction of this mantra. Towering well over six feet tall, %name% exudes an aura of pure strength, but carries himself with a dignified reserve. Nearby peasants whisper amongst themselves in excited tones. Evidently, despite being born in abject poverty and orphaned early in life, %name% eventually became something of a folk hero, with feats including but not limited to facing a band of 20 brigands on his own and emerging victorious. As you ask him to separate the fact from fiction of this paricular myth, without looking up from his mug, he merely replies, \'25\'.}";
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
			Hitpoints = [14, 16]
			Bravery = [5, 5]
			Stamina = [15, 15]
			MeleeSkill = [10, 18]
			RangedSkill = [0, 0]
			MeleeDefense = [2, 6]
			RangedDefense = [2, 2]
			Initiative = [0, 0]
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
		r = this.Math.rand(0, 1);

		if (r == 0 && this.Const.DLC.Wildmen)
		{
			items.equip(this.new("scripts/items/weapons/named/named_bardiche"));
		}
		else
		{
			items.equip(this.new("scripts/items/weapons/named/named_greataxe"));
		}

		items.equip(this.new("scripts/items/armor/scale_armor"));
		r = this.Math.rand(1, 100);

		if (r > 85)
		{
			items.equip(this.new("scripts/items/helmets/greatsword_hat"));
		}
		else if (r > 65)
		{
			items.equip(this.new("scripts/items/helmets/greatsword_faction_helm"));
		}
	}

});

