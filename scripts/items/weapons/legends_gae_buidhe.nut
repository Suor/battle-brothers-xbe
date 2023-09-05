this.gae_buidhe <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.gae_buidhe";
		this.m.Name = "Gae Buidhe";
		this.m.Description = "A brilliant golden spear with a refined point that glistens even in the darkness. Wielders of the spear never miss a thrust. It is as if the weapon rewrites fate itself until the strike reaches its intended target. It is the sister spear of the Gae Dearg.";
		this.m.Categories = "Spear, One-Handed";
		this.m.IconLarge = "weapons/melee/gae_buidhe.png";
		this.m.Icon = "weapons/melee/gae_buidhe_stash.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Legendary;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_gae_buidhe";
		this.m.Condition = 72.0;
		this.m.ConditionMax = 72.0;
		this.m.Value = 10000;
		this.m.RegularDamage = 55;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 0.85;
		this.m.DirectDamageMult = 0.25;
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/perks/perk_57.png",
			text = "Primary attack has a lower threshold to inflict injuries"
		});
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Never misses a thrust"
		});
		return result;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/gae_buidhe_thrust"));
		this.addSkill(this.new("scripts/skills/actives/spearwall"));
	}

});

