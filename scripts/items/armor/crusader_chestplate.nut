this.crusader_chestplate <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.crusader_chestplate";
		this.m.Name = "Crusader Chestplate";
		this.m.Description = "A regal plate armor of pristine quality";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 10000;
		this.m.Condition = 350;
		this.m.ConditionMax = 350;
		this.m.StaminaModifier = -30;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "traditional_plate_" + variant;
		this.m.SpriteDamaged = "traditional_plate_" + variant + "_damaged";
		this.m.SpriteCorpse = "traditional_plate_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_body_armor_" + variant + ".png";
		this.m.Icon = "armor/icon_body_armor_" + variant + ".png";
	}

});

