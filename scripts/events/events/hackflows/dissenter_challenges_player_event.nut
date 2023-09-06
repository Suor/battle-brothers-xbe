this.dissenter_challenges_player_event <- this.inherit("scripts/events/event", {
	m = {
		Dissenter = null
	},
	function create()
	{
		this.m.ID = "event.hackflows_dissenter_challenges_player";
		this.m.Title = "During Camp...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_26.png[/img][M] While joining the company at a campfire, %dissenter% leaps to his feet and speaks with a reddened face.%SPEECH_ON%I don\'t know how the rest of you sods feel, but I for one think that the leadership of this outfit has been particularly shoddy lately!%SPEECH_OFF%He points an accusing finger at you.%SPEECH_ON%We fight, bleed, and die for our coin, but what about him? He\'s no better than the nobles hiding behind their high towers and castle walls, fattening both his purse and belly alike on our hard work. We should rid ourselves of this leech and divide our rightful cut of the coin among us.\n\nYou take a seat. The men are staring at you, waiting for a response.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "You\'re totally right. I\'ll leave the company right away.",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Time to cut you down to size.",
					function getResult( _event )
					{
						return "C";
					}

				},
				{
					Text = "I\'m in charge here! This is my company!",
					function getResult( _event )
					{
						return "D";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Dissenter.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_26.png[/img][M] You kick your feet out, legs akimbo, and place your hands in your lap. Nodding, you speak to the man.%SPEECH_ON%Alright, %dissenter%. I\'ll do ask you ask. Come morning I\'ll retire and make tracks to the nearest town. In the meantime, I suppose that means that you gotta count inventory every morning and night. Don\'t want these fine men going into battle a few arrows short. Speaking of counting, I suppose my old share will be divided fairly, yes? How will that be decided?%SPEECH_OFF%You throw out your hand in a swooping gesture, so that the campfire casts a shadow which lingers briefly over each of the brothers huddled around it.%SPEECH_ON%You\'ll also need to keep a steady count on your people. They\'re not easily controlled, to which you might find some irony - or not.%SPEECH_OFF% You curl your extended palm into a fist then jam a finger to your temple.%SPEECH_ON%And you\'ll need need someone to think on their feet and bark orders in the heat of battle. Orders that keep men alive to spend their hard earned coin after the battle. Evidently you have a qualified replacement for me, so I will gracefully take my leave come morning.%SPEECH_OFF%As soon as you finish, you see several brothers shaking their heads in disapproval, while others fidget with their gear nervously. Lacking a good retort to these points, %dissenter% backs down and retreats to his tent for the night.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Damn straight.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Dissenter.getImagePath());
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getMoodState() < this.Const.MoodState.Neutral && this.Math.rand(1, 100) <= 33)
					{
						bro.improveMood(1.0, "Gained confidence in your leadership");

						if (bro.getMoodState() >= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_26.png[/img][M] The campfire crackles an orange glow across your face. Nodding, you stand up and walk up to %dissenter%. He takes a step back, but not before you throw a hand out and grab him by the shoulder. You quickly step forward, scissoring a leg back behind his knee, buckling him and throwing him onto his back. You follow him to the ground and there plant one hand around his throat while the other points an accusing finger.%SPEECH_ON%I see some of you have been unhappy with my leadership. But before you get too eager to grab at my share of the coin and challenge my leadership, consider for a moment the reason why you are alive to voice your grievances. %dissenter% is a good man for having the guts to speak up when things have fallen to shite, but to challenge leadership without an idea of what comes after is utter foolishness. I daresay without my guidance as a tactician and quartermaster you lot would be finished within a fortnight!%SPEECH_OFF%Standing up, you actually help %dissenter% to his feet. He sneers at you and takes off, pushing aside a few onlooking brothers as he makes his exit. They look towards his back and cast a few sheepish glances in your direction, but no one comments on what just transpired. You take your seat back at the fire.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Still got it!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(this._event_m.Dissenter.getImagePath());
				this._event_m.Dissenter.worsenMood(3.0, "Felt humiliated in front of the company");
				this.List.push({
					id = 10,
					icon = this.Const.MoodStateIcon[this._event_m.Dissenter.getMoodState()],
					text = this._event_m.Dissenter.getName() + this.Const.MoodStateEvent[this._event_m.Dissenter.getMoodState()]
				});
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_26.png[/img][M] You immediately jump back to your feet and begin shouting.%SPEECH_ON%I\'m the one in charge here! Me! Who has the money? Me! If it weren\'t for me, none of y\'all would even be here! You\'d still be in the pits of whatever old lives you had! You should be groveling before my feet for the opportunities I have provided! And %dissenter%, if you contest me again I swear to the gods I will have you flogged and hanged, understand?%SPEECH_OFF%The outburst instantly quiets the camp. %dissenter% nods and backs away. A few of the men murmur between themselves as you take your seat again.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That went pretty well, no?",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(this._event_m.Dissenter.getImagePath());
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (this.Math.rand(1, 100) <= 33)
					{
						bro.worsenMood(1.0, "Lost confidence in your leadership");

						if (bro.getMoodState() < this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates = [];
		local grumpy = 0;

		foreach( bro in brothers )
		{
			if (bro.getMoodState() < this.Const.MoodState.Neutral)
			{
				grumpy = ++grumpy;
				grumpy = grumpy;

				if (bro.getBackground().getID() == "background.hackflows_dissenter")
				{
					candidates.push(bro);
				}
			}
		}

		if (candidates.len() == 0 || grumpy < 3)
		{
			return;
		}

		this.m.Dissenter = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = candidates.len() * 10 + grumpy * 3;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"dissenter",
			this.m.Dissenter.getName()
		]);
	}

	function onClear()
	{
		this.m.Dissenter = null;
	}

});

