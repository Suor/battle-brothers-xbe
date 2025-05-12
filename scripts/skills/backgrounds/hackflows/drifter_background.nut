this.drifter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hackflows_drifter";
		this.m.Name = "Drifter";
		this.m.Icon = "ui/backgrounds/background_drifter.png";
		this.m.BackgroundDescription = "For one reason or another, drifters lack any city to call home, finding themselves wandering from place to place and doing odd jobs to keep themselves fed.";
		// TODO: update these
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-drifter retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";
		this.m.HiringCost = 90;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.bloodthirsty",
			"trait.brave",
			"trait.brute",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.fat",
			"trait.gluttonous",
			"trait.hesitant",
			"trait.iron_jaw",
			"trait.short_sighted",
		];
		this.m.Titles = [
			"the Drifter",
			"the Dirty",
			"the Outcast",
			"Fleetfoot",
			"the Wanderer",
			"the Homeless"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
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
			}
		];
	}

	function onBuildDescription()
	{
		return "{The third child born to a modest merchant family, %name% spent much of his early life idly wasting time with trivial pursuits. When his father died, %name%\'s older brother took over the family business, leaving %name% with a chunk of change to spend. Lacking direction in his life, %name% has since been wandering around in search of purpose. The man has a bit of an empty gaze. No matter. Your band has seen less able men join the shield wall.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-4, 2]
			Bravery = [0, 0]
			Stamina = [6, 8]
			MeleeSkill = [0, 0]
			RangedSkill = [0, 0]
			MeleeDefense = [0, 0]
			RangedDefense = [0, 3]
			Initiative = [5, 5]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/noble_tunic"));
		}
		else
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}

		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}
	}

});

