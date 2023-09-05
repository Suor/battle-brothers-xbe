this.treasure_hunters_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.treasure_hunters_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_04.png[/img][M] You and your current companions have been a squad of treasure hunters for the past few years. Many capable and adventurous spirits have come and gone, either to peaceful retirements with their spoils or to unfortunate ends during the team\'s various escapades. \n\nAfter a particuarly risky and profitable endeavor, most of the squad was either killed or left with enough treasure to last for their entire lives. As they split off to go their separate ways, the spirit of adventure still remains in the four of you; the historian, the cartographer, the falconer, and of course, yourself. You decide to continue searching for treasure using your established system, but also seek glory as a mercenary company. After all, what is the point of adventuring if no one else hears of your exploits?",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "For treasure and glory!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
				local brothers = this.World.getPlayerRoster().getAll();
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "An End and a Beginning";
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local settlements = this.World.EntityManager.getSettlements();
		local closest;
		local distance = 9999;

		foreach( s in settlements )
		{
			local d = s.getTile().getDistanceTo(this.World.State.getPlayer().getTile());

			if (d < distance)
			{
				closest = s;
				distance = d;
			}
		}
	}

	function onClear()
	{
	}

});

