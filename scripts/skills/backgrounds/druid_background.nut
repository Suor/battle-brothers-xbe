this.druid_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {
		Tattoo = 0
	},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.druid";
		this.m.Name = "Druid";
		this.m.Icon = "ui/backgrounds/background_druid.png";
		this.m.BackgroundDescription = "Druids are men that are more in tune with mystic forces than the average layman.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 330;
		this.m.DailyCost = 14;
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.brave",
			"trait.bright",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard",
			"trait.dumb",
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
			"trait.insecure",
			"trait.loyal",
			"trait.night_blind",
			"trait.optimist",
			"trait.paranoid",
			"trait.pessimist",
			"trait.short_sighted",
			"trait.strong",
			"trait.superstitious",
			"trait.teamplayer",
			"trait.tough",
			"trait.weasel"
		];
		this.m.Titles = [
			"the Druid",
			"the Mystic",
			"the Mysterious",
			"the Nature Spirit",
			"the Channeler",
			"the Arcane"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.WildMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Wild;
		this.m.BeardChance = 100;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(1, 2);
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
		return "{The tattoos and runes printed upon %name% the druid\'s body make him quite a sight to behold in town. Raised in the wild from birth, yet not entirely lacking the mannerisms of civilized man, %name%\'s past is shrouded in mystery. The man informs you of that he is seeking mercenary work, for a druidic prophecy foretold that a band of brothers would one day face hordes of untold horrors. You aren\'t sure if you should hire him or not; either way his message is deeply unsettling.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [5, 5]
			Bravery = [6, 6]
			Stamina = [0, 5]
			MeleeSkill = [0, 0]
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
		this.m.Tattoo = this.Math.rand(0, 1);
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");
		local body = actor.getSprite("body");
		tattoo_body.setBrush((this.m.Tattoo == 0 ? "warpaint_01_" : "scar_02_") + body.getBrush().Name);
		tattoo_body.Visible = true;
		tattoo_head.setBrush(this.m.Tattoo == 0 ? "warpaint_01_head" : "scar_02_head");
		tattoo_head.Visible = true;
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush((this.m.Tattoo == 0 ? "warpaint_01_" : "scar_02_") + body.getBrush().Name);
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		items.equip(this.new("scripts/items/weapons/greenskins/goblin_staff"));
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

	function onSerialize( _out )
	{
		this.character_background.onSerialize(_out);
		_out.writeU8(this.m.Tattoo);
	}

	function onDeserialize( _in )
	{
		this.character_background.onDeserialize(_in);
		this.m.Tattoo = _in.readU8();
	}

});

