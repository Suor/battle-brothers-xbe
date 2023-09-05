this.bounty_hunter_joins_company_event <- this.inherit("scripts/events/event", {
	m = {
		NewBountyHunter = null
	},
	function create()
	{
		this.m.ID = "event.bounty_hunter_joins_company";
		this.m.Title = "Along the Way...";
		this.m.Cooldown = 75.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_80.png[/img][M] You and the company are on the march when you are approached by a grizzled, tough looking man wielding a nasty looking weapon. Your men tense and you immediately begin surveying the area for a potential ambush when the man introduces himself as a bounty hunter. \n\n Evidently, the renown of the %companyname% has increased to the point that the man wants to lend his services as a mercenary. Very uncharacteristically, he is even willing to waive his normal recruitment fee if it means that the company will give him a chance. The man certainly looks like he can handle himself in battle...",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Welcome to the company!",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.NewBountyHunter);
						this.World.getTemporaryRoster().clear();
						_event.m.NewBountyHunter.onHired();
						return 0;
					}

				},
				{
					Text = "We are not looking for fresh recruits at this time.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.NewBountyHunter = roster.create("scripts/entity/tactical/player");
				_event.m.NewBountyHunter.setStartValuesEx([
					"hackflows/bounty_hunter_background"
				]);
				_event.m.NewBountyHunter.getBackground().buildDescription(true);
				this.Characters.push(_event.m.NewBountyHunter.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		if (this.World.Assets.getBusinessReputation() < 2250)
		{
			return;
		}

		this.m.Score = 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
		this.m.NewBountyHunter = null;
	}

});

