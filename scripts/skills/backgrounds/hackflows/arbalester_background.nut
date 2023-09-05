this.arbalester_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.arbalester";
		this.m.Name = "Arbalester";
		this.m.Icon = "ui/backgrounds/background_arbalester.png";
		this.m.BackgroundDescription = "Arbalesters have served as professional crossbowmen at some point in their lives.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.bloodthirsty",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.determined",
			"trait.drunkard",
			"trait.dumb",
			"trait.fearless",
			"trait.fragile",
			"trait.gluttonous",
			"trait.hate_undead",
			"trait.huge",
			"trait.impatient",
			"trait.insecure",
			"trait.iron_jaw",
			"trait.irrational",
			"trait.night_blind",
			"trait.quick",
			"trait.short_sighted",
			"trait.strong",
			"trait.weasel"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.MeleeSkill,
			this.Const.Attributes.MeleeDefense
		];
		this.m.Titles = [
			"the Arbalester",
			"the Crossbowman",
			"the Sniper",
			"the Precise"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.IsCombatBackground = true;
		this.m.Level = this.Math.rand(1, 3);
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
		return "{%name%\'s father was a bowyer of significant repute, as far as lowly bowmakers could go. In his youth, %name% never doubted that one day he would take up the craft to continue the family\'s legacy. Sadly, this future was not be. His father was brutally murdered by a nobleman, who upon discovering the superior quality of his order, sought to keep a similar weapon out of his enemy\'s hands. Seeking revenge, %name% took up the crossbow, swearing an oath that one day he would humiliate the offender by ending him with a crossbow bolt between the eyes. He returns your gaze with a fiery expression, stating that he would never fulfill this aim by keeping watch atop fortress battlements. You silently agree.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-5, 0]
			Bravery = [0, 0]
			Stamina = [4, 4]
			MeleeSkill = [0, 0]
			RangedSkill = [13, 15]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 3]
			Initiative = [0, 0]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/weapons/crossbow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		r = this.Math.rand(1, 100);

		if (r > 90)
		{
			items.equip(this.new("scripts/items/armor/leather_lamellar"));
		}
		else if (r > 70)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}
		else if (r > 40)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}

		r = this.Math.rand(1, 100);

		if (r > 75)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}
		else if (r > 50)
		{
			items.equip(this.new("scripts/items/helmets/aketon_cap"));
		}
	}

});

