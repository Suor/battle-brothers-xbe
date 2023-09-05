this.gae_dearg <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.gae_dearg";
		this.m.Name = "Gae Dearg";
		this.m.Description = "A spear with a point so sharp that men feel cuts on their body from merely gazing at it. The weapon is imbued with a deadly curse that enables it to pass through armor, magical or otherwise, to slice at the victim\'s flesh directly. It is the sister spear of the Gae Buidhe.";
		this.m.Categories = "Spear, One-Handed";
		this.m.IconLarge = "weapons/melee/gae_dearg.png";
		this.m.Icon = "weapons/melee/gae_dearg_stash.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Legendary;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_gae_dearg";
		this.m.Condition = 72.0;
		this.m.ConditionMax = 72.0;
		this.m.Value = 10000;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 55;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.4;
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Completely pierces through armor"
		});
		return result;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/gae_dearg_thrust"));
		this.addSkill(this.new("scripts/skills/actives/spearwall"));
	}

});

