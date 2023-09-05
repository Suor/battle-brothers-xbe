this.falconer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_falconer";
		this.m.Name = "Falconer";
		this.m.Icon = "ui/backgrounds/background_falconer.png";
		this.m.BackgroundDescription = "Falconers, as the name suggests, have mastery of falcons.";
		this.m.GoodEnding = "While the %companyname% continued on with great success, %name% the falconer eventually saw fit to leave it all behind. He returned to the forests, starting an aviary of trained falcons. All told, his experience as a mercenary didn\'t change his demeanor; %name% and his falcons transitioned smoothly from hunting men back to hunting beasts.";
		this.m.BadEnding = "With the decline of the %companyname% readily obvious, %name% the falconer departed from the company and returned to falconry. Unfortunately, he fell upon hard times and was forced to sell his prized birds to make ends meet. Last you heard, the decision drove him mad and he wandered off into the forest, never to be seen again.";
		this.m.HiringCost = 50;
		this.m.DailyCost = 14;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.hate_beasts",
			"trait.night_blind",
			"trait.clubfooted",
			"trait.dumb",
			"trait.brute",
			"trait.short_sighted",
			"trait.fat",
			"trait.clumsy",
			"trait.gluttonous",
			"trait.asthmatic",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard"
		];
		this.m.Titles = [
			"the Falconer",
			"the Birdmaster",
			"the Falconmaster",
			"the Woodsman",
			"Eagle Eye",
			"the Scoutmaster",
			"the Watcher"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
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
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "Can release falcons for no AP cost"
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Falcons released by the falconer reveal 16 tiles distance instead of 12"
			}
		];
	}

	function onBuildDescription()
	{
		return "{%name% always had a fascination with avian creatures. Little did he know, this fascination would one day become his niche on the battlefield. | %name%\'s father was a skilled hunter. Though %name% didn\'t share quite the same aptitude with the bow, his skill with birds made him an invaluable hunting companion. | Early in his life, %name% liked to traipse about the forests. Once, he chanced upon an injured falcon and took it under his wing. Since then, %name% has become a master of dealing with avian creatures.} {The falconer eventually realized that his knack for scouting for beasts in the forests could be just as easily applied to scouting enemy formations. | When a misplaced target callout led to a fellow woodsman being shot in the neck, %name% knew his career as a conventional falconer was over. | Sadly, a bad hunting season forced the birdmaster into seeking other means of income. | War drove the game out of the forests, and with them, %name%. Now he seeks another line of work.} {Any outfit could use an eagle eye such as this man. | Despite his humble backgrounds, %name% has already proven to be a valuable scout in many a noble war. | %name%\'s falcon is perched majestically atop his shoulder. It is clear that the two are extensions of each other. | %name% looks like he has something to prove - his sharp eyes and nimble movements may prove useful on the battlefield yet. | The falcon atop his shoulder has steely eyes; you suspect that it has seen many more battles from above than the average wannabe mercenary.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-3, -3]
			Bravery = [0, 0]
			Stamina = [0, 0]
			MeleeSkill = [0, 0]
			RangedSkill = [8, 10]
			MeleeDefense = [-5, 0]
			RangedDefense = [4, 4]
			Initiative = [14, 20]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/weapons/short_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		items.equip(this.new("scripts/items/accessory/falcon_item"));
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/weapons/knife"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}

		r = this.Math.rand(0, 1);

		if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hunters_hat"));
		}
	}

});

