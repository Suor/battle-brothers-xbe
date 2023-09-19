this.leper_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_leper";
		this.m.Name = "Leper";
		this.m.Icon = "ui/backgrounds/background_leper.png";
		this.m.BackgroundDescription = "Lepers are shunned from society for their ghastly appearance, but also benefit from a general lack of sensation.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 3;
		// A ridiculous list
		this.m.Excluded = [
			"trait.athletic",
			"trait.bleeder",
			"trait.bloodthirsty",
			"trait.bright",
			"trait.brute",
			"trait.clubfooted",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.determined",
			"trait.dexterous",
			"trait.disloyal",
			"trait.drunkard",
			"trait.eagle_eyes",
			"trait.fat",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fearless",
			"trait.fragile",
			"trait.gluttonous",
			"trait.greedy",
			"trait.impatient",
			"trait.insecure",
			"trait.iron_lungs",
			"trait.irrational",
			"trait.lucky",
			"trait.night_owl",
			"trait.quick",
			"trait.spartan",
			"trait.strong",
			"trait.superstitious",
			"trait.sure_footing",
			"trait.swift",
			"trait.tiny",
			"trait.weasel"
		];
		// this.m.MoreLikely <- [
		// 	"trait.spartan"
		// ]
		this.m.ExcludedTalents = [
			this.Const.Attributes.Hitpoints
		];
		this.m.Titles = [
			"the Dirty",
			"the Leper",
			"the Ragged",
			"the Sick",
			"the Outcast",
			"the Damned",
			"the Unlucky",
			"the Blighted"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
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
		return "{In his youth, %name% was a charmer full of panache, popular with every maiden in his village. | Coming from a long line of butchers, %name% never doubted that he would follow in his family\'s footsteps. | %name%’s life was an uneventful one - he was a simple man, making a modest living as a subsistence farmer.} {But after contracting a deadly plague, the man’s skin was left peeling and his face deformed. | Yet after a fateful day he blames on some woman he lay with, a horrible illness befell him, leaving his flesh decayed and numb. | It seemed his life would continue that way, but after mysterious symptoms started sprouting and his skin began to crumble, the people he once knew rejected him as a freak.} {Spurned from every other profession, the life of a mercenary was the only one left for him to turn to. You doubt it’ll be a successful life path for him, but it can’t be much worse than before. | He tells you he once fought off two children who pelted rocks at him as if you’ll be in respect of the feat. Considering the state he’s in now, you almost are. | Skin covered, voice hoarse, and arms weak, the man looks about as much of a mercenary as your grandmother. Just a bit less fierce. | You almost don’t feel right bringing the man into your ranks. But, who else to catch the arrows? | You doubt %name% will fit in a shieldwall, nor a pike line. Maybe he can be your mascot.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [8, 13]
			Bravery = [0, 5]
			Stamina = [-8, -8]
			MeleeSkill = [-6, 0]
			RangedSkill = [-12, -12]
			MeleeDefense = [0, 2]
			RangedDefense = [0, 0]
			Initiative = [-10, -6]
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
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}

		if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_wraps"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			local item = this.new("scripts/items/helmets/hood");
			item.setVariant(38);
			items.equip(item);
		}
	}

});

