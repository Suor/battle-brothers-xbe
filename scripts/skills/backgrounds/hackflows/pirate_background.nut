this.pirate_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.pirate";
		this.m.Name = "Pirate";
		this.m.Icon = "ui/backgrounds/background_pirate.png";
		this.m.BackgroundDescription = "Though sailing skills aren\'t applicable on dry land, fighting skills are. Pirates are used to the savagery of combat.";
		this.m.GoodEnding = "A former raider, %name% fit in well with the %companyname% and proved himself an excellent fighter. Having saved a veritable mountain of crowns, he retired from the company and returned from whence he came. He was last seen sailing a riverboat toward a small village.";
		this.m.BadEnding = "As the %companyname% speedily declined, %name% the raider departed from the company and went on his own way again. He returned to raiding, taking his greedy violence along the shorelines of river villages. You\'re not sure if it\'s true, but word has it that he was impaled with a pitchfork by a stable boy. Word has it that the town hoisted his body parts along the outer walls as a warning to future would-be raiders.";
		this.m.HiringCost = 10;
		this.m.DailyCost = 21;
		this.m.Excluded = [
			"trait.weasel",
			"trait.hate_undead",
			"trait.night_blind",
			"trait.ailing",
			"trait.asthmatic",
			"trait.clubfooted",
			"trait.hesitant",
			"trait.loyal",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure"
		];
		this.m.Titles = [
			"the Cutthroat",
			"the Marauder",
			"the Pirate",
			"Pegleg",
			"the Albatross",
			"the Toothless"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(2, 4);
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
		return "{Instilled with a love for the sea as a child, %name% started his life as a sailor aboard a merchant vessel. However, though the seas proved to be safe from monsters, it was unsafe from the greed and ambitions of man. Once while his ship was transporting some particularly valuable spices, it was boarded by pirates. His fellow crewmates were cut down almost to a man. %name% alone was spared because he provided the location of another treasure fleet. This second round of piracy was so successful that %name% was invited to join the pirate crew. Since then, merchant ships have become few and far between, and now %name% seeks to find his land legs again. He figures that mercenary work and piracy align well; you aren\'t entirely sure if you agree.}";
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

		if (this.Math.rand(1, 100) <= 40)
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
			Hitpoints = [0, 0]
			Bravery = [0, -3]
			Stamina = [5, 5]
			MeleeSkill = [6, 3]
			RangedSkill = [0, 0]
			MeleeDefense = [4, 2]
			RangedDefense = [4, 4]
			Initiative = [5, 5]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 5);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/falchion"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/flail"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/hand_axe"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/morning_star"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/military_pick"));
		}
		else if (r == 5)
		{
			items.equip(this.new("scripts/items/weapons/boar_spear"));
		}

		r = this.Math.rand(0, 0);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/shields/wooden_shield"));
		}

		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/padded_leather"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/worn_mail_shirt"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/leather_lamellar"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/dented_nasal_helmet"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet_with_rusty_mail"));
		}
	}

});

