this.lancer_gae_buidhe_event <- this.inherit("scripts/events/event", {
	m = {
		Lancer = null
	},
	function create()
	{
		this.m.ID = "event.lancer_gae_buidhe";
		this.m.Title = "During Camp...";
		this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] The %companyname% pauses for a brief respite. While you are managing the company\'s ledgers you see %lancer% the lancer approaching you with a long bundle wrapped in purple silk. He waits for you to make a few final strokes with your quill before speaking. %SPEECH_ON%Greetings, captain. I\'ve been with %companyname% for quite a long while now...enough to hone my skills as spearman, not just as a tournament fighter but as a true combatant.%SPEECH_OFF%You nod. The lancer continues. %SPEECH_ON%The truth is, were it for coin alone, I daresay my abilities before we crossed paths would have allowed me to live comfortably off of my tournament winnings. One of the real reasons why I joined this outfit was to be able to travel across the lands. The truth is, I have been in search of something for years now.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Seems to me like you\'ve found what you\'ve been looking for.",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Lancer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_82.png[/img][M]As you point out the bundle in %lancer%\'s arms, he lets out a chuckle. %SPEECH_ON%No sir, what I have here is but half of the legend, and perhaps the weaker half as well.%SPEECH_OFF%He unfurls the silk wrappings to uncover a brilliant spear. The tip is golden and twinkles faintly in the relative darkness of the tent the two of you are standing in. The shaft is is a royal purple with manuscript pages wrapped about it. You can\'t tell if it is a trick of the light, but it seems that the text on the manuscripts are constantly changing form, words morphing into new ones before a coherent storyline can be depicted.\n\nYou cannot help but wonder two things: why %lancer% has never shown this treasure nor used it in combat, and what on earth could possibly have diminished the legend of such a weapon.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "What is the meaning of this?",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Lancer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_82.png[/img][M]You voice all of these questions incredulously. %lancer% turns his gaze to the glowing spear tip before speaking, almost as if to address it instead of you. %SPEECH_ON%This legendary item has been passed down my lineage of tournament lancers for longer than our family ancestry has been recorded. It is named the Gae Buidhe. This spear was forged with a powerful charm...it rewrites fate itself with every thrust, such that it strikes true without fail every single time. The manuscripts bound to it write and rewrite the endings of every warrior. It chronicles my fate and yours, and of every other member of this company. Tis either a great shame or a great blessing that such knowledge of ourselves is locked away from us.%SPEECH_OFF%%lancer% turns his gaze from the tip back to you, his eyes filled with steely focus.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Why reveal this weapon now? Why have you not used it in combat before?",
					function getResult( _event )
					{
						return "D";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Lancer.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_82.png[/img][M] %lancer% nods and responds. %SPEECH_ON%Legends tell of a sister spear to the Gae Buidhe...the Gae Dearg. While the Gae Buidhe will never miss, evidently the Gae Dearg has an even stronger curse upon it. I intend to reunite the two sister spears so that they may be drawn back into modern legend.%SPEECH_OFF%The lancer\'s stares at you with a piercing gaze. %SPEECH_ON%As for why I chose now to show it captain...to rely on magic as a substitute for combat proficiency would bring great shame upon my family name. I am the last fighting man of my line, and I have reasons to believe that an opportunity to obtain the Gae Dearg will present itself soon. Use this item as you see fit, sir. You can certainly rely on me, with or without it.%SPEECH_OFF%%lancer% walks out of the tent. Ordinarily you would brush aside such mystical musings, but as you bring the weapon over towards inventory you decide an omen such as this should not be ignored.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We should be on the lookout for a chance to obtain the Gae Dearg.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Lancer.getImagePath());
				local item = this.new("scripts/items/weapons/legendary/gae_buidhe");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.lancer" && bro.getLevel() >= 10)
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Lancer = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 20.0 * candidates.len() * this.m.Lancer.getLevel();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"lancer",
			this.m.Lancer.getName()
		]);
	}

	function onClear()
	{
		this.m.Lancer = null;
	}

});

