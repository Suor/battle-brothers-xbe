this.paladin_commander_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.hackflows_paladin_commander_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_137.png[/img][M] A cold breeze on the horizon is one of many bad omens. The talk among the town stokes your concerns. War is coming, but it is unclear if it will be one fought between humans or against some other, more sinister threat. Up until this point you have been thoroughly unconcerned with the world at large, instead living contract by contract and spending your spare coin on women or booze. \n\n However, after a night of particularly heavy drinking you awaken to a second consciousness invading your mind, relentlessly commanding you to start a mercenary company, the likes of which the world has never seen. You try to fight it off, but it only speaks of the need for champions to rise up to the challeges humanity will soon face. \n\n You try to drive the damn thing from your mind, but the voice only increases in volume until you finally relent and shout out: %SPEECH_ON%Damn you, I\'ll fucking do it, just begone!%SPEECH_OFF% The voice is as gone as suddenly as it appeared. You find yourself standing in the town square, with several townsfolk looking upon you with wide and fearful eyes. \n\n A gentle golden glow emnates from your scabbard. You draw your sword only to discover it is not your sword...your old one in any case. The voice returns to whisper just one word before it is gone for the second and final time. %SPEECH_ON%Excalibur...%SPEECH_OFF%It seems that some greater power has plans for you, but for the time being only you can decide what to make of yourself.",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I wonder what future awaits me.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "A New Beginning";
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

