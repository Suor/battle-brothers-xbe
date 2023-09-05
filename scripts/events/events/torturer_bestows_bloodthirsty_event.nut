this.torturer_bestows_bloodthirsty_event <- this.inherit("scripts/events/event", {
	m = {
		Torturer = null,
		OtherBro1 = null,
		OtherBro2 = null,
		OtherBro3 = null
	},
	function create()
	{
		this.m.ID = "event.torturer_bestows_bloodthirsty";
		this.m.Title = "On the March...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_81.png[/img][M] You didn\'t expect it when %torturer% the torturer joined the company, but it turns out the man is actually quite the talkative type. Evidently chatting genially with his victims was one of %torturer%\'s unorthodox ways of keeping the job fresh.\n\n Now the chatterbox is sharing tales of pulling fingernails, breaking bones, and slicing flesh as if he were a drifter describing encounters with passersby on the road. Amazingly enough, the man has garnered somewhat of a fan club, with %otherbro1%, %otherbro2%, and %otherbro3% listening in with growing malicious glee. It seems that your comrades have gotten much more bloodthirsty as of late. You hope that their increased predilection for brutality will translate to fiercer and more efficient combat out on the battlefield.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Looks like our outfit just got a lot more bloodthirsty.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Torturer.getImagePath());
				this.Characters.push(_event.m.OtherBro1.getImagePath());
				local trait = this.new("scripts/skills/traits/bloodthirsty_trait");
				_event.m.OtherBro1.getSkills().add(trait);
				this.List.push({
					id = 10,
					icon = trait.getIcon(),
					text = _event.m.OtherBro1.getName() + " is now bloodthirsty"
				});
				_event.m.OtherBro2.getSkills().add(trait);
				this.List.push({
					id = 10,
					icon = trait.getIcon(),
					text = _event.m.OtherBro2.getName() + " is now bloodthirsty"
				});
				_event.m.OtherBro3.getSkills().add(trait);
				this.List.push({
					id = 10,
					icon = trait.getIcon(),
					text = _event.m.OtherBro3.getName() + " is now bloodthirsty"
				});
			}

		});
	}

	function onUpdateScore()
	{
		function canBecomeBloodthirsty( brother )
		{
			local skills = brother.getSkills();
			return !(skills.hasSkill("trait.craven") || skills.hasSkill("trait.weasel") || skills.hasSkill("trait.fainthearted") || skills.hasSkill("trait.hesistant") || skills.hasSkill("trait.insecure") || skills.hasSkill("trait.craven") || skills.hasSkill("trait.paranoid") || skills.hasSkill("trait.fear_beasts") || skills.hasSkill("trait.fear_undead") || skills.hasSkill("trait.fear_greenskins") || skills.hasSkill("trait.teamplayer") || skills.hasSkill("trait.bloodthirsty"));
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 5)
		{
			return;
		}

		local candidates_torturer = [];

		foreach( b in brothers )
		{
			if (b.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (b.getBackground().getID() == "background.torturer" && b.getLevel() >= 3)
			{
				candidates_torturer.push(b);
			}
			else if (this.m.OtherBro1 == null && this.canBecomeBloodthirsty(b))
			{
				this.m.OtherBro1 = b;
			}
			else if (this.m.OtherBro2 == null && this.canBecomeBloodthirsty(b))
			{
				this.m.OtherBro2 = b;
			}
			else if (this.m.OtherBro3 == null && this.canBecomeBloodthirsty(b))
			{
				this.m.OtherBro3 = b;
			}
		}

		if (candidates_torturer.len() == 0 || this.m.OtherBro1 == null || this.m.OtherBro2 == null || this.m.OtherBro3 == null)
		{
			return;
		}

		this.m.Torturer = candidates_torturer[this.Math.rand(0, candidates_torturer.len() - 1)];
		this.m.Score = candidates_torturer.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"torturer",
			this.m.Torturer.getName()
		]);
		_vars.push([
			"otherbro1",
			this.m.OtherBro1.getName()
		]);
		_vars.push([
			"otherbro2",
			this.m.OtherBro2.getName()
		]);
		_vars.push([
			"otherbro3",
			this.m.OtherBro3.getName()
		]);
	}

	function onClear()
	{
		this.m.Torturer = null;
		this.m.OtherBro1 = null;
		this.m.OtherBro2 = null;
		this.m.OtherBro3 = null;
	}

});

