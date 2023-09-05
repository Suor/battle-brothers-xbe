this.treasure_hunters_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.treasure_hunters";
		this.m.Name = "Treasure Hunters";
		this.m.Description = "[p=c][img]gfx/ui/events/event_04.png[/img][/p][p]You\'ve been hunting for treasure for years. The original squad having split for various reasons, you and a few others decide to seek fame and glory in addition to treasure.\n\n[color=#bcad8c]Treasure Hunters:[/color] Start with a Historian, a Cartographer, and a Falconer.\n[color=#bcad8c]Fabled Three:[/color] You can never have more than 12 men in your roster, and if all of your three starting men should die, your campaign ends.\n[color=#bcad8c]Our Fair Share:[/color] Begin with a famed weapon and some treasure as booty from past adventures.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 100;
		this.m.IsFixedLook = true;
	}

	function isValid()
	{
		return this.Const.DLC.Desert;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local historian;
		historian = roster.create("scripts/entity/tactical/player");
		historian.setStartValuesEx([
			"historian_background"
		]);
		historian.getSkills().removeByID("trait.survivor");
		historian.getSkills().removeByID("trait.greedy");
		historian.getSkills().removeByID("trait.loyal");
		historian.getSkills().removeByID("trait.disloyal");
		historian.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		historian.setPlaceInFormation(3);
		historian.getFlags().set("IsPlayerCharacter", true);
		historian.getBaseProperties().Hitpoints += 8;
		historian.getBaseProperties().MeleeSkill += 3;
		historian.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
		historian.m.HireTime = this.Time.getVirtualTimeF();
		historian.m.PerkPoints = 2;
		historian.m.LevelUps = 2;
		historian.m.Level = 3;
		historian.m.Talents = [];
		historian.m.Attributes = [];
		local cartographer;
		cartographer = roster.create("scripts/entity/tactical/player");
		cartographer.setStartValuesEx([
			"hackflows/cartographer_background"
		]);
		cartographer.getSkills().removeByID("trait.survivor");
		cartographer.getSkills().removeByID("trait.greedy");
		cartographer.getSkills().removeByID("trait.loyal");
		cartographer.getSkills().removeByID("trait.disloyal");
		cartographer.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		cartographer.setPlaceInFormation(4);
		cartographer.getFlags().set("IsPlayerCharacter", true);
		cartographer.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
		cartographer.m.HireTime = this.Time.getVirtualTimeF();
		cartographer.getBaseProperties().MeleeSkill += 3;
		cartographer.getBaseProperties().Hitpoints += 10;
		cartographer.m.PerkPoints = 2;
		cartographer.m.LevelUps = 2;
		cartographer.m.Level = 3;
		cartographer.m.Talents = [];
		cartographer.m.Attributes = [];
		local falconer;
		falconer = roster.create("scripts/entity/tactical/player");
		falconer.setStartValuesEx([
			"hackflows/falconer_background"
		]);
		falconer.getSkills().removeByID("trait.survivor");
		falconer.getSkills().removeByID("trait.greedy");
		falconer.getSkills().removeByID("trait.loyal");
		falconer.getSkills().removeByID("trait.disloyal");
		falconer.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		falconer.setPlaceInFormation(5);
		falconer.getFlags().set("IsPlayerCharacter", true);
		falconer.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
		falconer.m.HireTime = this.Time.getVirtualTimeF();
		falconer.m.PerkPoints = 2;
		falconer.m.LevelUps = 2;
		falconer.m.Level = 3;
		falconer.m.Talents = [];
		falconer.m.Attributes = [];
		local bros = roster.getAll();
		local a;
		local u;
		bros[0].setTitle("the Brain");
		bros[0].getTalents().resize(this.Const.Attributes.COUNT, 0);
		bros[0].getTalents()[this.Const.Attributes.MeleeDefense] = 3;
		bros[0].getTalents()[this.Const.Attributes.Hitpoints] = 2;
		bros[0].getTalents()[this.Const.Attributes.MeleeSkill] = 3;
		bros[0].fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
		local historian_items = bros[0].getItems();
		historian_items.unequip(historian_items.getItemAtSlot(this.Const.ItemSlot.Body));
		historian_items.unequip(historian_items.getItemAtSlot(this.Const.ItemSlot.Head));
		historian_items.unequip(historian_items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		historian_items.unequip(historian_items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		a = this.new("scripts/items/armor/oriental/linothorax");
		bros[0].getItems().equip(a);
		a = this.new("scripts/items/helmets/greatsword_hat");
		bros[0].getItems().equip(a);
		bros[0].getItems().equip(this.new("scripts/items/weapons/dagger"));
		bros[0].improveMood(0.75, "Eager to begin an adventure as part of a mercenary band");
		bros[1].setTitle("the Heart");
		bros[1].getTalents().resize(this.Const.Attributes.COUNT, 0);
		bros[1].getTalents()[this.Const.Attributes.Hitpoints] = 3;
		bros[1].getTalents()[this.Const.Attributes.Fatigue] = 2;
		bros[1].getTalents()[this.Const.Attributes.MeleeDefense] = 3;
		bros[1].fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
		local cartographer_items = bros[1].getItems();
		cartographer_items.unequip(cartographer_items.getItemAtSlot(this.Const.ItemSlot.Body));
		cartographer_items.unequip(cartographer_items.getItemAtSlot(this.Const.ItemSlot.Head));
		cartographer_items.unequip(cartographer_items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		cartographer_items.unequip(cartographer_items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		a = this.new("scripts/items/armor/oriental/linothorax");
		cartographer.getItems().equip(a);
		a = this.new("scripts/items/helmets/greatsword_hat");
		bros[1].getItems().equip(a);
		bros[1].getItems().equip(this.new("scripts/items/weapons/arming_sword"));
		bros[1].getItems().equip(this.new("scripts/items/shields/oriental/metal_round_shield"));
		bros[1].improveMood(0.75, "Eager to begin an adventure as part of a mercenary band");
		bros[2].setTitle("the Eyes");
		bros[2].getTalents().resize(this.Const.Attributes.COUNT, 0);
		bros[2].getTalents()[this.Const.Attributes.RangedDefense] = 2;
		bros[2].getTalents()[this.Const.Attributes.Initiative] = 3;
		bros[2].getTalents()[this.Const.Attributes.RangedSkill] = 3;
		bros[2].fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
		local falconer_items = bros[2].getItems();
		falconer_items.unequip(falconer_items.getItemAtSlot(this.Const.ItemSlot.Body));
		falconer_items.unequip(falconer_items.getItemAtSlot(this.Const.ItemSlot.Head));
		falconer_items.unequip(falconer_items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		falconer_items.unequip(falconer_items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		a = this.new("scripts/items/armor/ragged_surcoat");
		bros[2].getItems().equip(a);
		a = this.new("scripts/items/helmets/hunters_hat");
		bros[2].getItems().equip(a);
		bros[2].getItems().equip(this.new("scripts/items/weapons/hunting_bow"));
		bros[2].improveMood(0.75, "Eager to begin an adventure as part of a mercenary band");
		bros[0].getBackground().m.RawDescription = "Once a member of a treasure hunting crew, " + historian.getName() + " became known as the Brain. He was sure to be able to identify any items of notable repute. He was also the resident expert for deciphering foreign runes and solving riddles. He hopes to bring these abilities and his modest combat skills to bear for the new company.";
		bros[0].getBackground().buildDescription(true);
		bros[1].getBackground().m.RawDescription = "Once a member of a treasure hunting crew, " + cartographer.getName() + " became known as the Heart. Early in life he was a mapmaker, and as a member of the treasure hunters, he helped pinpoint locations of interest. Alongside the Brain, this man was vital in tracking down treasure. And since the brain needs precious blood in order to flow, " + cartographer.getName() + " became the heart. He was a major part of the old crew as well, and his defensive capability was always a cut above the rest...relative to other mapmakers, at least.";
		bros[1].getBackground().buildDescription(true);
		bros[2].getBackground().m.RawDescription = "Once a member of a treasure hunting crew, " + falconer.getName() + " became known as the Eyes. For a treasure hunting squad, it was always imperative to be able to avoid any unncessary encounters, as well as to be able to get a quick understanding of the landscape. The falconer hopes to bring some much appreciated ranged utility to the new company.";
		bros[2].getBackground().buildDescription(true);
		this.World.Assets.m.BusinessReputation = 100;
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/dried_lamb_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/uncut_gems_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/jeweled_crown_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/ancient_gold_coins_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/looted_valuables_item"));
		local weapons = clone this.Const.Items.NamedWeapons;
		this.World.Assets.getStash().add(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		this.World.Assets.m.Money = this.World.Assets.m.Money / 2 - (this.World.Assets.getEconomicDifficulty() == 0 ? 0 : 300);
		this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
		this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 2;
		this.World.Assets.m.Ammo = 50;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isIsolatedFromRoads() && !randomVillage.isSouthern())
			{
				break;
			}

			i = ++i;
		}

		local randomVillageTile = randomVillage.getTile();

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 1), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 1));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 1), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 1));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) == 0)
				{
				}
				else if (!tile.HasRoad)
				{
				}
				else
				{
					randomVillageTile = tile;
					break;
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(9);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/civilians_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.treasure_hunters_intro");
		}, null);
	}

	function onInit()
	{
		this.World.Assets.m.BrothersMax = 12;
	}

	function onCombatFinished()
	{
		local roster = this.World.getPlayerRoster().getAll();
		local treasure_hunters = 0;

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				treasure_hunters = ++treasure_hunters;
				treasure_hunters = treasure_hunters;
			}
		}

		return treasure_hunters != 0;
	}

});

