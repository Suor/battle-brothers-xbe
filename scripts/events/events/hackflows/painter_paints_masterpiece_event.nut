this.painter_paints_masterpiece_event <- this.inherit("scripts/events/event", {
	m = {
		Painter = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_painter_paints_masterpiece";
		this.m.Title = "On the Road...";
		this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_126.png[/img][M] You and your men are on the march when %painter% the painter taps you on the shoulder and asks for a moment of your time. %SPEECH_ON%Been a long time since I was a painter, captain. I won\'t lie, I was never drawn to the mercenary life for the sake of great treasure or glory in combat. Honestly didn\'t expect to make it this far without getting my head lopped off in the process.%SPEECH_OFF% He pauses. %SPEECH_ON%I guess I really had something of a deathwish back then. Never been much of the soldiering type, not like my brother was. Broad-shouldered, strong. Always with a smile on his face and a hearty laugh. Popular with the townsfolk, especially the ladies, and filled with a desire to one day see the world. He was meant for such great things, to become a knight, a champion....something. Before he could see the world like he wanted he got trampled in a freak stable accident. It was a miracle that he recovered well enough to walk again, but sure as shite he and I both knew he wasn\'t ever going to know the world beyond our town.%SPEECH_OFF% He trails off, and the two of you walk in silence for a brief period before he speaks again. %SPEECH_ON%I never told you why I wanted to join a mercenary crew, or why I even wanted to become a painter, did I, captain? Truth is, seeing my brother looking so empty, a prisoner in his own body, I had to make it right somehow. He was a great man, kept my ma safe and the family together when our pa died. Put aside his dreams to provide for our family. All these adventures we\'ve had, the battlefields and sceneries I\'ve seen, I\'ve made a point to send back home for him to see. It\'s the least a nobody like me could do for a man meant to be somebody.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Why tell me all this now?",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Painter.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_126.png[/img][M] %painter% the painter sighs. %SPEECH_ON%Just got word from his next of kin that my brother\'s passed on to the next realm. Lucky for him it was peaceful; seems the lucky fucker had a smile on his face at the end. Letter I got says that some of his last words were to thank me, that his life was full, and to wish me to live a life for myself instead of just for him.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Sounds like good advice.",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Painter.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_126.png[/img][M] %painter% nods and continues. %SPEECH_ON%Which brings us to why I\'m sharing all this with you to begin with. I\'ve been with this company for a damn long time now. Gotten into many tight spots, had more adventure than the rest of my family put together by this point. Even though my brother\'s gone, I feel that because of what I\'ve achieved, his spirit continues to live within me. That\'s all thanks to you and the rest of the boys, captain.%SPEECH_OFF% He pulls out a satchel and hands it to you. %SPEECH_ON%Know the role\'s normally reversed, but I\'d been meaning to send my brother a new painting before I heard of his death. Figured since he won\'t be seeing it, I\'d sell the piece and pass a share of the earnings back to the company that made realizing my goals possible. Thought it would be a good time to leave painting behind too, and focus on my new life as a famous mercenary, too!%SPEECH_OFF% The pouch is heavy; part of you thinks that perhaps life would be more lucrative for %painter% if he put down his sword and picked up the brush once again. But one look at his face tells you that perhaps for the first time, he is making decisions for his own sake. Indeed, his battle-hardened expression and proud posture is a jarring juxtaposition to his inexperienced, nervous disposition when you first hired him. You nod respectfully and accept the gift.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I\'m honored you shared this story with me.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Painter.getImagePath());
				this.World.Assets.addMoney(6000);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]6,000[/color] Crowns"
				});
				_event.m.Painter.improveMood(1.0, "Made a hefty sum selling a masterpiece painting");
				_event.m.Painter.improveMood(1.0, "Shared his life story with the captain");

				if (_event.m.Painter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Painter.getMoodState()],
						text = _event.m.Painter.getName() + this.Const.MoodStateEvent[_event.m.Painter.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 11 && bro.getBackground().getID() == "background.hackflows_painter")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Painter = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 40.0 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"painter",
			this.m.Painter.getName()
		]);
	}

	function onClear()
	{
		this.m.Painter = null;
	}

});

