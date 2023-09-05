this.hangman_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_hangman";
		this.m.Name = "Hangman";
		this.m.Icon = "ui/backgrounds/background_hangman.png";
		this.m.BackgroundDescription = "Hangmen are no strangers to death, but also have not seen it dealt in the myriad of sloppy methods out on the battlefield.";
		this.m.GoodEnding = "A former militiaman such as %name% eventually left the %companyname%. He traveled the lands, visiting villages and helping them establish credible militias with which to defend themselves. Finding success in an increasingly dangerous world, %name% eventually came to be a known name, called upon as a sort of \'fixer\' to come and ensure these villages would remain safe. Last you heard, he\'s purchased a plot of land and was raising a family far from the strife of the world.";
		this.m.BadEnding = "%name% left the collapsing company and returned to his village. Back in the militia, it wasn\'t long until {greenskins | raiders} attacked and he was called to action. It\'s said that he stood tall, rallying the defense as he slew through countless enemies before succumbing to mortal wounds. When you visited the village, you found children playfighting beneath a statue made in the militiaman\'s image.";
		this.m.HiringCost = 85;
		this.m.DailyCost = 7;
		this.m.Excluded = [
			"trait.ailing",
			"trait.athletic",
			"trait.bright",
			"trait.deathwish",
			"trait.drunkard",
			"trait.fragile",
			"trait.gluttonous",
			"trait.hate_undead",
			"trait.impatient",
			"trait.insecure",
			"trait.loyal",
			"trait.lucky",
			"trait.optimist",
			"trait.quick",
			"trait.short_sighted",
			"trait.spartan",
			"trait.swift",
			"trait.tough",
			"trait.weasel"
		];
		this.m.Titles = [
			"the Hangman",
			"the Executioner",
			"the Lever Arm",
			"the Last Word",
			"the Cold"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsLowborn = true;
	}

	function onBuildDescription()
	{
		return "{With a past as a coroner, %name% is and always has been unperturbed by the sight of death. Once, when in his town the local peasantry were looking to lynch a grave robber, %name% volunteered to pull the lever. Transitioning from examining dead bodies to creating them didn\'t weight heavily on %name%\'s conscience, and soon enough he became the town hangman. %name% returns your gaze with a cold expression and the eyes of a dead fish, stating simply that if acting the executioner could not stir his emotions, perhaps the heat of battle would.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [4, 4]
			Bravery = [4, 4]
			Stamina = [0, 0]
			MeleeSkill = [0, 0]
			RangedSkill = [0, 0]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 0]
			Initiative = [0, -2]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();

		if (this.Math.rand(0, 4) == 4)
		{
			local actor = this.getContainer().getActor();
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		local weapons = [
			"weapons/hooked_blade",
			"weapons/bludgeon",
			"weapons/hand_axe",
			"weapons/militia_spear",
			"weapons/shortsword"
		];

		if (this.Const.DLC.Wildmen)
		{
			weapons.extend([
				"weapons/warfork"
			]);
		}

		items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));

		if (items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null && this.Math.rand(1, 100) <= 50)
		{
			items.equip(this.new("scripts/items/shields/buckler_shield"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_lamellar"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}

		r = this.Math.rand(0, 6);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/aketon_cap"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/full_aketon_cap"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/open_leather_cap"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/full_leather_cap"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/helmets/straw_hat"));
		}
	}

});

