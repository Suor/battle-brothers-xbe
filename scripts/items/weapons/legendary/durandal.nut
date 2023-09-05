this.durandal <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 20
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.durandal";
		this.m.Name = "Durandal";
		this.m.Description = "This greatsword is a behemoth of a blade, sure to be wielded by a mountain of a man in the past. It is difficult for a man to even lift, let alone properly use, but those that gaze upon it shudder at the destruction it could wreak in the right hands.";
		this.m.Categories = "Sword, Two-Handed";
		this.m.IconLarge = "weapons/melee/sword_two_hand_01_named_03.png";
		this.m.Icon = "weapons/melee/sword_two_hand_01_named_03_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_named_greatsword_03";
		this.m.Value = 15000;
		this.m.ShieldDamage = 32;
		this.m.Condition = 100.0;
		this.m.ConditionMax = 100.0;
		this.m.StaminaModifier = -20;
		this.m.RegularDamage = 125;
		this.m.RegularDamageMax = 140;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.25;
		this.m.ChanceToHitHead = 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill_overheadStrike = this.new("scripts/skills/actives/overhead_strike");
		skill_overheadStrike.setStunChance(this.m.StunChance);
		skill_overheadStrike.setFatigueCost(skill_overheadStrike.getFatigueCostRaw() + 10);
		this.addSkill(skill_overheadStrike);
		local skill_split = this.new("scripts/skills/actives/split");
		skill_split.setFatigueCost(skill_split.getFatigueCostRaw() + 10);
		this.addSkill(skill_split);
		local skill_swing = this.new("scripts/skills/actives/swing");
		skill_swing.setFatigueCost(skill_swing.getFatigueCostRaw() + 10);
		this.addSkill(skill_swing);
		local skill_splitShield = this.new("scripts/skills/actives/split_shield");
		skill_splitShield.setFatigueCost(skill_splitShield.getFatigueCostRaw() + 10);
		this.addSkill(skill_splitShield);
	}

});

