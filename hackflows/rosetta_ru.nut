if (!("Rosetta" in getroottable())) return;

local rosetta = {
    version = "0.1.1"
    mod = {id = "mod_backgrounds_and_events", version = 0.8}
    author = "hackflow"
    lang = "ru"
}
local pairs = [
    // FILE: scripts/events/events/hackflows/_add_item3_event.nut
    // en = "A"
    // en = "[img]gfx/ui/events/event_128.png[/img][M] Test Event for adding new items to your stash"
    // en = "Nice."
    // FILE: scripts/events/events/hackflows/_template_event.nut
    // en = "event."
    // FILE: scripts/events/events/hackflows/aging_master_archer_event.nut
    {
        en = "Along the Way..."
        ru = "В пути..."
    }
    {
        en = "[img]gfx/ui/events/event_17.png[/img][M] You find %master_archer% sitting hunched on a tree stump, bow slung over his back. You watch as he squints hard into the distance, clenching and unclenching both outstretched hands with an agonzing slowness. He does not seem to be gazing at a physical target, but rather the concept of a time long past, a prize unrecognized until it became impossible to attain. %master_archer% closes his eyes and sighs, bringing his calloused left hand to his eyelids and gently massaging them. %SPEECH_ON%Don't need to look to tell that someone is watching, captain. That ability, at least, hasn't left me yet.%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_17.png[/img][M] Вы находите %master_archer%, сгорбившегося на пне, с луком за спиной. Он до боли щурится вдаль, мучительно медленно сжимая и разжимая вытянутые руки. Кажется, он смотрит не на настоящую мишень, а на давно ушедшее время — награду, ценность которой понимаешь лишь тогда, когда её уже не получить. %master_archer% прикрывает глаза и вздыхает, поднося мозолистую левую руку к векам и осторожно их растирая. %SPEECH_ON%Мне и смотреть не надо, чтобы понять, что за мной наблюдают, командир. Хоть это умение меня ещё не покинуло.%SPEECH_OFF%"
    }
    {
        en = "How are you doing?"
        ru = "Как ты?"
    }
    // en = "B"
    {
        en = "[img]gfx/ui/events/event_17.png[/img][M] %master_archer% slowly shifts his body to face you. %SPEECH_ON%Man and beast are not so different. We are born into this world, live our short lives, and get ground up into dust in due time.%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_17.png[/img][M] %master_archer% медленно поворачивается к вам. %SPEECH_ON%Человек и зверь не так уж различны. Мы приходим в этот мир, живём свой короткий век и в свой срок стираемся в пыль.%SPEECH_OFF%"
    }
    {
        en = "You didn't answer my question."
        ru = "Ты не ответил на мой вопрос."
    }
    // en = "C"
    {
        en = "[img]gfx/ui/events/event_17.png[/img][M] The man continues. %SPEECH_ON%Ever wondered what animal you would be if you weren't a man, captain?%SPEECH_OFF% %master_archer% doesn't wait for your answer. %SPEECH_ON%Always fancied myself an eagle, when I was younger. Up in the sky, casting my gaze and shadow over everything, able to strike anything with absolute impunity...%SPEECH_OFF% A flicker of a smile crosses his face before the corners of his mouth turn back downwards. %SPEECH_ON%Therein lies the problem. I'm an archer, and I'm getting old. My eyesight is definitely not what it used to be. And a blind archer is like an eagle without wings. Totally useless.%SPEECH_OFF% He sighs. %SPEECH_ON%I'll manage, though. Least I'm not a frontliner. Eyes might be shot, but the guys I CAN see are still right fucked.%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_17.png[/img][M] Он продолжает. %SPEECH_ON%Не думал, командир, каким зверем ты был бы, не родись человеком?%SPEECH_OFF% %master_archer% не ждёт ответа. %SPEECH_ON%В молодости я всегда воображал себя орлом. Высоко в небе, взгляд и тень на всё вокруг, бей кого хочешь — и никакой расплаты...%SPEECH_OFF% По его лицу пробегает тень улыбки, но уголки рта тут же опускаются. %SPEECH_ON%В этом-то и беда. Я лучник, и я старею. Глаза уже совсем не те. А слепой лучник — что орёл без крыльев. Пустое место.%SPEECH_OFF% Он вздыхает. %SPEECH_ON%Но я справлюсь. Хорошо хоть не в первом ряду стою. Глаза сдают, да только тем, кого я ВСЁ ЕЩЁ вижу, легче от этого не станет.%SPEECH_OFF%"
    }
    {
        en = "Time marches on."
        ru = "Время не щадит никого."
    }
    {
        // text = _event.m.Master_Archer.getName() + " has gotten older"
        mode = "pattern"
        en = "<name:str> has gotten older"
        ru = "<name> постарел"
    }
    // FILE: scripts/events/events/hackflows/aging_master_archer_preview_event.nut
    {
        en = "[img]gfx/ui/events/event_128.png[/img][M] You find %master_archer% gazing off into the distance. %SPEECH_ON%Been a long time since I last won my last archery tournament. Hitting marks in front of crowds just lost it's charm long ago. I've long since graduated to putting arrows in heads, and along the way time's gone and snuck up on me. I've grown old. Probably killed more men than struck targets, all, well almost all, from a comfortable distance away.%SPEECH_OFF% You walk up next to him and cross your hands behind your back. He continues. %SPEECH_ON%I robbed these men, captain. Robbed them not just of the rest of their lives, but of a dignified death. I rarely see their faces as they fall, silently, behind their comrades, their last words unheard as they fall forwards into the earth and muck. Someday I'll be caught unawares by a stray projectile too, or worse, get rushed down by some quick little bastard and gutted. No matter how I go it'll be just the same as all these men I've killed...%SPEECH_OFF% His last words trail off into an uneasy silence, and wordlessly, the two of you fall back into formation."
        ru = "[img]gfx/ui/events/event_128.png[/img][M] Вы находите %master_archer%, глядящего куда-то вдаль. %SPEECH_ON%Давненько я не побеждал на лучных состязаниях. Бить по мишеням на потеху толпе разонравилось мне уже давно. С тех пор я перешёл на стрелы в головах, а время тем временем подкралось незаметно. Я состарился. Людей, поди, убил больше, чем мишеней поразил, и всех, ну почти всех, с приятного расстояния.%SPEECH_OFF% Вы становитесь рядом с ним, заложив руки за спину. Он продолжает. %SPEECH_ON%Я обокрал этих людей, командир. Отнял у них не только остаток жизни, но и достойную смерть. Я редко вижу их лица — они падают молча, за спинами товарищей, и последних слов никто не слышит, потому что они утыкаются лицом в землю и грязь. Когда-нибудь и меня достанет шальная стрела, а то и хуже — какой-нибудь юркий ублюдок добежит и вспорет мне брюхо. Как бы я ни ушёл, всё будет так же, как у всех, кого я убил...%SPEECH_OFF% Его слова тонут в неловком молчании, и вы оба молча возвращаетесь в строй."
    }
    {
        en = "I hope he cheers up."
        ru = "Надеюсь, он воспрянет духом."
    }
    {
        en = "Realized he's getting old"
        ru = "Осознал, что стареет"
    }
    // FILE: scripts/events/events/hackflows/arbalester_vs_hunter_event.nut
    {
        en = "[img]gfx/ui/events/event_05.png[/img][M] As the %companyname% marches along you hear two of your men in hot debate. You hear %arbalester% the arbalester say, %SPEECH_ON%I'll say it for the last time, the crossbow is the superior ranged weapon. It actually has the power to punch through heavy armor and do more than tickle a man wearing a proper helmet! Regular bow might be quick to shoot, but it shoots bloody pine needles!%SPEECH_OFF% %hunter% the hunter spits on the ground and retorts, %SPEECH_ON%By the time you get one bolt reloaded, our boys out front will be pincushions! Not like brigands or monsters are wearing full plate anyhow! What's more, a good bowman can shoot at things you can't even see with your spring loaded toy.%SPEECH_OFF% The two notice you listening and ask for your input as the troop commander."
        ru = "[img]gfx/ui/events/event_05.png[/img][M] Пока %companyname% движется вперёд, вы слышите жаркий спор двух своих людей. %arbalester%, арбалетчик, говорит: %SPEECH_ON%Повторяю в последний раз: арбалет лучше любого стрелкового оружия. У него хватает силы пробить тяжёлый доспех и сделать с человеком в добром шлеме что-то посерьёзнее щекотки! Лук, может, и стреляет быстрее, только стреляет он сосновыми иголками!%SPEECH_OFF% %hunter%, охотник, сплёвывает на землю и парирует: %SPEECH_ON%Пока ты перезарядишь один болт, наши парни впереди превратятся в подушки для иголок! Да и не носят разбойники с чудищами полных лат! А хороший лучник достанет то, чего ты со своей заводной игрушкой даже не разглядишь.%SPEECH_OFF% Оба замечают, что вы слушаете, и просят вас рассудить их как командира отряда."
    }
    {
        en = "I value the speed and range of the bow."
        ru = "Я ценю скорость и дальность лука."
    }
    {
        en = "I prefer the power and extra accuracy of the crossbow."
        ru = "Мне милее сила и точность арбалета."
    }
    {
        en = "Actually, I think that the sling is the best ranged option."
        ru = "Вообще-то лучшее стрелковое оружие — праща."
    }
    // en = "D"
    {
        en = "[M] You tell the two men that you prefer the flexibility of the bow. %hunter% grins. %SPEECH_ON%Good to see that our captain, at least, has a good head on his shoulders.%SPEECH_OFF% %arbalester% turns his head away and begins cursing under his breath. You don't hear much of what he's saying, other than the fact that he seems to be calling SOMEONE a needle-dicked, meatheaded, shitsack every few moments he can get."
        ru = "[M] Вы говорите обоим, что цените гибкость лука. %hunter% ухмыляется. %SPEECH_ON%Приятно знать, что хоть у командира голова на плечах есть.%SPEECH_OFF% %arbalester% отворачивается и начинает браниться под нос. Разобрать удаётся немногое — разве что КОГО-ТО он при каждом удобном случае называет тупоголовым мешком с дерьмом и обладателем хера с иголку."
    }
    {
        en = "Can't please them all."
        ru = "Всем не угодишь."
    }
    {
        en = "You didn't take his side in an argument"
        ru = "Вы не приняли его сторону в споре"
    }
    {
        en = "You took his side in an argument"
        ru = "Вы приняли его сторону в споре"
    }
    {
        // text = _event.m.Arbalester.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+2[/color] Resolve"
        mode = "pattern"
        en = "<name:str> gains [color=<c:str>]+2[/color] Resolve"
        ru = "<name> получает [color=<c>]+2[/color] к решимости"
    }
    {
        en = "[M] You tell the two men that the bow just can't hold a candle to the sheer power and bonus accuracy of the crossbow. %arbalester% belts out a smug laugh. %SPEECH_ON%Good to see that our leadership at least understands reason.%SPEECH_OFF% %hunter% shakes his head glumly and goes silent, and the conversation ends."
        ru = "[M] Вы говорите обоим, что луку не тягаться с мощью и точностью арбалета. %arbalester% самодовольно хохочет. %SPEECH_ON%Приятно знать, что начальство хоть что-то смыслит.%SPEECH_OFF% %hunter% мрачно качает головой и умолкает, на том разговор и кончается."
    }
    {
        en = "[M] You scoff and tell the two quarreling mercenaries that the best ranged weapon is actually the stone sling. The two look back at you as if you've suddenly grown a second head. %hunter% slowly says, %SPEECH_ON%Pardon me, cap...I have good ears on account of the years in the forest, but I could have sworn that you just said you prefer the stone sling...%SPEECH_OFF% %arbalester% suddenly laughs a hearty laugh. %SPEECH_ON%I get it, captain, and I agree. Bows are quite good for sniping the squishy, important fuckers, I'll grant them that.%SPEECH_OFF% %hunter% looks back at the arbalester in surprise and his face also breaks into a smile. %SPEECH_ON%Aye, and I agree that my least favorite enemy has probably got to be an ugly shite holding a log shooter.%SPEECH_OFF% The two clap each other on the back and change topics to mead and women."
        ru = "[M] Вы фыркаете и заявляете спорщикам, что лучшее стрелковое оружие — это праща. Оба смотрят на вас так, будто у вас выросла вторая голова. %hunter% медленно произносит: %SPEECH_ON%Простите, командир... уши у меня после стольких лет в лесу отменные, но я готов поклясться, вы только что сказали, что предпочитаете пращу...%SPEECH_OFF% %arbalester% вдруг заливается хохотом. %SPEECH_ON%Понял, командир, и согласен. Луки хороши, чтобы снимать мягких да важных ублюдков, этого не отнять.%SPEECH_OFF% %hunter% удивлённо оборачивается к арбалетчику, и его лицо тоже расплывается в улыбке. %SPEECH_ON%Ага, а я соглашусь, что хуже врага, чем уродец с этой дурой наперевес, и не придумаешь.%SPEECH_OFF% Оба хлопают друг друга по спине и переводят разговор на мёд и баб."
    }
    {
        en = "Looks like my work here is done."
        ru = "Похоже, моё дело здесь сделано."
    }
    {
        en = "Bonded with a fellow ranged brother"
        ru = "Сдружился с товарищем-стрелком"
    }
    // en = "arbalester"
    // en = "hunter"
    // FILE: scripts/events/events/hackflows/atilliator_crafts_masterwork_crossbow_event.nut
    {
        en = "Close to Town..."
        ru = "Неподалёку от города..."
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] %atilliator% the atilliator approaches you with hat in hand. Evidently he's been gathering high quality crossbow components with his own coin in order to build a legendary crossbow, but is lacking the crowns for several crucial pieces.\n\n 5,000 crowns is certainly a very hefty price, but %atilliator% has drawn up a schematic and is confident he can build one. \n\n You get the feeling that if you deny him now he won't have another chance to gather the remaining pieces."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] %atilliator%, оружейник-арбалетчик, подходит к вам, комкая шапку в руках. Оказывается, он на свои деньги собирал отборные части для арбалета, чтобы построить оружие, достойное легенд, но на несколько важнейших деталей крон ему не хватает.\n\n 5000 крон — цена, конечно, немалая, но %atilliator% начертил схему и уверен, что справится. \n\n У вас есть чувство, что откажи вы ему сейчас — другого случая собрать недостающее ему не выпадет."
    }
    {
        en = "Craft a crossbow that can pierce through the thickest armor!"
        ru = "Сделай арбалет, что пробьёт самую толстую броню!"
    }
    {
        en = "We can't spare the coin or materials for this right now."
        ru = "Сейчас у нас нет на это ни денег, ни материалов."
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] The final product does not appear to be all that remarkable. It isn't bigger than a standard heavy crossbow, and though the weapon looks beautiful functionally there seems to be no difference. \n\n That is, until you load a bolt and loose it towards a tree off in the distance. The sound of impact comes much sooner than you anticipated, and upon closer examination the bolt is buried almost fully into the sturdy trunk. You congratulate the atilliator for a job well done."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Готовое изделие на вид ничем особо не примечательно. Оно не больше обычного тяжёлого арбалета, и хотя оружие красиво, толку от этого вроде бы никакого. \n\n Так вам кажется, пока вы не вкладываете болт и не пускаете его в дерево вдалеке. Звук удара приходит куда раньше, чем вы ждали, а вблизи оказывается, что болт почти целиком ушёл в крепкий ствол. Вы хвалите оружейника за отличную работу."
    }
    {
        en = "It's almost as if I'm holding a cannon..."
        ru = "Будто у меня в руках пушка..."
    }
    {
        // text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]5,000[/color] Crowns"
        mode = "pattern"
        en = "You spend [color=<c:str>]5,000[/color] Crowns"
        ru = "Вы потратили [color=<c>]5000[/color] крон"
    }
    {
        // item.m.Name = _event.m.Atilliator.getNameOnly() + "\'s Masterwork Crossbow";
        mode = "pattern"
        en = "<name:str>'s Masterwork Crossbow"
        ru = "Идеальный арбалет от <name>"
    }
    {
        en = "Crafted a weapon of exceptional quality"
        ru = "Создал оружие исключительного качества"
    }
    // en = "atilliator"
    // en = "otherbro1"
    // FILE: scripts/events/events/hackflows/atilliator_upgrades_crossbow_event.nut
    {
        en = "At camp..."
        ru = "На привале..."
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] As you're taking inventory during camp, %atilliator% walks in and hands you a nice looking crossbow. %SPEECH_ON%Had some spare components on me, captain. Figured I would perform some upgrades to one of the crossbows we had. Used to make these for a living, after all.%SPEECH_OFF% Without waiting for an answer, %atilliator% walks away, leaving you to your work."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Пока вы на привале пересчитываете запасы, входит %atilliator% и протягивает вам ладный арбалет. %SPEECH_ON%Завалялись у меня лишние детали, командир. Вот и решил улучшить один из наших арбалетов. Я ведь этим на жизнь зарабатывал.%SPEECH_OFF% Не дожидаясь ответа, %atilliator% уходит, оставляя вас за работой."
    }
    {
        en = "Excellent."
        ru = "Отлично."
    }
    {
        // text = "You lose " + item.getName()
        mode = "pattern"
        en = "You lose <item:str>"
        ru = "Вы теряете <item:t>"
    }
    // FILE: scripts/events/events/hackflows/barkeep_cures_drunkard_event.nut
    {
        en = "On the March..."
        ru = "На марше..."
    }
    {
        en = "[img]gfx/ui/events/event_61.png[/img][M] As your men pause for a brief rest, you overhear %barkeep% the barkeep berating %drunkard%. %SPEECH_ON%For fuck's sake, we are on the move! It isn't as if you'll never see a damn tavern again.%SPEECH_OFF% %drunkard% cringes at the onslaught, bottle in hand. %SPEECH_ON%The horrors we've faced...the brothers we've lost...their faces haunt me. The drink is the only thing that keeps them away.%SPEECH_OFF% %barkeep% yells, %SPEECH_ON%And who among us livin' will be the next to join them? The captain? Me? If I go down because your drunk ass couldn't swing a sword properly I swear by the old gods that even drink won't keep me out your bloody nightmares!%SPEECH_OFF% The words seem to have an effect on %drunkard%. As you prepare to resume marching you see him hand over his bottle to %barkeep%."
        ru = "[img]gfx/ui/events/event_61.png[/img][M] Пока ваши люди переводят дух, вы слышите, как %barkeep%, трактирщик, распекает %drunkard%. %SPEECH_ON%Мать твою, мы в походе! Можно подумать, ты больше в жизни ни одной таверны не увидишь.%SPEECH_OFF% %drunkard% съёживается под напором, не выпуская бутыль из рук. %SPEECH_ON%Всё, что мы повидали... братья, которых мы потеряли... их лица меня преследуют. Только выпивка их и отгоняет.%SPEECH_OFF% %barkeep% рявкает: %SPEECH_ON%А кто из живых пойдёт к ним следующим? Командир? Я? Если я лягу оттого, что ты, пьянь, меча толком не поднял, — клянусь старыми богами, никакая выпивка не выгонит меня из твоих поганых кошмаров!%SPEECH_OFF% Слова, похоже, доходят до %drunkard%. Когда отряд собирается выступать, вы видите, как он отдаёт свою бутыль %barkeep%."
    }
    {
        en = "About time someone cut off the drunken sod."
        ru = "Давно пора было отобрать у пьянчуги бутылку."
    }
    {
        // text = _event.m.Drunkard.getName() + " is no longer a drunkard"
        mode = "pattern"
        en = "<name:str> is no longer a drunkard"
        ru = "<name> больше не пьяница"
    }
    {
        en = "Cut off a drunkard."
        ru = "Отвадил пьянчугу от бутылки."
    }
    {
        en = "Was humiliated in front of the company."
        ru = "Был опозорен перед всем отрядом."
    }
    // en = "barkeep"
    // en = "drunkard"
    // FILE: scripts/events/events/hackflows/barkeep_provides_alcohol_event.nut
    {
        en = "[img]gfx/ui/events/event_24.png[/img][M] As you and your men stop briefly to rest you spy out of the corner of your eye some shadowy figures making their way towards the supply caravan. You shout out, grab your sword, and begin rushing towards the cart when %barkeep% the barkeep pokes his head out and gives you a friendly wave. %SPEECH_ON%What's got you yellin' out like that for, captain?%SPEECH_OFF% You curse and demand to know if he's seen anything, only to be greeted by several strangers stacking some crates near your campsite. %barkeep% beams. %SPEECH_ON%Not to worry, captain. Made a connection with the tavern owner here last time we finished up a contract. Word got out that we frequent the tavern, seemed to be really, really good for business.%SPEECH_OFF% He gestures towards the new crates. %SPEECH_ON%Next few rounds are on them!%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_24.png[/img][M] Пока вы с людьми ненадолго встали на отдых, краем глаза вы замечаете тёмные фигуры, крадущиеся к обозу. Вы кричите, хватаетесь за меч и бросаетесь к телеге — но тут из-за неё высовывается %barkeep%, трактирщик, и приветливо машет рукой. %SPEECH_ON%Чего разорались, командир?%SPEECH_OFF% Вы, ругаясь, требуете сказать, не видел ли он чего, и вместо ответа получаете нескольких незнакомцев, складывающих ящики у вашей стоянки. %barkeep% сияет. %SPEECH_ON%Не тревожьтесь, командир. Свёл я дружбу с хозяином здешней таверны, ещё когда мы прошлый контракт закрыли. Прошёл слушок, что мы туда захаживаем, — и дела у него пошли ох как хорошо.%SPEECH_OFF% Он кивает на ящики. %SPEECH_ON%Так что несколько кружек за их счёт!%SPEECH_OFF%"
    }
    {
        en = "Cheers!"
        ru = "Ваше здоровье!"
    }
    {
        en = "You gain some beer."
        ru = "Вы получаете пиво."
    }
    {
        en = "You gain some preserved mead."
        ru = "Вы получаете выдержанную медовуху."
    }
    {
        en = "You gain some wine."
        ru = "Вы получаете вино."
    }
    {
        en = "Sourced some good drinks."
        ru = "Раздобыл хорошей выпивки."
    }
    // FILE: scripts/events/events/hackflows/barkeep_provides_rounds_event.nut
    {
        en = "Near Town..."
        ru = "Близ города..."
    }
    {
        en = "[img]gfx/ui/events/event_24.png[/img][M] As your company makes its way near town %barkeep% the barkeep approaches you. %SPEECH_ON%Hey captain. Been real good friends with the tavern owner here at %townname% for a few years now. Turns out our company is pretty well known around these parts, and whenever we show up in town business starts booming and the mead starts flowing.%SPEECH_OFF% You ask him why he's bothering to tell you now. He grins. %SPEECH_ON%Business has been so good, he's managed to upgrade his stock to some stuff that actually feels good going down. He wants us to be around when he pulls out the select reserve. Won't take no for an answer. What do ya say? Shall we go?%SPEECH_OFF% You agree and before long, you and your company are having a grand old time telling stories and drinking high quality alcohol."
        ru = "[img]gfx/ui/events/event_24.png[/img][M] Когда отряд проходит близ города, к вам подходит %barkeep%, трактирщик. %SPEECH_ON%Слушайте, командир. Мы с хозяином таверны в %townname% уже который год добрые друзья. Оказывается, наш отряд в здешних краях изрядно известен, и стоит нам объявиться в городе, как торговля у него идёт в гору, а медовуха льётся рекой.%SPEECH_OFF% Вы спрашиваете, к чему он это рассказывает. Он ухмыляется. %SPEECH_ON%Дела у него так пошли, что он разжился питьём, которое и в глотку приятно. Хочет, чтобы мы были рядом, когда он достанет отборное. Отказа не примет. Ну что, идём?%SPEECH_OFF% Вы соглашаетесь, и вскоре весь отряд знатно проводит время за байками и добрым вином."
    }
    {
        en = "Very much appreciated the drinks."
        ru = "Очень оценил угощение."
    }
    {
        en = "Appreciated the round of drinks."
        ru = "Оценил дармовую выпивку."
    }
    // en = "townname"
    // FILE: scripts/events/events/hackflows/blacksmith_crafts_masterwork_armor_event.nut
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] Near the town of %townname%, %blacksmith% the blacksmith approaches you as you are calculating wages for your brothers. He's got a gleam in his eyes and grips his forging hammer tightly as he begins to speak.\n\n He says that he recently had a dream involving knights in the finest armor fiercely doing battle against hordes of undead. Before you can say so much as 'Who gives a bloody shite' he raises his hammer and turns his gaze towards it.\n\n Apparently, he believes that the furnaces in %townname% are the perfect place to craft a piece of the armor he has fixated in his mind's eye. He asks for 6,000 crowns to procure materials and gain access to the smelters.\n\n You narrow your eyes and try to read the man's face. 6,000 crowns could pay the entire company's wages for several weeks. However you see that not only is he serious, he's confident that the final product will be more than worthwhile.\n\n Either way, if you pass up this chance there's no doubt that present circumstances will not come to pass a second time."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Близ города %townname% к вам подходит %blacksmith%, кузнец, — как раз когда вы считаете жалованье братьям. Глаза его горят, а кузнечный молот он сжимает так, будто вот-вот пустит его в дело.\n\n Он говорит, что недавно ему приснились рыцари в дивных доспехах, яростно бьющиеся с ордами мертвецов. Не успеваете вы сказать «да кому какое дело», как он поднимает молот и переводит взгляд на него.\n\n Похоже, он считает, что горны %townname% — самое подходящее место, чтобы выковать тот доспех, что засел у него перед глазами. Он просит 6000 крон на материалы и доступ к плавильням.\n\n Вы щуритесь, пытаясь прочесть по лицу, всерьёз ли он. 6000 крон — это жалованье всего отряда на несколько недель. Но вы видите: он не только не шутит, он уверен, что дело того стоит.\n\n Так или иначе, упусти вы этот случай — второй раз всё так не сойдётся."
    }
    {
        en = "Craft a chestpiece fit for a hero!"
        ru = "Выкуй нагрудник, достойный героя!"
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] %blacksmith% eventually returns with the fruits of his labor wrapped carefully in a fine cloth and places it deferentially on your table. You slowly begin unravelling the bundle to get a closer look at the 6,000 crown investment.\n\n For an instant you believe that the smith decided against crafting the armor after all and is returning your crowns, but as more of the chestpiece is revealed your jaw drops as your realize the splendor of its craftsmanship.\n\n It banishes the darkness of the tent as if emanating light on its own. You congratulate the blacksmith for a job well done. The armor is sure to save a brother's life and bring additional renown to the company!"
        ru = "[img]gfx/ui/events/event_82.png[/img][M] В свой срок %blacksmith% возвращается с плодами своих трудов, бережно завёрнутыми в добротную ткань, и почтительно кладёт свёрток вам на стол. Вы медленно разворачиваете его, чтобы поближе взглянуть на то, во что вложили 6000 крон.\n\n На миг вам кажется, что кузнец передумал ковать доспех и просто возвращает деньги, — но чем больше открывается нагрудник, тем шире у вас отвисает челюсть от увиденного мастерства.\n\n Он разгоняет полумрак шатра, будто светится сам. Вы хвалите кузнеца за отличную работу. Такой доспех наверняка спасёт кому-то из братьев жизнь и добавит отряду славы!"
    }
    {
        en = "What excellent craftsmanship!"
        ru = "Вот это работа!"
    }
    {
        // item.m.Name = _event.m.Blacksmith.getNameOnly() + "\'s Masterwork Chestplate of Heroes";
        mode = "pattern"
        en = "<name:str>'s Masterwork Chestplate of Heroes"
        ru = "Кираса героев от <name>"
    }
    {
        en = "A gleaming chestpiece that shimmers brilliantly when worn. The ability to craft armor of this quality was thought to be a lost art, but clearly it is not. It is much lighter than it appears, but provides incredible protection. Truly the work of a master smith!"
        ru = "Сияющий нагрудник, что на владельце переливается ослепительным блеском. Считалось, что искусство ковать доспехи такого качества давно утрачено, — но, как видно, это не так. Он куда легче, чем кажется, и защищает просто невероятно. Поистине работа мастера!"
    }
    {
        en = "Created armor worthy of heroes"
        ru = "Создал доспех, достойный героев"
    }
    // en = "blacksmith"
    // FILE: scripts/events/events/hackflows/blacksmith_crafts_masterwork_weapon_event.nut
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] Near the town of %townname%, %blacksmith% the blacksmith approaches you while you are managing the company's inventory. He's twiddling his calloused fingers with a nervous energy uncharacteristic of a man of his age and build.\n\n You turn your gaze towards him and wait for several seconds, expecting bad news, until he suddenly blurts out that he's been overcome by inspiration he hasn't felt in years.\n\n He says that given a stack of 6,000 crowns and access to %townname%'s furnaces for the day he can smith a greatsword of legends. \n\n One look at his face tells you that this man means business; that being said, 6,000 crowns is a small fortune that could supply the company with food, tools, and medical supplies for several weeks. \n\n However, something tells you that if you pass up this chance %blacksmith% will never be stricken by this level of weaponsmithing inspiration again."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Близ города %townname% к вам подходит %blacksmith%, кузнец, — вы как раз разбираете припасы отряда. Он нервно перебирает мозолистыми пальцами, что вовсе не вяжется ни с его годами, ни с его сложением.\n\n Вы поднимаете на него взгляд и пару мгновений ждёте дурных вестей, но он вдруг выпаливает, что на него нашло вдохновение, какого он не знал уже много лет.\n\n Говорит: дайте ему 6000 крон и горны %townname% на день — и он выкует двуручный меч, достойный легенд. \n\n Одного взгляда на его лицо хватает, чтобы понять: он не шутит. Правда, 6000 крон — целое состояние, на которое отряд несколько недель мог бы жить, чинить снаряжение и лечиться. \n\n И всё же что-то подсказывает: упустите этот случай — и такое вдохновение к %blacksmith% больше не придёт."
    }
    {
        en = "Craft a zweihander that puts noble knights to shame!"
        ru = "Выкуй цвайхандер, чтоб знатным рыцарям стало стыдно!"
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] %blacksmith% eventually returns with the product of his hard work. The greatsword has a regal appearance, and you feel slightly intimidated just by looking at it.\n\n %blacksmith% proffers the blade to you almost as a squire would to a knight. Taken aback by his refined behavior, you accept the weapon rather clumsily.\n\n The greatsword is much lighter than you expected. You give it a few test swings, and though you are far from a master swordsman the swings are both swift and precise.\n\n From a distance, %otherbro1% whistles approvingly, and beside him %otherbro2% stands awestruck. Soon, the whole company is clamoring forward to admire the masterpiece.\n\n %blacksmith%'s dignified expression quickly gives way to a wide grin as brother after brother claps him on the back amidst the boisterous cheering."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] В свой срок %blacksmith% возвращается с плодом своих трудов. Двуручник выглядит по-царски, и от одного взгляда на него становится слегка не по себе.\n\n %blacksmith% подаёт вам клинок едва ли не так, как оруженосец подаёт меч рыцарю. Опешив от такой учтивости, вы принимаете оружие довольно неуклюже.\n\n Двуручник куда легче, чем вы ожидали. Вы делаете несколько пробных взмахов — и хоть до мастера меча вам далеко, взмахи выходят быстрыми и точными.\n\n Поодаль одобрительно присвистывает %otherbro1%, а рядом с ним застыл в изумлении %otherbro2%. Вскоре весь отряд сбегается поглазеть на это чудо.\n\n Важный вид %blacksmith% быстро сменяется широченной ухмылкой, пока брат за братом хлопает его по спине под общий гвалт."
    }
    {
        en = "Craftsmanship like this makes me wonder why you left smithing behind..."
        ru = "С такими руками — и почему ты вообще бросил кузню?.."
    }
    {
        // item.m.Name = _event.m.Blacksmith.getNameOnly() + "\'s Masterwork Zweihander";
        mode = "pattern"
        en = "<name:str>'s Masterwork Zweihander"
        ru = "Идеальный цвайхандер от <name>"
    }
    // FILE: scripts/events/events/hackflows/blacksmith_repairs_armor_event.nut
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] While taking inventory you notice several pieces of armor are missing. Incensed at the prospect of a robber in your midst, you scour the campsite for clues about the perpetrator. You follow a heavy set of footprints to %blacksmith%, who is happily repairing the armor. He notices your approach and cracks a wide smile.%SPEECH_ON% Ho there, captain. Sorry for not letting you know sooner, but I figured I'd keep my smithing skills sharp. Very useful skillset to have in these troubled times. Surely you agree, sir?%SPEECH_OFF%You nod approvingly, telling him to let you know next time he is in the mood to make some repairs."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Пересчитывая имущество, вы замечаете, что нескольких доспехов не хватает. Разъярённый мыслью о воре в собственном лагере, вы обшариваете стоянку в поисках следов. Тяжёлые отпечатки сапог приводят вас к %blacksmith%, который преспокойно чинит эти самые доспехи. Заметив вас, он широко улыбается.%SPEECH_ON% О, здравствуйте, командир. Простите, что не предупредил, — просто решил не давать рукам заржаветь. В смутные времена ремесло больно полезное. Согласны ведь?%SPEECH_OFF%Вы одобрительно киваете и просите в следующий раз всё же предупреждать, когда ему захочется что-нибудь починить."
    }
    {
        // text = "Your " + item.getName() + " is repaired"
        mode = "pattern"
        en = "Your <item:str> is repaired"
        ru = "Починено: <item:t>"
    }
    // FILE: scripts/events/events/hackflows/blacksmith_repairs_weapons_event.nut
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] While doing a quick patrol around camp you encounter %blacksmith% industriously repairing damaged weaponry. To his right is a small pile of weapons at various stages of disrepair; to his left are a few pieces that look almost brand new.%SPEECH_ON%Oh, hello sir. Sorry for not mentioning I was borrowing these from our armory. Smith's gotta keep his hands active, you see.%SPEECH_OFF% You wave off his apology and ask where he sourced the tools for his efforts.%SPEECH_ON%Oh, y'know. The same way every smithy gets 'em.%SPEECH_OFF% You most certainly don't know, but it seems that %blacksmith% is happy and free repairs are certainly a big boon for your company. The blacksmith begins whistling cheerfully as you walk away."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Обходя лагерь, вы натыкаетесь на %blacksmith%, увлечённо чинящего побитое оружие. Справа от него горка клинков разной степени убитости, слева — несколько штук, выглядящих почти как новые.%SPEECH_ON%О, здравствуйте. Простите, что не сказал, что беру их из нашей оружейной. Кузнецу без работы руки некуда девать, сами понимаете.%SPEECH_OFF% Вы отмахиваетесь от извинений и спрашиваете, где он раздобыл инструмент.%SPEECH_ON%Да как обычно. Как все кузнецы их достают.%SPEECH_OFF% Вам это ровным счётом ничего не объясняет, но %blacksmith% доволен, а даровой ремонт отряду только на пользу. Кузнец бодро насвистывает вам вслед."
    }
    // FILE: scripts/events/events/hackflows/bounty_hunter_joins_company_event.nut
    {
        en = "[img]gfx/ui/events/event_80.png[/img][M] You and the company are on the march when you are approached by a grizzled, tough looking man wielding a nasty looking weapon. Your men tense and you immediately begin surveying the area for a potential ambush when the man introduces himself as a bounty hunter. \n\n Evidently, the renown of the %companyname% has increased to the point that the man wants to lend his services as a mercenary. Very uncharacteristically, he is even willing to waive his normal recruitment fee if it means that the company will give him a chance. The man certainly looks like he can handle himself in battle..."
        ru = "[img]gfx/ui/events/event_80.png[/img][M] Отряд идёт своей дорогой, когда навстречу выходит седой, крепкий мужик с оружием весьма мерзкого вида. Ваши люди напрягаются, вы тут же оглядываете округу в поисках засады — но человек представляется охотником за головами. \n\n Похоже, слава %companyname% выросла настолько, что он хочет пойти к вам наёмником. Что уж совсем на него не похоже, он даже готов отказаться от обычной платы за наём, лишь бы отряд дал ему случай себя показать. А в бою он, судя по всему, за себя постоять умеет..."
    }
    {
        en = "Welcome to the company!"
        ru = "Добро пожаловать в отряд!"
    }
    {
        en = "We are not looking for fresh recruits at this time."
        ru = "Сейчас нам новобранцы не нужны."
    }
    // FILE: scripts/events/events/hackflows/carpenter_aids_construction_effort_event.nut
    {
        en = "In Town..."
        ru = "В городе..."
    }
    {
        en = "[img]gfx/ui/events/event_77.png[/img][M] While near the town of %townname%, your mercenary troop is approached by what appears to be a village elder and some desperate looking peasants. They look harmless enough, so you and your men leave your weapons sheathed and hear them out. The elder is the first to speak. %SPEECH_ON%Good day to you gents. I see that you are a crew of tough men with worldy knowledge about yourselves.%SPEECH_OFF% You tell the man to get to the point. %SPEECH_ON%Situation's like this, sir. One of our storehouse rooves collapsed just this morn. We've no shortage of strong men or timber, but we lack a man with the ability to cut the wood into planks. Perhaps...?%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_77.png[/img][M] Близ города %townname% к вашему отряду подходят, судя по виду, деревенский староста и несколько крестьян с отчаянными лицами. Выглядят они безобидно, так что вы с людьми оставляете оружие в ножнах и выслушиваете их. Первым говорит староста: %SPEECH_ON%Доброго дня, господа. Вижу, вы люди бывалые и в мире кое-что смыслите.%SPEECH_OFF% Вы просите его перейти к делу. %SPEECH_ON%Дело такое, сударь. Нынче утром у нас крыша амбара рухнула. Ни в крепких руках, ни в брёвнах нужды нет, а вот человека, что распустит их на доски, у нас нету. Может, вы...?%SPEECH_OFF%"
    }
    {
        en = "%carpenter%, sounds like you're perfect for the job."
        ru = "%carpenter%, похоже, это работёнка как раз для тебя."
    }
    {
        en = "This isn't our problem."
        ru = "Это не наша забота."
    }
    {
        en = "[img]gfx/ui/events/event_77.png[/img][M] You nod towards %carpenter% the carpenter. %SPEECH_ON%Right, captain, suppose if you can spare me I can help the poor sods out.%SPEECH_OFF% The villagers perk up and lead %carpenter% off in the direction of the ruined storehouse. \n\n After several hours, %carpenter% returns, looking none the worse for the wear and holding a small pouch of crowns. %SPEECH_ON%Couple of younger lads picked up the knowledge damn quick, barely had to lift a finger myself other than to show 'em how to cut the wood. Paid me well, too. Drinks on me tonight!%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_77.png[/img][M] Вы киваете на %carpenter%, плотника. %SPEECH_ON%Ну что ж, командир, коли я вам сейчас без надобности, помогу бедолагам.%SPEECH_OFF% Селяне оживают и уводят %carpenter% к развалившемуся амбару. \n\n Через несколько часов %carpenter% возвращается — бодрый, с небольшим кошелём крон в руке. %SPEECH_ON%Пара парней помоложе всё схватили на лету, мне и делать почти ничего не пришлось, только показал, как дерево пилить. Да ещё и заплатили славно. Нынче выпивка за мой счёт!%SPEECH_OFF%"
    }
    {
        // text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]100[/color] Crowns"
        mode = "pattern"
        en = "You gain [color=<c:str>]100[/color] Crowns"
        ru = "Вы получаете [color=<c>]100[/color] крон"
    }
    {
        en = "Used his past expertise to make some easy money"
        ru = "Заработал лёгких денег старым ремеслом"
    }
    // en = "carpenter"
    // FILE: scripts/events/events/hackflows/carpenter_lumberjack_quality_wood_event.nut
    {
        en = "Near the Forests..."
        ru = "У леса..."
    }
    {
        en = "[img]gfx/ui/events/event_25.png[/img][M] As your company rests near the treeline, %lumberjack% the lumberjack saunters casually into the forest. Before you can so much as call out to him, you can hear sounds of whistling and chopping. \n \n After a time, he emerges with a bundle of logs. \n \n %carpenter% perks up and speaks. %SPEECH_ON%Those are some good bowmaking logs there. I know we need some wood for the campfire later on, but what say I cut those up nicely and we sell 'em at the next town?%SPEECH_OFF% %lumberjack% drops the logs and brings his woodcutter's axe over his shoulder. %SPEECH_ON%Don't mind going another round. First set barely got me warmed up anyhow.%SPEECH_OFF% %lumberjack% ambles back into the woods and your carpenter gets to work. Before long, a few units of high quality wood are added to your stockpile."
        ru = "[img]gfx/ui/events/event_25.png[/img][M] Пока отряд отдыхает у кромки леса, %lumberjack%, лесоруб, неспешно уходит между деревьев. Вы даже окликнуть его не успеваете, как оттуда доносятся посвист и стук топора. \n \n Через некоторое время он выходит с вязанкой брёвен. \n \n %carpenter% оживляется. %SPEECH_ON%А ведь из этого выйдут добрые заготовки для луков. Дрова для костра нам, конечно, нужны, но что, если я их толком распущу, а мы продадим в следующем городе?%SPEECH_OFF% %lumberjack% сбрасывает брёвна и закидывает топор на плечо. %SPEECH_ON%Отчего ж не сходить ещё разок. Я на первой ходке толком и не размялся.%SPEECH_OFF% %lumberjack% уходит обратно в лес, а плотник берётся за дело. Вскоре к вашим запасам добавляется несколько мер первосортного дерева."
    }
    {
        en = "Excellent!"
        ru = "Превосходно!"
    }
    // en = "lumberjack"
    // FILE: scripts/events/events/hackflows/carpenter_upgrades_cart_event.nut
    {
        en = "On the road..."
        ru = "На дороге..."
    }
    {
        en = "[img]gfx/ui/events/event_128.png[/img][M] While on the march, you notice %carpenter% the carpenter duck back behind the supply wagon. When he fails to fall back into line after more than a few moments, you decide to go check on him. \n\n You find him busy at work slotting well cut boards of wood together and nailing them into place. Though the cart seemed quite packed to begin with, by the time %carpenter% is done working somehow some extra space seems to have opened up. You thank the carpenter for a job well done."
        ru = "[img]gfx/ui/events/event_128.png[/img][M] На марше вы замечаете, как %carpenter%, плотник, ныряет за обозную телегу. Когда он и через несколько минут не возвращается в строй, вы идёте посмотреть, в чём дело. \n\n Он вовсю трудится: подгоняет ладно вытесанные доски одну к другой и приколачивает их на место. Телега и раньше казалась забитой под завязку, но к тому времени, как %carpenter% заканчивает, в ней откуда-то берётся лишнее место. Вы благодарите плотника за добрую работу."
    }
    {
        en = "Always good to have a handyman around."
        ru = "Хорошо, когда под рукой есть мастеровой."
    }
    {
        en = "You gain inventory space"
        ru = "Вы получаете место в обозе"
    }
    {
        en = "Improved the company's cart"
        ru = "Улучшил телегу отряда"
    }
    // FILE: scripts/events/events/hackflows/cartographer_discovers_location_event.nut
    {
        en = "At Camp..."
        ru = "В лагере..."
    }
    {
        en = "[img]gfx/ui/events/event_45.png[/img][M] As you are making your nightly rounds checking up on the status of your men, you pass by %cartographer%'s tent and discover the man deep in thought, a stick in hand and with several scrolls sprawled out on a small bench before him. He looks up at you and nods. %SPEECH_ON%Ho, captain. Been examining some of the maps I created during our travels. Got my hands on some new ones during our travels too. I think I've triangulated the location of something interesting...%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_45.png[/img][M] Совершая вечерний обход, вы проходите мимо палатки %cartographer% и застаёте его в глубоких раздумьях: в руке прутик, перед ним на низкой скамье разложено несколько свитков. Он поднимает на вас взгляд и кивает. %SPEECH_ON%А, командир. Изучаю карты, что начертил в наших странствиях. Да и новых по дороге раздобыл. Кажется, я вычислил, где лежит кое-что любопытное...%SPEECH_OFF%"
    }
    {
        en = "What info do you have?"
        ru = "И что же ты выяснил?"
    }
    {
        en = "[img]gfx/ui/events/event_45.png[/img][M] The cartographer furrows his brow in concentration before tapping his stick onto a few different pieces of parchment at particular places. %SPEECH_ON%Judging by the pattern of attacks from brigands and barbarians, and the landmarks that the survivors of such attacks described, there likely is a camp they've made their base at around here...%SPEECH_OFF%The two of you converse more and you take careful notes about the cartographer's discovery."
        ru = "[img]gfx/ui/events/event_45.png[/img][M] Картограф сосредоточенно хмурится и постукивает прутиком по нескольким пергаментам в определённых местах. %SPEECH_ON%Судя по тому, где нападают разбойники и варвары, и по приметам, что называли уцелевшие, где-то здесь у них лагерь...%SPEECH_OFF%Вы беседуете ещё некоторое время и тщательно записываете всё, что открыл картограф."
    }
    {
        en = "Good to know where the knaves have their home base."
        ru = "Полезно знать, где логово этих мерзавцев."
    }
    {
        en = "Your cartographer uncovered the location of a camp"
        ru = "Ваш картограф установил, где находится лагерь"
    }
    {
        en = "Your cartographer discovered a camp, but you already knew of its existence"
        ru = "Ваш картограф нашёл лагерь, но вы и так о нём знали"
    }
    {
        en = "[img]gfx/ui/events/event_45.png[/img][M] The cartographer furrows his brow in concentration before tapping his stick onto a few different pieces of parchment at particular places. %SPEECH_ON%I used several incomplete local maps and compared the position of major landmarks to the world map I've been drawing up as we travel. By my guess, there should be a tomb or other such undead location around this area...%SPEECH_OFF%The two of you converse more and you take careful notes about the cartographer's discovery."
        ru = "[img]gfx/ui/events/event_45.png[/img][M] Картограф сосредоточенно хмурится и постукивает прутиком по нескольким пергаментам в определённых местах. %SPEECH_ON%Я взял несколько неполных местных карт и сверил приметные места с той картой мира, что черчу в пути. По моим прикидкам, где-то здесь должна быть гробница или другое место, где водятся мертвецы...%SPEECH_OFF%Вы беседуете ещё некоторое время и тщательно записываете всё, что открыл картограф."
    }
    {
        en = "Good that we know of a source of the undead scourge."
        ru = "Хорошо знать, откуда лезет эта мертвечина."
    }
    {
        en = "[img]gfx/ui/events/event_45.png[/img][M] The cartographer furrows his brow in concentration before tapping his stick onto a few different pieces of parchment at particular places. %SPEECH_ON%Looks like several different sources confirm that this area is a hub of greenskin activity. There is almost certainly a camp of the bastards somewhere in this area...%SPEECH_OFF%The two of you converse more and you take careful notes about the cartographer's discovery."
        ru = "[img]gfx/ui/events/event_45.png[/img][M] Картограф сосредоточенно хмурится и постукивает прутиком по нескольким пергаментам в определённых местах. %SPEECH_ON%Похоже, сразу несколько источников сходятся: в этих краях вовсю хозяйничают зеленокожие. Где-то здесь у этих тварей почти наверняка есть лагерь...%SPEECH_OFF%Вы беседуете ещё некоторое время и тщательно записываете всё, что открыл картограф."
    }
    {
        en = "Good to be aware of the greenskin threat in that area."
        ru = "Полезно знать, что в тех краях завелись зеленокожие."
    }
    // en = "cartographer"
    // FILE: scripts/events/events/hackflows/cobbler_creates_boots_event.nut
    {
        en = "[img]gfx/ui/events/event_134.png[/img][M] %cobbler% the shoemaker approaches you. %SPEECH_ON%Say, captain. I've been with the company for a good amount of time now, gotten used to fighting, defensive footwork and all that. Managed to spare some time to craft a few pairs of combat boots. Nice and lightweight, sturdy enough for marching in the cold. They cost more than what I used to make in half a year but thanks to this company I've been able to sell a few pairs on the side. Figured as thanks some of our boys deserved some better gear.%SPEECH_OFF% He drops of a few pair of boots of surprising quality. %SPEECH_ON%More where that came from, sir.%SPEECH_OFF% You shake your head as he walks away. Had a lifetime of poverty hidden away this shoemaker's talents?"
        ru = "[img]gfx/ui/events/event_134.png[/img][M] К вам подходит %cobbler%, башмачник. %SPEECH_ON%Слушайте, командир. Я в отряде уже порядком, пообвыкся и к драке, и к тому, как ноги в бою ставить. Выкроил время и стачал пару-тройку боевых сапог. Лёгкие, а на холодный марш крепости хватит. Стоят они дороже, чем я раньше за полгода зарабатывал, но благодаря отряду я и на сторону несколько пар продал. Вот и решил: наши парни заслужили снаряжение получше.%SPEECH_OFF% Он оставляет несколько пар сапог на удивление доброй работы. %SPEECH_ON%Будет ещё, сударь.%SPEECH_OFF% Вы качаете головой ему вслед. Неужто нищета всю жизнь прятала такой талант?"
    }
    {
        en = "Damn, these are comfy."
        ru = "Чёрт, а в них удобно."
    }
    {
        en = "Put his shoemaking skills to good use."
        ru = "Приложил своё ремесло к делу."
    }
    {
        // text = _event.m.OtherBro1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+5[/color] Melee Defense"
        mode = "pattern"
        en = "<name:str> gains [color=<c:str>]+5[/color] Melee Defense"
        ru = "<name> получает [color=<c>]+5[/color] к защите в ближнем бою"
    }
    // en = "cobbler"
    // FILE: scripts/events/events/hackflows/cobbler_cures_clubfooted_event.nut
    {
        en = "[img]gfx/ui/events/event_61.png[/img][M] Once again, while on the move, it seems that %clubfootedBro% is lagging behind on account of his deformed feet. Your men have jeered and ridiculed each other for much worse, so you can't help but wonder why %clubfootedBro% is being spared. \n\n However, one look at %clubfootedBro% says it all; he wears a grim, stoic expression, valiantly struggling forward step by step so as to not hold back his comrades. Your other men glance at you, and you are tempted to give the order to make camp, but before you are able to say a word %cobbler% the cobbler falls back and presents the straggler with a pair of unremarkable looking boots. %SPEECH_ON%This pair's specially made. Me pa taught me how long ago. Boots should even out your gait and save you some pain.%SPEECH_OFF% %clubfootedBro%'s expression softens as he accepts the boots and puts them on. His face cracks open into a wide grin as he takes his first few steps. %SPEECH_ON%%cobbler%, I dunno what to say, I...%SPEECH_OFF% %cobber% cuts him off. %SPEECH_ON%Speed up and we call it even. I'm sure you'll save my arse one day.%SPEECH_OFF% Your company gets moving before, both faster and happier than before."
        ru = "[img]gfx/ui/events/event_61.png[/img][M] В походе %clubfootedBro% снова отстаёт из-за своих кривых ног. Ваши люди высмеивают друг друга и за куда меньшее, так что вы невольно думаете: почему же %clubfootedBro% никто не трогает? \n\n Но один взгляд на %clubfootedBro% всё объясняет: лицо мрачное и упрямое, он шаг за шагом упорно тащится вперёд, лишь бы не задерживать товарищей. Остальные поглядывают на вас, и вы уже готовы скомандовать привал, но не успеваете и слова сказать, как %cobbler%, башмачник, отстаёт от строя и протягивает бедолаге пару ничем не примечательных сапог. %SPEECH_ON%Эти особые. Меня отец давным-давно научил. Выправят походку и боли поубавят.%SPEECH_OFF% Лицо %clubfootedBro% смягчается; он берёт сапоги и обувается. Сделав первые несколько шагов, он расплывается в широченной улыбке. %SPEECH_ON%%cobbler%, я даже не знаю, что сказать, я...%SPEECH_OFF% %cobber% его перебивает. %SPEECH_ON%Не отставай — и в расчёте. Уверен, однажды ты мою задницу вытащишь.%SPEECH_OFF% Отряд трогается дальше — быстрее и веселее прежнего."
    }
    {
        en = "We're lucky to have a cobbler with us."
        ru = "Нам повезло, что с нами башмачник."
    }
    {
        // text = _event.m.ClubfootedBro.getName() + " is no longer clubfooted"
        mode = "pattern"
        en = "<name:str> is no longer clubfooted"
        ru = "<name> больше не косолапый"
    }
    {
        en = "Fashioned some boots that helped a fellow brother."
        ru = "Стачал сапоги, что выручили брата по оружию."
    }
    {
        en = "Received special footwear that helps him walk comfortably."
        ru = "Получил особую обувь, в которой ходить куда легче."
    }
    // FILE: scripts/events/events/hackflows/con_artist_scams_townsfolk_event.nut
    // en = "conartist"
    // FILE: scripts/events/events/hackflows/cook_cures_fat_event.nut
    {
        en = "[img]gfx/ui/events/event_61.png[/img][M] It seems that having %cook% around has been having a positive effect on the more...portly members of the company. %fatBro% seems to have slimmed down significantly due to the quality of the meals that %cook% has been meticulously preparing. %cook% beams with pride. %SPEECH_ON%A well balanced meal; a well fed company. These things can win you battles before they even happen, captain!%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_61.png[/img][M] Похоже, присутствие %cook% благотворно сказалось на самых... дородных бойцах отряда. %fatBro% заметно сбавил в весе — сказались стряпня и старания %cook%. %cook% сияет от гордости. %SPEECH_ON%Добрая еда — сытый отряд. Такие вещи выигрывают битвы ещё до того, как они начались, командир!%SPEECH_OFF%"
    }
    {
        en = "We're lucky to have an cook with us."
        ru = "Нам повезло, что с нами повар."
    }
    {
        // text = _event.m.FatBro.getName() + " is no longer fat"
        mode = "pattern"
        en = "<name:str> is no longer fat"
        ru = "<name> больше не толстяк"
    }
    {
        en = "Prepared meals that improved the health of a fellow brother."
        ru = "Готовил так, что брат по оружию поздоровел."
    }
    {
        en = "Slimmed down from eating healthy meals."
        ru = "Сбросил вес на здоровой пище."
    }
    // en = "cook"
    // FILE: scripts/events/events/hackflows/cook_prepares_delicious_meals_event.nut
    {
        en = "[img]gfx/ui/events/event_61.png[/img][M] The morale of the men has recently seemed to be at an all time high. You muse to yourself that you could attribute this to a variety of reasons; perhaps recent victories on the battlefield, wages coming in consistently, or even the concept of glory as the company increases in renown.\n\n Of course, you'd be lying to yourself if the true reason wasn't abundantly obvious and simple: the food.\n\n Now that %cook% the cook has been integrated with %companyname% for some time, it seems that he has taken a particular interest in applying the skills of his previous profession to benefit his comrades. To say the man is able to work magic would be an understatement among the mercenaries. Even on days where provisions are short or particularly bland, %cook% manages to keep the daily fare somewhat interesting with methods and spices beyond the understanding of the culinary plebian.\n\n His efforts have not gone unnoticed, and more and more often other members of the %companyname% have offered to cover %cook%'s guard duty shift in appreciation.\n\n After all, an army marches on its stomach!"
        ru = "[img]gfx/ui/events/event_61.png[/img][M] В последнее время боевой дух в отряде как никогда высок. Вы прикидываете про себя, чем бы это объяснить: может, недавними победами, может, тем, что жалованье платится исправно, а может, и славой, что растёт вместе с известностью отряда.\n\n Но врать себе не стоит: настоящая причина проста и очевидна — еда.\n\n С тех пор как %cook%, повар, обжился в %companyname%, он взялся всерьёз применять умения прежнего ремесла на пользу товарищам. Сказать, что человек творит чудеса, для наёмников было бы преуменьшением. Даже в дни, когда припасов мало или они особенно постны, %cook% ухитряется сделать похлёбку небезынтересной приёмами и приправами, недоступными пониманию кухонного простолюдина.\n\n Труды его заметили: всё чаще бойцы %companyname% в благодарность вызываются отстоять за %cook% его смену в карауле.\n\n В конце концов, войско идёт на брюхе!"
    }
    {
        en = "It really is amazing what effect a good cook can have on morale."
        ru = "Поразительно, что хороший повар делает с боевым духом."
    }
    {
        en = "Very much appreciated the meals prepped by the cook"
        ru = "Очень оценил стряпню повара"
    }
    {
        en = "Appreciated the meals prepped by the cook"
        ru = "Оценил стряпню повара"
    }
    // FILE: scripts/events/events/hackflows/cook_vs_ratcatcher_event.nut
    {
        en = "[img]gfx/ui/events/event_52.png[/img][M] As the company stops for a brief rest, you hear a commotion near the supply caravan. You stride over to investigate and discover %ratcatcher% the ratcatcher arguing heatedly with %cook% the cook. %SPEECH_ON%Look, my lil fella always stays in my breast pocket anyhow. I feed 'im with morsels from my share of the provisions, and he never wanders far. None o' the other lads have complained, what's the deal throwin' such a hissy fit?%SPEECH_OFF% As you look on from out of sight, you see that %ratcatcher% has a pet rat nestled into his coat pocket, evidenced only by a tail hanging out the top and a gentle quivering of the lump in the cloth. %cook% seems to be beside himself at the concept of a pet rat. %SPEECH_ON%Keeping these squealy shits within spitting distance of the provisions. Are you mad? Where rats go, disease and pestilence are sure to follow! We paid folk like you to rid us of them, not to make friends with the fuzzy, diseased bastards!%SPEECH_OFF% %ratcatcher% raises his voice as well and retorts, %SPEECH_ON%I keep 'im cleaner than you are, ya fat fuck! Even if he did sneak into the supplies the damage would be peanuts compared to the havoc your greasy paws have wreaked on our larders!%SPEECH_OFF% You look around and it seems the rest of the men have remained uninterested in this squabble. You decide it best not to play the nanny this time around and move off to relieve yourself."
        ru = "[img]gfx/ui/events/event_52.png[/img][M] Отряд встаёт на короткий привал, и от обоза доносится шум. Вы идёте разобраться и застаёте %ratcatcher%, крысолова, в жарком споре с %cook%, поваром. %SPEECH_ON%Слушай, малыш и так всё время у меня за пазухой. Кормлю его крохами со своей доли, далеко он не бегает. Никто из парней не жаловался, чего ты раскудахтался?%SPEECH_OFF% Наблюдая со стороны, вы видите у %ratcatcher% ручную крысу в кармане куртки — её выдают лишь хвост, свисающий наружу, и лёгкое шевеление под тканью. %cook% при виде ручной крысы вне себя. %SPEECH_ON%Держать эту пищащую дрянь в двух шагах от провизии! Ты рехнулся? Где крысы — там хвори и мор! Мы таким, как ты, платим, чтоб вы их изводили, а не дружбу с этими блохастыми ублюдками водили!%SPEECH_OFF% %ratcatcher% тоже повышает голос: %SPEECH_ON%Да он чище тебя, жирная ты морда! Даже залезь он в припасы, вреда от него было бы меньше, чем от твоих сальных лап в наших кладовых!%SPEECH_OFF% Вы оглядываетесь: остальным до этой свары нет никакого дела. Вы решаете на сей раз не изображать няньку и отходите по нужде."
    }
    {
        en = "Best to let the two sort this out themselves."
        ru = "Пусть сами разбираются."
    }
    {
        en = "Got into an argument over food sanitation practices"
        ru = "Повздорил из-за чистоты на кухне"
    }
    // en = "ratcatcher"
    // FILE: scripts/events/events/hackflows/cultist_requests_nose_removal_event.nut
    {
        en = "During a Quiet Moment..."
        ru = "В минуту затишья..."
    }
    {
        // Text = "[img]gfx/ui/events/event_03.png[/img][M] While on the march, you are approached by %surgeon% the surgeon and %cultist% the cultist. You raise an eyebrow and wait for one of them to speak. The cultist only stares at you with a vacant expression. Noticing this, %surgeon% opens his mouth to speak.%SPEECH_ON%It\'s damn uncanny captain. Not but a few moments ago this damned lunatic wouldn\'t shut up about \'Dave Cool\' or some shit. Madman says he needs his nose sliced off.%SPEECH_OFF%%surgeon% shakes his head at you incredulously.%SPEECH_ON%Truth is, captain, I\'ve heard of a procedure...and if the lout wants his nose off then I can make that happen. Seeing as you\'re the boss of this outfit, I\'ll let you decide. But this will run you 200 crowns. I sure as hell didn\'t sign up for this nonsense.%SPEECH_OFF%",
        mode = "pattern"
        en = "[img]gfx/ui/events/event_03.png[/img][M] While on the march, you are approached by %surgeon% the surgeon and %cultist% the cultist. You raise an eyebrow and wait for one of them to speak. The cultist only stares at you with a vacant expression. Noticing this, %surgeon% opens his mouth to speak.%SPEECH_ON%It's damn uncanny captain. Not but a few moments ago this damned lunatic wouldn't shut up about 'Dave Cool' or some shit. Madman says he needs his nose sliced off.%SPEECH_OFF%%surgeon% shakes his head at you incredulously.%SPEECH_ON%Truth is, captain, I've heard of a procedure...and if the lout wants his nose off then I can make that happen. Seeing as you're the boss of this outfit, I'll let you decide. But this will run you 200 crowns. I sure as hell didn't sign up for this nonsense.%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_03.png[/img][M] На марше к вам подходят %surgeon%, хирург, и %cultist%, культист. Вы приподнимаете бровь и ждёте, кто заговорит первым. Культист лишь смотрит на вас пустыми глазами. Заметив это, %surgeon% начинает: %SPEECH_ON%Чертовщина какая-то, командир. Только что этот полоумный без умолку твердил про какого-то «Давкула» или вроде того. Говорит, ему надо отрезать нос.%SPEECH_OFF%%surgeon% недоверчиво качает головой. %SPEECH_ON%По правде, командир, я слыхал о такой операции... и если этому дурню нужен нос долой, я это устрою. Но раз вы тут главный, решать вам. Обойдётся в 200 крон. Я, чёрт возьми, не на такое подряжался.%SPEECH_OFF%"
    }
    {
        en = "Do as he asks. I will ensure you are compensated."
        ru = "Сделай, как он просит. Внакладе не останешься."
    }
    {
        en = "This is madness. Save the slicing and dicing for our enemies on the battlefield!"
        ru = "Это безумие. Прибереги резню для врагов на поле боя!"
    }
    {
        // Text = "[img]gfx/ui/events/event_03.png[/img][M] You give %surgeon% the nod and he grins back at you grimly. %SPEECH_ON%Crowns are crowns, cap.%SPEECH_OFF%%surgeon% removes a grisly looking saw from his trousers and beckons to the cultist. %cultist% grunts in understanding and the two make their way to a more secluded area.\n\nAround a half hour later, the two men make their reappearance. The cultist has a bandage wrapped almost entirely around his face, with just one eye exposed. It is fixed on you with a piercing focus directly contrasting its prior vacancy. Meanwhile, %surgeon% the surgeon follows behind, arms dangling limply by his side. He mutters, %SPEECH_ON%Davkul awaits us all.%SPEECH_OFF%The cultist nods and repeats, %SPEECH_ON%Davkul awaits us all.%SPEECH_OFF%The two return to the main campsite, but before they do you notice that the bandages around the cultist\'s head are curiously absent of blood. You have no idea what to make of these events but before long the daily tasks of managing a mercenary company push this to the back of your mind.",
        mode = "pattern"
        en = "[img]gfx/ui/events/event_03.png[/img][M] You give %surgeon% the nod and he grins back at you grimly. %SPEECH_ON%Crowns are crowns, cap.%SPEECH_OFF%%surgeon% removes a grisly looking saw from his trousers and beckons to the cultist. %cultist% grunts in understanding and the two make their way to a more secluded area.\n\nAround a half hour later, the two men make their reappearance. The cultist has a bandage wrapped almost entirely around his face, with just one eye exposed. It is fixed on you with a piercing focus directly contrasting its prior vacancy. Meanwhile, %surgeon% the surgeon follows behind, arms dangling limply by his side. He mutters, %SPEECH_ON%Davkul awaits us all.%SPEECH_OFF%The cultist nods and repeats, %SPEECH_ON%Davkul awaits us all.%SPEECH_OFF%The two return to the main campsite, but before they do you notice that the bandages around the cultist's head are curiously absent of blood. You have no idea what to make of these events but before long the daily tasks of managing a mercenary company push this to the back of your mind."
        ru = "[img]gfx/ui/events/event_03.png[/img][M] Вы киваете %surgeon%, и он мрачно скалится в ответ. %SPEECH_ON%Кроны есть кроны, командир.%SPEECH_OFF%%surgeon% достаёт из-за пояса жутковатого вида пилу и манит культиста за собой. %cultist% понимающе хмыкает, и оба уходят подальше от чужих глаз.\n\nПримерно через полчаса они возвращаются. Лицо культиста почти целиком обмотано повязкой, наружу глядит лишь один глаз — и глядит на вас с пронзительным вниманием, ничуть не похожим на прежнюю пустоту. Следом плетётся %surgeon%, руки безвольно висят вдоль тела. Он бормочет: %SPEECH_ON%Давкул ждёт всех нас.%SPEECH_OFF%Культист кивает и повторяет: %SPEECH_ON%Давкул ждёт всех нас.%SPEECH_OFF%Оба уходят к костру, и лишь напоследок вы замечаете, что на повязке культиста нет ни капли крови. Как это понимать, вы не знаете, но вскоре повседневные заботы отряда вытесняют это из головы."
    }
    {
        en = "Davkul awaits us all, I guess."
        ru = "Похоже, Давкул и правда ждёт всех нас."
    }
    {
        // text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]200[/color] Crowns"
        mode = "pattern"
        en = "You spend [color=<c:str>]200[/color] Crowns"
        ru = "Вы потратили [color=<c>]200[/color] крон"
    }
    {
        // text = _event.m.Cultist.getName() + " suffers " + injury.getNameOnly()
        mode = "pattern"
        en = "<name:str> suffers <injury:str>"
        ru = "<name> получает травму <injury:t>"
    }
    {
        en = "Made a few quick crowns with his expertise as a surgeon"
        ru = "Быстро срубил крон своим лекарским ремеслом"
    }
    {
        en = "Got the aid of a fellow brother to please Davkul"
        ru = "Брат по оружию помог ему угодить Давкулу"
    }
    {
        // Text = "[img]gfx/ui/events/event_03.png[/img][M] You shake your head. As an extra precaution, you try to frame the refusal on the grounds of the surgical fee. However, %cultist%\'s eyes snap back into focus. %SPEECH_ON%Davkul will remember this.%SPEECH_OFF%Suddenly, you hear a sickening crunch and %surgeon% doubles over in pain, with both hands covering his face. He curses. %SPEECH_ON%Bloody shite...m\' phuggin\' nose.%SPEECH_OFF%%surgeon% stumbles away to treat himself and %cultist% wanders off, leaving you alone and bewildered about this turn of events.",
        mode = "pattern"
        en = "[img]gfx/ui/events/event_03.png[/img][M] You shake your head. As an extra precaution, you try to frame the refusal on the grounds of the surgical fee. However, %cultist%'s eyes snap back into focus. %SPEECH_ON%Davkul will remember this.%SPEECH_OFF%Suddenly, you hear a sickening crunch and %surgeon% doubles over in pain, with both hands covering his face. He curses. %SPEECH_ON%Bloody shite...m' phuggin' nose.%SPEECH_OFF%%surgeon% stumbles away to treat himself and %cultist% wanders off, leaving you alone and bewildered about this turn of events."
        ru = "[img]gfx/ui/events/event_03.png[/img][M] Вы качаете головой. На всякий случай вы валите отказ на цену операции. Но взгляд %cultist% вдруг становится осмысленным. %SPEECH_ON%Давкул этого не забудет.%SPEECH_OFF%В тот же миг раздаётся мерзкий хруст, и %surgeon% сгибается пополам, закрыв лицо руками. Он бранится: %SPEECH_ON%Твою ж... нос мой, зараза.%SPEECH_OFF%%surgeon% ковыляет прочь лечиться, %cultist% уходит своей дорогой, а вы остаётесь в полном недоумении от случившегося."
    }
    {
        en = "What the hell just happened?"
        ru = "Это что сейчас было?"
    }
    {
        en = "Suffered a broken nose from a supernatural force"
        ru = "Сломал нос по воле неведомой силы"
    }
    {
        en = "Was denied a request that would have pleased Davkul"
        ru = "Получил отказ в том, что порадовало бы Давкула"
    }
    // en = "cultist"
    // en = "surgeon"
    // FILE: scripts/events/events/hackflows/dissenter_challenges_player_event.nut
    {
        en = "During Camp..."
        ru = "Во время привала..."
    }
    {
        en = "[img]gfx/ui/events/event_26.png[/img][M] While joining the company at a campfire, %dissenter% leaps to his feet and speaks with a reddened face.%SPEECH_ON%I don't know how the rest of you sods feel, but I for one think that the leadership of this outfit has been particularly shoddy lately!%SPEECH_OFF%He points an accusing finger at you.%SPEECH_ON%We fight, bleed, and die for our coin, but what about him? He's no better than the nobles hiding behind their high towers and castle walls, fattening both his purse and belly alike on our hard work. We should rid ourselves of this leech and divide our rightful cut of the coin among us.\n\nYou take a seat. The men are staring at you, waiting for a response."
        ru = "[img]gfx/ui/events/event_26.png[/img][M] Вы подсаживаетесь к костру, и тут %dissenter% вскакивает на ноги и говорит, побагровев лицом.%SPEECH_ON%Не знаю, как вы, олухи, а по мне так с командованием в этом отряде в последнее время совсем беда!%SPEECH_OFF%Он обвиняюще тычет в вас пальцем.%SPEECH_ON%Мы деремся, истекаем кровью и подыхаем за свои монеты, а он? Да он не лучше знати, что отсиживается за высокими башнями да замковыми стенами, набивая на нашем горбу и кошель, и брюхо. Пора избавиться от этой пиявки и поделить причитающееся нам по совести.\n\nВы садитесь. Люди смотрят на вас и ждут ответа."
    }
    {
        en = "You're totally right. I'll leave the company right away."
        ru = "Ты совершенно прав. Немедленно ухожу из отряда."
    }
    {
        en = "Time to cut you down to size."
        ru = "Пора поставить тебя на место."
    }
    {
        en = "I'm in charge here! This is my company!"
        ru = "Здесь командую я! Это мой отряд!"
    }
    {
        en = "[img]gfx/ui/events/event_26.png[/img][M] You kick your feet out, legs akimbo, and place your hands in your lap. Nodding, you speak to the man.%SPEECH_ON%Alright, %dissenter%. I'll do ask you ask. Come morning I'll retire and make tracks to the nearest town. In the meantime, I suppose that means that you gotta count inventory every morning and night. Don't want these fine men going into battle a few arrows short. Speaking of counting, I suppose my old share will be divided fairly, yes? How will that be decided?%SPEECH_OFF%You throw out your hand in a swooping gesture, so that the campfire casts a shadow which lingers briefly over each of the brothers huddled around it.%SPEECH_ON%You'll also need to keep a steady count on your people. They're not easily controlled, to which you might find some irony - or not.%SPEECH_OFF% You curl your extended palm into a fist then jam a finger to your temple.%SPEECH_ON%And you'll need need someone to think on their feet and bark orders in the heat of battle. Orders that keep men alive to spend their hard earned coin after the battle. Evidently you have a qualified replacement for me, so I will gracefully take my leave come morning.%SPEECH_OFF%As soon as you finish, you see several brothers shaking their heads in disapproval, while others fidget with their gear nervously. Lacking a good retort to these points, %dissenter% backs down and retreats to his tent for the night."
        ru = "[img]gfx/ui/events/event_26.png[/img][M] Вы вытягиваете ноги, разводите колени и складываете руки на коленях. Кивнув, вы обращаетесь к нему.%SPEECH_ON%Хорошо, %dissenter%. Сделаю, как ты просишь. Поутру уйду на покой и двину в ближайший город. А пока, стало быть, тебе придётся считать припасы утром и вечером. Не хотелось бы, чтобы эти славные ребята шли в бой без пары десятков стрел. Кстати о счёте: моя доля ведь будет поделена по справедливости? И как вы это решите?%SPEECH_OFF%Вы обводите рукой круг, и тень от костра на миг задерживается на каждом из братьев, сидящих вокруг.%SPEECH_ON%А ещё тебе придётся приглядывать за людьми. Управлять ими непросто — тут ты, может, углядишь иронию, а может, и нет.%SPEECH_OFF% Вы сжимаете вытянутую ладонь в кулак и тычете пальцем себе в висок.%SPEECH_ON%И понадобится кто-то, кто соображает на ходу и рявкает приказы в самой гуще боя. Приказы, после которых люди остаются живы и могут потратить свои кровные. Раз уж достойная замена мне у вас есть, поутру я с честью откланяюсь.%SPEECH_OFF%Едва вы умолкаете, несколько братьев неодобрительно качают головами, а другие нервно теребят снаряжение. Не найдя, что возразить, %dissenter% отступает и уходит на ночь к себе в палатку."
    }
    {
        en = "Damn straight."
        ru = "То-то же."
    }
    {
        en = "Gained confidence in your leadership"
        ru = "Уверился в вашем командовании"
    }
    {
        en = "[img]gfx/ui/events/event_26.png[/img][M] The campfire crackles an orange glow across your face. Nodding, you stand up and walk up to %dissenter%. He takes a step back, but not before you throw a hand out and grab him by the shoulder. You quickly step forward, scissoring a leg back behind his knee, buckling him and throwing him onto his back. You follow him to the ground and there plant one hand around his throat while the other points an accusing finger.%SPEECH_ON%I see some of you have been unhappy with my leadership. But before you get too eager to grab at my share of the coin and challenge my leadership, consider for a moment the reason why you are alive to voice your grievances. %dissenter% is a good man for having the guts to speak up when things have fallen to shite, but to challenge leadership without an idea of what comes after is utter foolishness. I daresay without my guidance as a tactician and quartermaster you lot would be finished within a fortnight!%SPEECH_OFF%Standing up, you actually help %dissenter% to his feet. He sneers at you and takes off, pushing aside a few onlooking brothers as he makes his exit. They look towards his back and cast a few sheepish glances in your direction, but no one comments on what just transpired. You take your seat back at the fire."
        ru = "[img]gfx/ui/events/event_26.png[/img][M] Костёр бросает оранжевые отсветы на ваше лицо. Кивнув, вы поднимаетесь и идёте к %dissenter%. Он делает шаг назад, но вы успеваете схватить его за плечо. Резко шагнув вперёд, вы подсекаете ему ногу под колено и опрокидываете на спину. Вы опускаетесь следом, одной рукой берёте его за горло, а другой указываете на него пальцем.%SPEECH_ON%Я вижу, кое-кому из вас не по нраву моё командование. Но прежде чем тянуть руки к моей доле и оспаривать мою власть, подумайте-ка, почему вы вообще живы и можете жаловаться. %dissenter% — молодец, что хватило духу сказать вслух, когда всё пошло к чертям. Но оспаривать власть, не зная, что будет дальше, — чистая дурость. Смею заверить: без меня как тактика и завхоза вы бы все полегли за пару недель!%SPEECH_OFF%Поднявшись, вы и вправду помогаете %dissenter% встать. Он злобно щерится и уходит, растолкав нескольких зевак. Те смотрят ему вслед, кидают на вас смущённые взгляды, но никто ничего не говорит. Вы возвращаетесь на своё место у костра."
    }
    {
        en = "Still got it!"
        ru = "Порох в пороховницах ещё есть!"
    }
    {
        en = "Felt humiliated in front of the company"
        ru = "Был опозорен перед всем отрядом"
    }
    {
        en = "[img]gfx/ui/events/event_26.png[/img][M] You immediately jump back to your feet and begin shouting.%SPEECH_ON%I'm the one in charge here! Me! Who has the money? Me! If it weren't for me, none of y'all would even be here! You'd still be in the pits of whatever old lives you had! You should be groveling before my feet for the opportunities I have provided! And %dissenter%, if you contest me again I swear to the gods I will have you flogged and hanged, understand?%SPEECH_OFF%The outburst instantly quiets the camp. %dissenter% nods and backs away. A few of the men murmur between themselves as you take your seat again."
        ru = "[img]gfx/ui/events/event_26.png[/img][M] Вы тут же вскакиваете на ноги и начинаете орать.%SPEECH_ON%Здесь командую я! Я! У кого деньги? У меня! Если бы не я, никого из вас тут вообще не было бы! Гнили бы в той яме, что звалась вашей прежней жизнью! Да вы в ногах у меня валяться должны за то, что я вам дал! А ты, %dissenter%, ещё раз пойдёшь мне поперёк — и клянусь богами, велю тебя выпороть и вздёрнуть, ясно?%SPEECH_OFF%От этого крика лагерь мгновенно затихает. %dissenter% кивает и пятится. Пока вы садитесь обратно, несколько человек перешёптываются между собой."
    }
    {
        en = "That went pretty well, no?"
        ru = "Неплохо вышло, а?"
    }
    {
        en = "Lost confidence in your leadership"
        ru = "Разуверился в вашем командовании"
    }
    // en = "dissenter"
    // FILE: scripts/events/events/hackflows/drifter_joins_company_event.nut
    {
        en = "[img]gfx/ui/events/event_80.png[/img][M] Even though wanderers by their very nature disperse themselves across the whole wide world, some unseen force always conspires to draw them together. A perfect example of this is %drifter% the drifter. \n\nIt seems that somehow while on the march %drifter% made a friend with another drifter. Now that man is requesting to join the company. It doesn't seem like either man has an emotional stake in your decision, and having another fighting man in the line is always a boon, but then again it may not be best practice to accept just any random wanderer into your ranks..."
        ru = "[img]gfx/ui/events/event_80.png[/img][M] Хоть бродяги по самой своей природе расходятся по всему белому свету, некая незримая сила вечно сводит их вместе. Лучший тому пример — %drifter%, бродяга. \n\nПохоже, где-то на марше %drifter% свёл дружбу с другим таким же скитальцем. Теперь тот просится в отряд. Ни одному из них, судя по всему, нет особого дела до вашего решения, а лишний боец в строю никогда не лишний. С другой стороны, брать в ряды кого попало — привычка так себе..."
    }
    {
        en = "Move along, wanderer."
        ru = "Иди своей дорогой, странник."
    }
    // en = "drifter"
    // FILE: scripts/events/events/hackflows/fletcher_recovers_arrows_event.nut
    {
        en = "After the battle..."
        ru = "После битвы..."
    }
    {
        en = "[img]gfx/ui/events/event_22.png[/img][M] You survey the result of the gruesome fight. As you trudge through the heap of lifeless meat and broken remnants, you spy %fletcher% kicking bodies about and digging amongst the carnage. %SPEECH_ON%I can salvage some of the ammunition we spent here, sir. We can use it again someday to kill more of these bastards.%SPEECH_OFF% As he says this, he pulls an arrow by the shaft out of an eye socket; the action produces a sickening squelch as the eyeball is pulled out as well."
        ru = "[img]gfx/ui/events/event_22.png[/img][M] Вы осматриваете, что осталось после жестокой схватки. Пробираясь через груды мёртвого мяса и обломков, вы замечаете %fletcher%, который переворачивает тела ногой и роется в этой бойне. %SPEECH_ON%Часть потраченных боеприпасов можно собрать, сударь. Когда-нибудь пустим их в ход и положим ещё сколько-то этих ублюдков.%SPEECH_OFF% С этими словами он тянет стрелу за древко из глазницы; раздаётся мерзкое чавканье, и вместе со стрелой наружу выходит глаз."
    }
    {
        // text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + amount + "[/color] Ammunition."
        mode = "pattern"
        en = "You gain [color=<c:str>]+<n:int>[/color] Ammunition."
        ru = "Вы получаете [color=<c>]+<n>[/color] боеприпасов."
    }
    // en = "fletcher"
    // FILE: scripts/events/events/hackflows/fletcher_upgrades_large_quiver_of_arrows_event.nut
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] As you're taking inventory during camp, %fletcher% walks in and hands you a quiver packed tightly with arrows. %SPEECH_ON%Got a look at the quivers our bowmen had to work with, captain. Figured I would apply my knowledge to get them to hold a few extra. No big deal, had some spare materials and time to do it.%SPEECH_OFF% Without waiting for an answer, %fletcher% walks away, leaving you to your work."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Пока вы на привале пересчитываете запасы, входит %fletcher% и протягивает вам колчан, туго набитый стрелами. %SPEECH_ON%Поглядел я, с какими колчанами ходят наши лучники, командир. Вот и приложил своё умение, чтоб влезало побольше. Дело нехитрое, материалы и время были.%SPEECH_OFF% Не дожидаясь ответа, %fletcher% уходит, оставляя вас за работой."
    }
    // FILE: scripts/events/events/hackflows/fletcher_upgrades_large_quiver_of_bolts_event.nut
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] As you're taking inventory during camp, %fletcher% walks in and hands you a quiver packed tightly with bolts. %SPEECH_ON%Got a look at the quivers our bowmen had to work with, captain. Figured I would apply my knowledge to get them to hold a few extra. No big deal, had some spare materials and time to do it.%SPEECH_OFF% Without waiting for an answer, %fletcher% walks away, leaving you to your work."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] Пока вы на привале пересчитываете запасы, входит %fletcher% и протягивает вам колчан, туго набитый болтами. %SPEECH_ON%Поглядел я, с какими колчанами ходят наши стрелки, командир. Вот и приложил своё умение, чтоб влезало побольше. Дело нехитрое, материалы и время были.%SPEECH_OFF% Не дожидаясь ответа, %fletcher% уходит, оставляя вас за работой."
    }
    // FILE: scripts/events/events/hackflows/gardener_provides_mysterious_herbs_event.nut
    {
        en = "[img]gfx/ui/events/event_25.png[/img][M] As the %companyname% is on the march, you make your way to the supply wagon to check on inventory. There, you spot %gardener% the gardener, trowel in hand, tending a few strange plants in a plot of soil made from an empty crate. Noticing your presence, %gardener% turns around and speaks. %SPEECH_ON%Good timing, captain. I've been working on keeping my thumb green while on the road...figured it wouldn't be too much of a hassle to grow some medicinal herbs as I did so. Keep the skills sharp while helping the company, sir.%SPEECH_OFF%He puts the trowel down and hands you a few herbs.%SPEECH_ON%Most of these can be used to craft medicine. A couple here can also make a damn fine tea...I'd like to keep these as a reminder of past happy days.%SPEECH_ON%His gaze shifts, as if by staring off into the distance he might better visualize his past. It lasts only a couple moments, but %gardener% coughs and awkwardly returns to his work. Not minding this turn of events, you add the herbs to the inventory and begin working on your task."
        ru = "[img]gfx/ui/events/event_25.png[/img][M] Пока %companyname% в пути, вы идёте к обозной телеге пересчитать припасы. Там вы застаёте %gardener%, садовника: с совком в руке он возится с какими-то странными растениями, высаженными в землю прямо в пустом ящике. Заметив вас, %gardener% оборачивается. %SPEECH_ON%Как раз вовремя, командир. Стараюсь и в дороге рук не терять... вот и решил заодно вырастить лекарственных трав. И умение при мне, и отряду польза, сударь.%SPEECH_OFF%Он откладывает совок и протягивает вам несколько пучков.%SPEECH_ON%Из большинства выйдут лекарства. А парочка идёт на чай, да такой, что закачаешься... эти я оставлю себе, на память о былых счастливых днях.%SPEECH_ON%Взгляд его уплывает вдаль, будто так прошлое видится яснее. Это длится всего пару мгновений; %gardener% кашляет и неловко возвращается к работе. Не придав этому значения, вы добавляете травы к припасам и беретесь за свои дела."
    }
    {
        en = "Perhaps we can make some use of these herbs..."
        ru = "Пожалуй, этим травам найдётся применение..."
    }
    {
        // text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + 6 + "[/color] Medical Supplies."
        mode = "pattern"
        en = "You gain [color=<c:str>]+6[/color] Medical Supplies."
        ru = "Вы получаете [color=<c>]+6[/color] медикаментов."
    }
    // en = "gardener"
    // FILE: scripts/events/events/hackflows/hangman_hangs_wiederganger_event.nut
    {
        en = "[img]gfx/ui/events/event_02.png[/img][M] You are in the midst of preparing camp when suddenly you begin hearing a chorus of hooting and hollering. You quickly rush to the source of the commotion to discover your men circled around a tree. You look up and see a torso strung up by the neck, arms limp and flapping about haphazardly. The bottom half of the corpse is nowhere to be seen."
        ru = "[img]gfx/ui/events/event_02.png[/img][M] Вы разбиваете лагерь, как вдруг раздаётся дружное улюлюканье и гогот. Вы спешите на шум и застаёте своих людей столпившимися вокруг дерева. Подняв глаза, вы видите подвешенное за шею туловище: руки безвольно болтаются из стороны в сторону. Нижней половины трупа нигде не видно."
    }
    {
        en = "What the fuck is going on here?"
        ru = "Что тут, чёрт возьми, происходит?"
    }
    {
        en = "[img]gfx/ui/events/event_02.png[/img][M] Amidst the jeering you roar for an explanation. Just then, %hangman% the hangman steps out from behind the tree, brushing his hands and beaming. He speaks. %SPEECH_ON%The boys and I discovered this miserable specimen dragging itself along the ground. Wouldn't do anyone any good to step on the bugger, so we figured we'd have a spot of fun.%SPEECH_OFF%As if in response, the corpse gasps and raises its arms, reaching out as it lets out a snarl choked by the rope tightened around his windpipe. %hangman% laughs. %SPEECH_ON%Look, %otherbro%, I think it wants its papa! Why don't you give him a hug?%SPEECH_OFF%%otherbro% guffaws. %SPEECH_ON%No way the lad can be mine. He's got your massive forehead and cockeye!%SPEECH_OFF%Friendly banter like this passes from brother to brother. Understanding that there is no immediate danger, you return to continue preparing camp."
        ru = "[img]gfx/ui/events/event_02.png[/img][M] Перекрывая гогот, вы рявкаете, требуя объяснений. Тут из-за дерева выходит %hangman%, палач, отряхивая руки и сияя. Он говорит: %SPEECH_ON%Мы с парнями нашли этого жалкого выродка, он полз себе по земле. Наступить на него — никакого проку, вот мы и решили малость позабавиться.%SPEECH_OFF%Будто в ответ, труп хрипит и вскидывает руки, тянется к ним, рыча сквозь стянутую верёвкой глотку. %hangman% смеётся. %SPEECH_ON%Гляди, %otherbro%, он к папаше просится! Может, обнимешь сынка?%SPEECH_OFF%%otherbro% ржёт. %SPEECH_ON%Да не мой это парень никак. У него твой лобище и косоглазие!%SPEECH_OFF%Подобные шуточки идут от брата к брату. Убедившись, что опасности нет, вы возвращаетесь разбивать лагерь."
    }
    {
        en = "That's definitely one way to relieve stress..."
        ru = "Ну, тоже способ снять напряжение..."
    }
    {
        en = "Entertained by a strung up zombie"
        ru = "Повеселился над подвешенным мертвецом"
    }
    // en = "hangman"
    // en = "otherbro"
    // FILE: scripts/events/events/hackflows/hangman_vs_criminal_event.nut
    {
        en = "[img]gfx/ui/events/event_26.png[/img][M] After a long day of marching, your men are gathered around the campfire, sharing stories about their past. Soon it is %hangman% the hangman's turn to speak and he simply shrugs. %SPEECH_ON%Not much to say, boys. When I was young our village had a serial rapist. We caught the fucker and had him strung up. Vigilante justice and all that. I had the honor of doinging the stringing...guess folks liked how I did it because soon enough I was doing it for crowns. At some point we even set up a platform with a trapdoor and everything!%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_26.png[/img][M] После долгого дневного перехода люди собрались у костра и травят байки о прошлом. Вскоре черёд говорить доходит до %hangman%, палача, и тот лишь пожимает плечами. %SPEECH_ON%Да рассказывать особо нечего, парни. Когда я был молод, у нас в деревне завёлся насильник. Поймали мы гада и вздёрнули. Самосуд, все дела. Мне выпала честь вязать петлю... видать, народу понравилось, как я это сделал, потому что вскоре я стал делать это за кроны. Дошло до того, что мы и помост с люком соорудили, всё как положено!%SPEECH_OFF%"
    }
    {
        en = "[img]gfx/ui/events/event_26.png[/img][M] The other men laugh and guffaw at the absurdity of it all. %hangman% points at %criminal% and continues. %SPEECH_ON%I really did hate that first fucker I executed. But truth is, over the years, it just became a way to keep food on the table. I've pulled the lever on murderers, petty thieves, and captured bandits. Seen the end of graverobbers, poachers, and deserters. Even silenced peasants that spoke up a little too much about the local lords.%SPEECH_ON%The laughter and mirth stops and a silence falls over the campfire. %hangman% stares at %criminal% with steely eyes, before cracking a smile. %SPEECH_ON%Even as I cut their lives short, I felt nothing like the rush of that first hangin'. I was living an empty life. That's the reason why I'm here. That job was a load of horse shite. It's way more invigoratin' to fight and bleed alongside fuckers like you.%SPEECH_OFF%At this, %criminal% lifts his finger and points back at the hangman. %SPEECH_ON%Same to you, you fuckin' weirdo! Men like us fear the noose, not the man behind it. Crowns are crowns.%SPEECH_OFF%The atmosphere brightens and if anything becomes more positive than before. You get the feeling that this exchange has improved the morale of the men somewhat."
        ru = "[img]gfx/ui/events/event_26.png[/img][M] Остальные хохочут над нелепостью всей этой истории. %hangman% указывает на %criminal% и продолжает. %SPEECH_ON%Того первого гада я и правда ненавидел. Но по правде, с годами это стало просто способом класть еду на стол. Я дёргал рычаг под убийцами, мелкими воришками и пойманными разбойниками. Провожал на тот свет гробокопателей, браконьеров и дезертиров. Даже затыкал крестьян, которые слишком много болтали про местных господ.%SPEECH_ON%Смех и веселье стихают, у костра повисает тишина. %hangman% смотрит на %criminal% стальным взглядом, а потом усмехается. %SPEECH_ON%Сколько я ни обрывал чужих жизней, того трепета, что в первый раз, больше не было. Жизнь моя стала пустой. Потому я и здесь. Та работёнка — дерьмо собачье. Куда веселее драться и истекать кровью бок о бок с такими ублюдками, как вы.%SPEECH_OFF%На это %criminal% поднимает палец и тычет в палача. %SPEECH_ON%И тебе того же, чудила! Такие, как мы, боятся петли, а не того, кто её вяжет. Кроны есть кроны.%SPEECH_OFF%Настроение у костра проясняется и становится даже лучше прежнего. У вас есть чувство, что этот разговор изрядно поднял людям дух."
    }
    {
        en = "All's well that ends well."
        ru = "Всё хорошо, что хорошо кончается."
    }
    {
        en = "Heard a positive exchange between a hangman brother and another brother"
        ru = "Слышал добрый разговор палача с другим братом"
    }
    // en = "criminal"
    // FILE: scripts/events/events/hackflows/herbalist_cures_ailing_event.nut
    {
        en = "On the Road..."
        ru = "В дороге..."
    }
    {
        en = "[img]gfx/ui/events/event_128.png[/img][M] While on the march, you hear %ailingBro% retching pitifully near the back of the formation. It could have been something he ate, something in the air, the smell of blood from the last battle, or whatever other horse shite reason. \n\n As the company is forced to slow down for what seems like the 10th time today, %herbalist% reaches into his personal pack, pulls out a vial of green solution, and hands it to %ailingBro%. %SPEECH_ON%Drink this.%SPEECH_OFF%. %ailingBro% grimaces and complains, %SPEECH_ON%You tryin' to kill me, ya farkin' kook? Can't you tell I'm green enough as is?%SPEECH_OFF% You tell him that as it is, his illness is already slowing progress to a crawl. %ailingBro% begrdugingly accepts the vial and holds back his heaving long enough to down the contents in one go. \n\n He immediately begins sputtering and cursing at the horrifically bitter taste, with the worst of the insults directed at %herbalist% and his mother. %herbalist% seems to take this in stride. %SPEECH_ON%Words won't have an effect on me, so long as they keep you from spilling your guts onto my boots.%SPEECH_OFF% %ailingBro% pauses briefly in realization before lowering his head, offering a surprisingly sincere apology, and falling back into line."
        ru = "[img]gfx/ui/events/event_128.png[/img][M] На марше вы слышите, как в хвосте колонны жалобно давится %ailingBro%. Может, съел что не то, может, воздух здешний, может, запах крови с прошлой битвы — да мало ли какая ещё дрянь. \n\n Когда отряд сбавляет шаг, кажется, уже в десятый раз за день, %herbalist% лезет в свою котомку, достаёт склянку с зелёным раствором и протягивает её %ailingBro%. %SPEECH_ON%Пей.%SPEECH_OFF%. %ailingBro% кривится и ворчит: %SPEECH_ON%Ты меня уморить решил, чудила? Не видишь, я и так весь зелёный?%SPEECH_OFF% Вы замечаете, что из-за его хвори отряд и так плетётся черепашьим шагом. %ailingBro% нехотя берёт склянку и, сдержав очередной позыв, выпивает всё разом. \n\n Он тут же начинает отплёвываться и браниться от чудовищной горечи, причём худшее достаётся %herbalist% и его матушке. %herbalist% принимает это невозмутимо. %SPEECH_ON%Слова мне не повредят, пока они удерживают твои кишки от того, чтобы вывалиться мне на сапоги.%SPEECH_OFF% %ailingBro% на миг замирает, поняв, о чём речь, опускает голову, на удивление искренне извиняется и возвращается в строй."
    }
    {
        en = "We're lucky to have an herbalist with us."
        ru = "Нам повезло, что с нами травник."
    }
    {
        // text = _event.m.AilingBro.getName() + " is no longer ailing"
        mode = "pattern"
        en = "<name:str> is no longer ailing"
        ru = "<name> больше не хворый"
    }
    {
        en = "Restored the vitality of an ailing brother"
        ru = "Вернул силы хворому брату"
    }
    {
        en = "Had his vitality restored by an herbalist"
        ru = "Травник вернул ему силы"
    }
    // en = "herbalist"
    // FILE: scripts/events/events/hackflows/herbalist_cures_asthma_event.nut
    {
        en = "[img]gfx/ui/events/event_128.png[/img][M] While on the march, you hear %asthmaticBro% wheezing near the back of the formation. He has always had problems keeping up on account of his lung condition, but today in particular the company is being held up much more than usual. \n\n That is, until %herbalist% pulls out a mixture of herbal medicine and smellingsalts and hands them over to %asthmaticBro%. \n\n His nose wrinkles after the first whiff, but the remedy has an immediate effect. %asthmaticBro% grins and thanks %herbalist% enthusiastically. It seems that the provided trinket has offset the negative effects of his asthma!"
        ru = "[img]gfx/ui/events/event_128.png[/img][M] На марше вы слышите, как в хвосте колонны хрипит %asthmaticBro%. Из-за больных лёгких он всегда отставал, но сегодня отряд задерживается куда сильнее обычного. \n\n Так продолжается, пока %herbalist% не достаёт смесь трав с нюхательной солью и не отдаёт её %asthmaticBro%. \n\n С первого вдоха тот морщит нос, но средство действует сразу. %asthmaticBro% расплывается в улыбке и горячо благодарит %herbalist%. Похоже, эта штука избавила его от мучений с астмой!"
    }
    {
        // text = _event.m.AsthmaticBro.getName() + " is no longer asthmatic"
        mode = "pattern"
        en = "<name:str> is no longer asthmatic"
        ru = "<name> больше не астматик"
    }
    {
        en = "Cured a fellow brother of asthma"
        ru = "Излечил брата по оружию от астмы"
    }
    {
        en = "Was cured of his asthma"
        ru = "Излечился от астмы"
    }
    // FILE: scripts/events/events/hackflows/herbalist_cures_sickness_event.nut
    {
        // Text = "[img]gfx/ui/events/event_18.png[/img][M] %sickbro%, who\'s come down with something downright nasty, has been pausing periodically to heave the inside of his guts on the side of the road. %herbalist% the herbalist finally reaches into his pouch and pulls out a jar filled with some purplish paste. He walks over to %sickbro% as he doubles over for the umpteenth time. %SPEECH_ON%Choke some of this stuff down. It\'ll taste like shite but should keep your stomach from turning inside out and sideways.%SPEECH_OFF% %sickbro% dips his fingers into the jar, scoops some of the viscous goop and manages to get some into his moutn. His gaunt expression sours in dismay, but he summons the willpower to swallow. %herbalist% pats him on the back encouragingly. %SPEECH_ON%Good man. Soon enough you\'ll be right as rain.%SPEECH_OFF% The men fall back into line and sure enough, it seems that in the next few hours %sickbro%\'s mood and health recover somewhat.",
        mode = "pattern"
        en = "[img]gfx/ui/events/event_18.png[/img][M] %sickbro%, who's come down with something downright nasty, has been pausing periodically to heave the inside of his guts on the side of the road. %herbalist% the herbalist finally reaches into his pouch and pulls out a jar filled with some purplish paste. He walks over to %sickbro% as he doubles over for the umpteenth time. %SPEECH_ON%Choke some of this stuff down. It'll taste like shite but should keep your stomach from turning inside out and sideways.%SPEECH_OFF% %sickbro% dips his fingers into the jar, scoops some of the viscous goop and manages to get some into his moutn. His gaunt expression sours in dismay, but he summons the willpower to swallow. %herbalist% pats him on the back encouragingly. %SPEECH_ON%Good man. Soon enough you'll be right as rain.%SPEECH_OFF% The men fall back into line and sure enough, it seems that in the next few hours %sickbro%'s mood and health recover somewhat."
        ru = "[img]gfx/ui/events/event_18.png[/img][M] %sickbro%, подхвативший какую-то редкостную дрянь, то и дело останавливается, чтобы вывернуть нутро на обочину. Наконец %herbalist%, травник, лезет в сумку и достаёт горшочек с лиловой мазью. Он подходит к %sickbro%, когда того скручивает в очередной раз. %SPEECH_ON%Пропихни в себя вот этого. На вкус — дрянь дрянью, зато желудок перестанет выворачиваться наизнанку.%SPEECH_OFF% %sickbro% запускает пальцы в горшочек, зачерпывает вязкую жижу и кое-как отправляет в рот. Его осунувшееся лицо кривится, но воли хватает, чтобы проглотить. %herbalist% ободряюще хлопает его по спине. %SPEECH_ON%Молодец. Скоро будешь как новенький.%SPEECH_OFF% Отряд возвращается в строй, и правда: за несколько часов %sickbro% заметно приободряется и приходит в себя."
    }
    {
        en = "We are lucky to have an herbalist with us."
        ru = "Нам повезло, что среди нас есть травник."
    }
    {
        // text = _event.m.SickBro.getName() + " is no longer sick"
        mode = "pattern"
        en = "<name:str> is no longer sick"
        ru = "<name> больше не болен"
    }
    {
        en = "Cured a fellow brother of an illness"
        ru = "Излечил брата по оружию от хвори"
    }
    {
        en = "Was cured of his illness"
        ru = "Излечился от хвори"
    }
    // en = "sickbro"
    // FILE: scripts/events/events/hackflows/historian_and_cartographer_pinpoint_famed_event.nut
    {
        en = "[img]gfx/ui/events/event_45.png[/img][M] You are in the middle of taking inventory when %cartographer% the cartographer and %historian% the historian both rush in and simultaneously begin chattering excitedly. You roar at them to get a grip and the two abruptly fall silent and look at each other. After a brief pause, %historian% speaks up. %SPEECH_ON%Sir, we have something quite important to report to you. I have been keeping tabs on rumors of named items and combining what I've heard with my personal knowledge and study materials. It was mostly for some idle fun...it certainly beats conversation with most of the brutes in the %companyname%. I didn't expect anything to come of it, until I got to talking with %cartographer% here...%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_45.png[/img][M] Вы как раз пересчитываете припасы, когда врываются %cartographer%, картограф, и %historian%, историк, и наперебой начинают что-то возбуждённо тараторить. Вы рявкаете, чтобы они взяли себя в руки; оба резко умолкают и переглядываются. Помолчав, %historian% начинает: %SPEECH_ON%Сударь, у нас для вас весьма важное известие. Я собирал слухи об именных вещах и сверял услышанное со своими познаниями и записями. Больше от скуки... всё лучше, чем беседовать с большинством увальней из %companyname%. Я и не ждал, что из этого что-то выйдет, пока не разговорился вот с %cartographer%...%SPEECH_OFF%"
    }
    {
        en = "Get to the point."
        ru = "Ближе к делу."
    }
    {
        en = "[img]gfx/ui/events/event_45.png[/img][M] The historian continues. %SPEECH_ON%The mapmaker here has also been keeping notes of landmarks and locations to identify some places of interest for us. The two of us are almost certain that there is something around here housing a famous item.%SPEECH_OFF% The cartographer unfurls a map and the historian jabs a finger to a spot. %SPEECH_ON%It could be anything; a piece of armor, a weapon, maybe even a shield or helm. Sadly my information lacks a proper description of what the item is. I'd stake fifty days of wages that if we cleared the area we would find something incredible though!%SPEECH_OFF% The two men grin broadly. As you examine their papers you muse that obtaining famous items would certainly go far towards boosting the strength and renown of %companyname%."
        ru = "[img]gfx/ui/events/event_45.png[/img][M] Историк продолжает. %SPEECH_ON%Наш картограф тоже отмечал приметные места и урочища, выискивая для нас кое-что любопытное. Мы оба почти уверены: где-то здесь хранится именная вещь.%SPEECH_OFF% Картограф разворачивает карту, а историк тычет пальцем в точку. %SPEECH_ON%Это может быть что угодно: доспех, оружие, а то и щит или шлем. Увы, толкового описания у меня нет. Но я поставлю жалованье за пятьдесят дней, что, зачистив это место, мы найдём нечто невероятное!%SPEECH_OFF% Оба широко улыбаются. Разглядывая их бумаги, вы прикидываете, что именные вещи изрядно прибавили бы %companyname% и силы, и славы."
    }
    {
        en = "What are we waiting for? We go grab it!"
        ru = "Чего ждём? Идём и заберём!"
    }
    {
        // text = "Your cartographer uncovered a location named " + destinationName
        mode = "pattern"
        en = "Your cartographer uncovered a location named <place:str>"
        ru = "Ваш картограф открыл место под названием <place>"
    }
    {
        en = "Your historian has tracked down some kind of famed item to this location"
        ru = "Ваш историк отследил, что здесь хранится какая-то именная вещь"
    }
    // en = "historian"
    // FILE: scripts/events/events/hackflows/lancer_gae_buidhe_event.nut
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] The %companyname% pauses for a brief respite. While you are managing the company's ledgers you see %lancer% the lancer approaching you with a long bundle wrapped in purple silk. He waits for you to make a few final strokes with your quill before speaking. %SPEECH_ON%Greetings, captain. I've been with %companyname% for quite a long while now...enough to hone my skills as spearman, not just as a tournament fighter but as a true combatant.%SPEECH_OFF%You nod. The lancer continues. %SPEECH_ON%The truth is, were it for coin alone, I daresay my abilities before we crossed paths would have allowed me to live comfortably off of my tournament winnings. One of the real reasons why I joined this outfit was to be able to travel across the lands. The truth is, I have been in search of something for years now.%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_82.png[/img][M] %companyname% встаёт на короткий отдых. Пока вы возитесь с отрядными книгами, к вам подходит %lancer%, копейщик, с длинным свёртком в лиловом шёлке. Он дожидается, пока вы допишете строку, и лишь потом говорит. %SPEECH_ON%Приветствую, командир. Я в %companyname% уже немало времени... достаточно, чтобы отточить копьё не только для турниров, но и для настоящего боя.%SPEECH_OFF%Вы киваете. Копейщик продолжает. %SPEECH_ON%По правде, будь дело в одних деньгах, я и до встречи с вами неплохо жил бы на турнирные выигрыши. Я пошёл в отряд, чтобы странствовать по свету. Дело в том, что я уже много лет кое-что ищу.%SPEECH_OFF%"
    }
    {
        en = "Seems to me like you've found what you've been looking for."
        ru = "Сдаётся мне, ты нашёл то, что искал."
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M]As you point out the bundle in %lancer%'s arms, he lets out a chuckle. %SPEECH_ON%No sir, what I have here is but half of the legend, and perhaps the weaker half as well.%SPEECH_OFF%He unfurls the silk wrappings to uncover a brilliant spear. The tip is golden and twinkles faintly in the relative darkness of the tent the two of you are standing in. The shaft is is a royal purple with manuscript pages wrapped about it. You can't tell if it is a trick of the light, but it seems that the text on the manuscripts are constantly changing form, words morphing into new ones before a coherent storyline can be depicted.\n\nYou cannot help but wonder two things: why %lancer% has never shown this treasure nor used it in combat, and what on earth could possibly have diminished the legend of such a weapon."
        ru = "[img]gfx/ui/events/event_82.png[/img][M]Вы киваете на свёрток в руках %lancer%, и тот усмехается. %SPEECH_ON%Нет, сударь, это лишь половина легенды, и, пожалуй, слабейшая.%SPEECH_OFF%Он разворачивает шёлк, и наружу является дивное копьё. Наконечник золотой и слабо мерцает в полумраке шатра, где вы стоите. Древко царственно-лиловое, обвитое страницами рукописей. То ли это игра света, то ли нет, но письмена на них будто без конца меняются: слова перетекают в другие прежде, чем сложатся в связный рассказ.\n\nВы невольно задаётесь двумя вопросами: почему %lancer% ни разу не показывал это сокровище и не брал его в бой — и что на свете могло приглушить славу такого оружия."
    }
    {
        en = "What is the meaning of this?"
        ru = "Что всё это значит?"
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M]You voice all of these questions incredulously. %lancer% turns his gaze to the glowing spear tip before speaking, almost as if to address it instead of you. %SPEECH_ON%This legendary item has been passed down my lineage of tournament lancers for longer than our family ancestry has been recorded. It is named the Gae Buidhe. This spear was forged with a powerful charm...it rewrites fate itself with every thrust, such that it strikes true without fail every single time. The manuscripts bound to it write and rewrite the endings of every warrior. It chronicles my fate and yours, and of every other member of this company. Tis either a great shame or a great blessing that such knowledge of ourselves is locked away from us.%SPEECH_OFF%%lancer% turns his gaze from the tip back to you, his eyes filled with steely focus."
        ru = "[img]gfx/ui/events/event_82.png[/img][M]Вы недоверчиво выкладываете все эти вопросы. %lancer% переводит взгляд на светящийся наконечник и говорит, будто обращаясь к нему, а не к вам. %SPEECH_ON%Эта легендарная вещь передаётся в моём роду турнирных копейщиков дольше, чем ведутся записи о наших предках. Имя ей — Гэ Буйде. Копьё выковано с могучими чарами... каждым ударом оно переписывает саму судьбу, а потому бьёт без промаха. Рукописи, обвивающие древко, пишут и переписывают конец каждого воина. В них судьба моя, ваша и всех до единого в этом отряде. Не знаю, беда это или благо, что такое знание о себе для нас закрыто.%SPEECH_OFF%%lancer% отрывает взгляд от наконечника и смотрит на вас со стальной сосредоточенностью."
    }
    {
        en = "Why reveal this weapon now? Why have you not used it in combat before?"
        ru = "Почему ты показываешь это оружие только сейчас? Почему не брал его в бой раньше?"
    }
    {
        en = "[img]gfx/ui/events/event_82.png[/img][M] %lancer% nods and responds. %SPEECH_ON%Legends tell of a sister spear to the Gae Buidhe...the Gae Dearg. While the Gae Buidhe will never miss, evidently the Gae Dearg has an even stronger curse upon it. I intend to reunite the two sister spears so that they may be drawn back into modern legend.%SPEECH_OFF%The lancer's stares at you with a piercing gaze. %SPEECH_ON%As for why I chose now to show it captain...to rely on magic as a substitute for combat proficiency would bring great shame upon my family name. I am the last fighting man of my line, and I have reasons to believe that an opportunity to obtain the Gae Dearg will present itself soon. Use this item as you see fit, sir. You can certainly rely on me, with or without it.%SPEECH_OFF%%lancer% walks out of the tent. Ordinarily you would brush aside such mystical musings, but as you bring the weapon over towards inventory you decide an omen such as this should not be ignored."
        ru = "[img]gfx/ui/events/event_82.png[/img][M] %lancer% кивает и отвечает. %SPEECH_ON%Легенды говорят о сестре Гэ Буйде — копье Гэ Дерг. Гэ Буйде не знает промаха, а на Гэ Дерг, как сказывают, лежит проклятие ещё сильнее. Я намерен вновь свести сестёр вместе, чтобы они вернулись в живую легенду.%SPEECH_OFF%Копейщик смотрит на вас в упор. %SPEECH_ON%А почему показываю только теперь, командир... полагаться на волшебство вместо воинского умения — великий позор для моего имени. Я последний воин в роду, и у меня есть причины думать, что случай добыть Гэ Дерг скоро представится. Распорядитесь этой вещью как сочтёте нужным, сударь. На меня вы можете положиться и с ней, и без неё.%SPEECH_OFF%%lancer% выходит из шатра. Обычно вы отмахиваетесь от подобной мистики, но, унося оружие к припасам, решаете, что таким предзнаменованием пренебрегать не стоит."
    }
    {
        en = "We should be on the lookout for a chance to obtain the Gae Dearg."
        ru = "Стоит держать ухо востро — вдруг подвернётся случай добыть Гэ Дерг."
    }
    // en = "lancer"
    // FILE: scripts/events/events/hackflows/leper_becomes_famous_event.nut
    {
        en = "[img]gfx/ui/events/event_92.png[/img][M] The renown of the %companyname% has been steadily growing as the exploits of your men have reached ears far and wide. As you make your way through town, you notice the townsfolk pointing at your leper, %leper%, while excitedly whispering amongst themselves. A young man emerges from the throng and approaches him in awe. %SPEECH_ON%Is it true, then? Is this the monster that faced down an orc warlord on his own and sent the whole pack fleeing? The same man that took an axe straight in the shoulder, slew the man who put it there, and finished the battle with it embedded in his body? The one who lost everything to disease before being reborn like a phoenix in the %companyname%?%SPEECH_OFF% %leper%'s normally passive, downtrodden expression curls into a lopsided grin. %SPEECH_ON%Ain't an uglier man in our squad, lad. You're right. It's me. Wrong about the axe though, it was actually a cleaver.%SPEECH_OFF% The man's eyes widen like saucers in awe, and the remaining townsfolk are sent into a frenzy of energetic muttering.\n\n You and your men continue on your business, and you take the opportunity to sneakily side eye the leper. When he first joined the %companyname% he was truly a miserable specimen, cursing fate and sneering maliciously at any passersby that made the mistake of looking at him. Now he stands among your comrades, transformed. His physical appearance remains rather grotesque, but his mentality has undergone a complete turnaround. Indeed, %leper% looks much more stoic. His time in the %companyname% has done him much good, and in turn he continues to raise the renown of the company to new heights."
        ru = "[img]gfx/ui/events/event_92.png[/img][M] Слава %companyname% растёт день ото дня: молва о делах ваших людей разнеслась далеко. Проходя через город, вы замечаете, как горожане показывают на вашего прокажённого, %leper%, и возбуждённо перешёптываются. Из толпы выходит юноша и с благоговением подходит к нему. %SPEECH_ON%Так это правда? Это то самое чудище, что в одиночку вышло против орочьего вождя и обратило всю свору в бегство? Тот самый, кому топор вошёл прямо в плечо, а он убил того, кто его всадил, и достоял бой с топором в теле? Тот, кто потерял всё из-за болезни, а потом возродился, как феникс, в %companyname%?%SPEECH_OFF% Обычно вялое, унылое лицо %leper% кривится в косой ухмылке. %SPEECH_ON%Уродливее меня в отряде никого нет, парень. Верно, это я. Только не топор это был, а тесак.%SPEECH_OFF% Глаза юноши округляются от восторга, а остальные горожане заходятся возбуждённым шёпотом.\n\n Вы с людьми идёте дальше по делам, и вы украдкой поглядываете на прокажённого. Когда он только пришёл в %companyname%, это был поистине жалкий человек: проклинал судьбу и злобно скалился на каждого, кто по неосторожности на него посмотрел. Теперь он стоит среди ваших товарищей — и он совсем другой. Вид его по-прежнему уродлив, но внутри он переменился полностью. %leper% и правда держится куда твёрже. Время в %companyname% пошло ему на пользу, а он, в свой черёд, поднимает славу отряда всё выше."
    }
    {
        en = "Long live %leper% and the %companyname%!"
        ru = "Да здравствует %leper% и %companyname%!"
    }
    {
        en = "Realized that he has become famous across the land"
        ru = "Понял, что прославился на всю округу"
    }
    {
        // text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+20[/color] Resolve"
        mode = "pattern"
        en = "<name:str> gains [color=<c:str>]+20[/color] Resolve"
        ru = "<name> получает [color=<c>]+20[/color] к решимости"
    }
    {
        // text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Max Hitpoints"
        mode = "pattern"
        en = "<name:str> gains [color=<c:str>]+10[/color] Max Hitpoints"
        ru = "<name> получает [color=<c>]+10[/color] к ОЗ"
    }
    {
        // text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4[/color] Max Fatigue"
        mode = "pattern"
        en = "<name:str> gains [color=<c:str>]+4[/color] Max Fatigue"
        ru = "<name> получает [color=<c>]+4[/color] к выносливости"
    }
    {
        // text = _event.m.Leper.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4[/color] Melee Defense"
        mode = "pattern"
        en = "<name:str> gains [color=<c:str>]+4[/color] Melee Defense"
        ru = "<name> получает [color=<c>]+4[/color] к защите в ближнем бою"
    }
    {
        en = "The company has gained renown"
        ru = "Отряд стал известнее"
    }
    // en = "leper"
    // FILE: scripts/events/events/hackflows/leper_gets_sick_event.nut
    {
        en = "[img]gfx/ui/events/event_18.png[/img][M] While on the march, you notice %leper% the leper lagging behind, shoulders sagging and back heaving. It seems that whatever affliction causing the damage to his skin has made him more vulnerable to conventional illnesses as well.\n\n You shake your head in sympathy of your comrade's plight, but make sure to remain at a safe distance. As if on cue, a few moments later %leper% doubles over and his most recent meal makes a surprise reappearance. Fortunately enough, the spray splatters harmlessly on the ground. In a profession filled with more than its fair share of vile odors, dealing with one less stench is in and of itself a blessing."
        ru = "[img]gfx/ui/events/event_18.png[/img][M] На марше вы замечаете, что %leper%, прокажённый, отстаёт: плечи обвисли, спину сводит. Похоже, хворь, что грызёт его кожу, сделала его беззащитным и перед обычными болезнями.\n\n Вы сочувственно качаете головой, но держитесь на безопасном расстоянии. Словно по сигналу, через миг %leper% сгибается пополам, и недавний обед является наружу. По счастью, всё выплёскивается на землю. В ремесле, где мерзких запахов и без того с избытком, одной вонью меньше — уже благословение."
    }
    {
        en = "Gross..."
        ru = "Мерзость..."
    }
    {
        // text = _event.m.Leper.getName() + " is sick"
        mode = "pattern"
        en = "<name:str> is sick"
        ru = "<name> заболел"
    }
    // FILE: scripts/events/events/hackflows/locksmith_unlocks_vault_event.nut
    {
        en = "After the Battle..."
        ru = "После битвы..."
    }
    {
        en = "[M] As your men cut down the last brigand that hasn't already turned tail and fled, you begin to question why the cutthroats even decided to set up a base camp here. As you swivel your head back and forth you spy at least three places not more than a few hundred yards that would have been more defensible. \n\n Your question is answered as your men begin scouring the camp for loot and your locksmith cries out in surprise. %SPEECH_ON%Damn, must be the biggest farkin' door I've ever seen!%SPEECH_OFF% "
        ru = "[M] Когда ваши люди добивают последнего разбойника из тех, кто не успел удрать, вы задумываетесь: с чего вообще головорезы поставили здесь лагерь? Оглядевшись, вы насчитываете по меньшей мере три места в паре сотен шагов отсюда, которые куда легче было бы оборонять. \n\n Ответ приходит сам, когда люди принимаются шарить по лагерю в поисках добычи, а ваш слесарь удивлённо вскрикивает. %SPEECH_ON%Чтоб мне провалиться, в жизни не видал такой здоровенной двери!%SPEECH_OFF% "
    }
    {
        en = "Let's check out what he's found."
        ru = "Посмотрим, что он там нашёл."
    }
    {
        en = "[M] You and your men quickly follow the sound of the locksmith's yell and as you catch up to him your earlier question is answered. Before you is an massive door, over twice your height and wide enough for six burly mend to walk through shoulder to shoulder. It is sunken slightly into the earth and embedded into a solid chunk of rock. \n\n Numerous broken picks and scratches all over the door itself suggests that the brigands you just slew had not long ago been sparing no effort to get inside. %locksmith% seems to read your mind and shoots you a smug grin. %SPEECH_ON%Aye, the door is large. But don't let that fool ya, the keyhole is normal sized. Fucker sure was hard to find, though. No wonder the bandits couldn't find it.%SPEECH_OFF% He points at a small but deliberately placed slit at knee height."
        ru = "[M] Вы с людьми спешите на крик слесаря — и, догнав его, получаете ответ на свой вопрос. Перед вами громадная дверь: больше двух ваших ростов в высоту и такая широкая, что шестеро здоровяков пройдут плечом к плечу. Она чуть утоплена в землю и вделана в цельную скалу. \n\n Обломки отмычек и царапины по всей двери говорят, что убитые вами разбойники ещё недавно из кожи вон лезли, чтобы попасть внутрь. %locksmith% будто читает ваши мысли и самодовольно ухмыляется. %SPEECH_ON%Ага, дверь здоровая. Но пусть вас это не обманет: замочная скважина обычная. Найти её, правда, было мукой мученической. Немудрено, что бандиты не сумели.%SPEECH_OFF% Он указывает на маленькую, но явно неслучайную щель на высоте колена."
    }
    {
        en = "You think you can get it open?"
        ru = "Думаешь, сумеешь открыть?"
    }
    {
        en = "[M] You ask if the locksmith can put his skills to use and get the door open. He laughs and says, %SPEECH_ON%Sure I can do it, cap'n, but I'll need a bit of time. This isn't an average merchant's lockbox or jammed dungeon cell door.%SPEECH_OFF%"
        ru = "[M] Вы спрашиваете, сможет ли слесарь пустить в ход своё умение и вскрыть дверь. Он смеётся: %SPEECH_ON%Отчего ж не смогу, командир, только времени надо. Это тебе не купеческий ларец и не заклинившая дверь в темнице.%SPEECH_OFF%"
    }
    {
        en = "Take your time."
        ru = "Не спеши."
    }
    {
        en = "[img]gfx/ui/events/event_04.png[/img][M] You and the rest of your men leave %locksmith% to his work, taking the opportunity to repair weapons, catch your breaths, and get some food in your bellies. After a couple hours, %locksmith% shouts out in triumph, and you rush over to his voice a second time. \n\n You arrive just in time to see the door sliding to the side by some unseen mechanism to reveal the contents of the vault. %locksmith%'s efforts are rewarded, and how! The two of you stand in awe as you see piles of crowns, and a weapon rack with some armaments in surprisingly good repair. You grab %locksmith%'s hand and shake vigorously, telling him to take a chunk of treasure as the finder's fee and extending heartfelt congratulations."
        ru = "[img]gfx/ui/events/event_04.png[/img][M] Вы с остальными оставляете %locksmith% за работой и пользуетесь случаем починить оружие, отдышаться и набить животы. Через пару часов %locksmith% издаёт торжествующий вопль, и вы во второй раз спешите на его голос. \n\n Вы поспеваете как раз вовремя, чтобы увидеть, как дверь отъезжает в сторону по какому-то незримому устройству, открывая нутро хранилища. Труды %locksmith% вознаграждены, да ещё как! Вы оба замираете при виде груд крон и стойки с оружием на удивление доброй сохранности. Вы жмёте %locksmith% руку, от души поздравляете и велите взять себе часть добра как награду за находку."
    }
    {
        en = "Treasure!"
        ru = "Сокровища!"
    }
    {
        // text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]2,000[/color] Crowns"
        mode = "pattern"
        en = "You gain [color=<c:str>]2,000[/color] Crowns"
        ru = "Вы получаете [color=<c>]2000[/color] крон"
    }
    {
        // text = "You gain " + item1.getName()
        mode = "pattern"
        en = "You gain <item:str>"
        ru = "Вы получаете <item:t>"
    }
    {
        en = "Made excellent use of his past skills to uncover a great treasure"
        ru = "Отменно применил прежнее ремесло и добыл великое сокровище"
    }
    // en = "locksmith"
    // FILE: scripts/events/events/hackflows/painter_and_herbalist_make_dyes_event.nut
    {
        en = "[img]gfx/ui/events/event_55.png[/img][M] As your company pauses briefly to make camp, you spot %painter% the painter and %herbalist% the herbalist together with just about every pot and cauldron the company owns. As you approach to check out what is going on, you are greeted by a swirl of color. %painter% pulls his arms out of a pot, turns around, and beams. %SPEECH_ON%Hey there, captain. Been somewhat of a personal challenge for me to figure out how to make some vibrant colors.%SPEECH_OFF% He reaches out to clap %herbalist% on the back, but sees some dye dripping off his fingers and thinks the better of it. %SPEECH_ON%This man right here's a right genius. This project is as much his as it is mine. I sorted out the color theory, and %herbalist% pulled out the plants from his bag of tricks. I've got plenty of stuff to paint with, now.%SPEECH_OFF% You ask which of the two men will be responsible for scrubbing the cooking pot clean before the next meal. %herbalist% laughs. %SPEECH_ON%Make another fucker do it, cap. We'll pay you off by letting you sell the excess off at the next trading town, and the poor sods on cleaning duty will have their next night at the tavern covered by the two of us.%SPEECH_OFF% %painter% chimes in. %SPEECH_ON%We gotta get this stuff off ourselves anyway. Won't be able to do much besides spread it around in our current state.%SPEECH_OFF% Deciding that they make a fair point, you decide to head back to camp and mull it over."
        ru = "[img]gfx/ui/events/event_55.png[/img][M] Отряд встаёт лагерем, и вы застаёте %painter%, живописца, и %herbalist%, травника, в обществе едва ли не всех котлов и горшков, что есть у отряда. Стоит подойти и посмотреть, в чём дело, как вас встречает буйство красок. %painter% вынимает руки из горшка, оборачивается и сияет. %SPEECH_ON%Здравия, командир. Взялся я тут для себя за задачку: как добыть по-настоящему яркие цвета.%SPEECH_OFF% Он тянется хлопнуть %herbalist% по спине, но, увидев стекающую с пальцев краску, передумывает. %SPEECH_ON%Вот этот человек — сущий гений. Затея наша общая. Я разобрался с цветами, а %herbalist% вытащил нужные травы из своего мешка чудес. Теперь мне есть чем писать.%SPEECH_OFF% Вы спрашиваете, кто из двоих будет отскребать котёл до следующей трапезы. %herbalist% смеётся. %SPEECH_ON%Да заставьте кого-нибудь другого, командир. А мы в расчёте: излишки продадите в ближайшем торговом городе, а тем беднягам, кому выпадет мытьё, мы вдвоём оплатим вечер в таверне.%SPEECH_OFF% %painter% вставляет: %SPEECH_ON%Нам ещё и с себя всё это отмывать. В таком виде мы только развезём грязь, и не более.%SPEECH_OFF% Признав, что довод разумный, вы возвращаетесь в лагерь всё это обдумать."
    }
    {
        en = "Still well worth the mess."
        ru = "Такой кавардак того стоит."
    }
    // en = "painter"
    // FILE: scripts/events/events/hackflows/painter_paints_masterpiece_event.nut
    {
        en = "[img]gfx/ui/events/event_126.png[/img][M] You and your men are on the march when %painter% the painter taps you on the shoulder and asks for a moment of your time. %SPEECH_ON%Been a long time since I was a painter, captain. I won't lie, I was never drawn to the mercenary life for the sake of great treasure or glory in combat. Honestly didn't expect to make it this far without getting my head lopped off in the process.%SPEECH_OFF% He pauses. %SPEECH_ON%I guess I really had something of a deathwish back then. Never been much of the soldiering type, not like my brother was. Broad-shouldered, strong. Always with a smile on his face and a hearty laugh. Popular with the townsfolk, especially the ladies, and filled with a desire to one day see the world. He was meant for such great things, to become a knight, a champion....something. Before he could see the world like he wanted he got trampled in a freak stable accident. It was a miracle that he recovered well enough to walk again, but sure as shite he and I both knew he wasn't ever going to know the world beyond our town.%SPEECH_OFF% He trails off, and the two of you walk in silence for a brief period before he speaks again. %SPEECH_ON%I never told you why I wanted to join a mercenary crew, or why I even wanted to become a painter, did I, captain? Truth is, seeing my brother looking so empty, a prisoner in his own body, I had to make it right somehow. He was a great man, kept my ma safe and the family together when our pa died. Put aside his dreams to provide for our family. All these adventures we've had, the battlefields and sceneries I've seen, I've made a point to send back home for him to see. It's the least a nobody like me could do for a man meant to be somebody.%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_126.png[/img][M] Отряд идёт своей дорогой, когда %painter%, живописец, трогает вас за плечо и просит уделить ему минуту. %SPEECH_ON%Давно я уже не живописец, командир. Врать не стану: в наёмники меня привели не сокровища и не слава в бою. Честно говоря, я и не думал, что зайду так далеко и не лишусь по дороге головы.%SPEECH_OFF% Он умолкает. %SPEECH_ON%Пожалуй, тогда я и впрямь искал смерти. Из меня вояка никакой, не то что из брата. Плечистый, сильный. Вечно с улыбкой и заливистым смехом. Народ его любил, особенно бабы, а сам он мечтал однажды повидать свет. Ему судьба сулила великое: стать рыцарем, чемпионом... кем-то. Но прежде чем он увидел мир, его затоптали лошади в конюшне — нелепая случайность. Чудо, что он вообще снова стал ходить, только мы оба знали как пить дать: мира за околицей ему уже не увидеть.%SPEECH_OFF% Он замолкает, и какое-то время вы идёте молча, пока он не заговаривает снова. %SPEECH_ON%Я ведь так и не сказал вам, командир, почему пошёл к наёмникам и почему вообще стал живописцем? По правде, глядя на брата, такого пустого, пленника собственного тела, я должен был это как-то исправить. Он был славный человек: после смерти отца берёг мать и держал семью вместе. Отложил свои мечты, чтобы нас прокормить. Все наши походы, все поля битв и красоты, что я повидал, я нарочно посылал домой — чтобы он их увидел. Меньшее, что такое ничтожество, как я, могло сделать для человека, которому судьба сулила стать кем-то.%SPEECH_OFF%"
    }
    {
        en = "Why tell me all this now?"
        ru = "Почему ты рассказываешь это сейчас?"
    }
    {
        en = "[img]gfx/ui/events/event_126.png[/img][M] %painter% the painter sighs. %SPEECH_ON%Just got word from his next of kin that my brother's passed on to the next realm. Lucky for him it was peaceful; seems the lucky fucker had a smile on his face at the end. Letter I got says that some of his last words were to thank me, that his life was full, and to wish me to live a life for myself instead of just for him.%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_126.png[/img][M] %painter%, живописец, вздыхает. %SPEECH_ON%Пришла весть от родни: брат отошёл в мир иной. Ему повезло — умер тихо; говорят, счастливчик так и лежал с улыбкой. В письме пишут, что среди последних слов он благодарил меня, говорил, что жизнь его была полна, и желал мне жить для себя, а не только для него.%SPEECH_OFF%"
    }
    {
        en = "Sounds like good advice."
        ru = "Дельный совет, по-моему."
    }
    {
        en = "[img]gfx/ui/events/event_126.png[/img][M] %painter% nods and continues. %SPEECH_ON%Which brings us to why I'm sharing all this with you to begin with. I've been with this company for a damn long time now. Gotten into many tight spots, had more adventure than the rest of my family put together by this point. Even though my brother's gone, I feel that because of what I've achieved, his spirit continues to live within me. That's all thanks to you and the rest of the boys, captain.%SPEECH_OFF% He pulls out a satchel and hands it to you. %SPEECH_ON%Know the role's normally reversed, but I'd been meaning to send my brother a new painting before I heard of his death. Figured since he won't be seeing it, I'd sell the piece and pass a share of the earnings back to the company that made realizing my goals possible. Thought it would be a good time to leave painting behind too, and focus on my new life as a famous mercenary, too!%SPEECH_OFF% The pouch is heavy; part of you thinks that perhaps life would be more lucrative for %painter% if he put down his sword and picked up the brush once again. But one look at his face tells you that perhaps for the first time, he is making decisions for his own sake. Indeed, his battle-hardened expression and proud posture is a jarring juxtaposition to his inexperienced, nervous disposition when you first hired him. You nod respectfully and accept the gift."
        ru = "[img]gfx/ui/events/event_126.png[/img][M] %painter% кивает и продолжает. %SPEECH_ON%К тому я всё это и веду. Я в отряде уже чертовски давно. Побывал в стольких передрягах, что приключений у меня теперь больше, чем у всей моей родни вместе взятой. Брата не стало, но мне кажется, что через всё, чего я достиг, его дух живёт во мне. И всё это благодаря вам и парням, командир.%SPEECH_OFF% Он достаёт кошель и протягивает вам. %SPEECH_ON%Знаю, обычно бывает наоборот, но я как раз собирался послать брату новую картину, когда пришла весть о его смерти. Раз уж он её не увидит, я продал полотно, а долю выручки отдаю отряду, благодаря которому смог добиться своего. Заодно решил, что пора и с живописью проститься — и заняться новой жизнью славного наёмника!%SPEECH_OFF% Кошель тяжёлый; в глубине души вы думаете, что %painter% жилось бы куда сытнее, отложи он меч и возьмись снова за кисть. Но один взгляд на его лицо говорит: похоже, впервые в жизни он решает ради себя. И правда, его обветренное, привыкшее к битвам лицо и гордая осанка ничуть не похожи на неумелого, дёрганого человека, которого вы когда-то наняли. Вы уважительно киваете и принимаете дар."
    }
    {
        en = "I'm honored you shared this story with me."
        ru = "Для меня честь, что ты рассказал мне эту историю."
    }
    {
        en = "Made a hefty sum selling a masterpiece painting"
        ru = "Выручил изрядную сумму за картину-шедевр"
    }
    {
        en = "Shared his life story with the captain"
        ru = "Рассказал командиру историю своей жизни"
    }
    // FILE: scripts/events/events/hackflows/painter_provides_paint_event.nut
    {
        en = "[img]gfx/ui/events/event_128.png[/img][M] You and your company are on the road when %painter% the painter taps your shoulder and asks for a moment. %SPEECH_ON%Hey captain. Last time we stopped by a settlement I was able to get some materials for mixing paints. Had a few friends from back in the day, you see. Might not seem like much, but I managed to mix together some sets in the same colors as our banner. Should be able to paint our shields in company colors now!%SPEECH_OFF% You thank %painter% for his efforts. Gaudy as colors and artwork may be to the average mercenary crew, perhaps the visual unity they would bring to the crew would tigthen the bonds between the brothers over time."
        ru = "[img]gfx/ui/events/event_128.png[/img][M] Отряд в пути, когда %painter%, живописец, трогает вас за плечо и просит минуту. %SPEECH_ON%Слушайте, командир. В прошлом селении я раздобыл кое-что для замеса красок — остались у меня с былых времён знакомцы. Вроде мелочь, а я сумел намешать цвета точь-в-точь как на нашем знамени. Теперь можно расписать щиты в цвета отряда!%SPEECH_OFF% Вы благодарите %painter% за старание. Пусть краски и роспись обычному наёмному сброду кажутся баловством, но общий вид, глядишь, со временем и сплотит братьев."
    }
    {
        en = "Much appreciated."
        ru = "Весьма кстати."
    }
    // FILE: scripts/events/events/hackflows/roofer_aids_construction_effort_event.nut
    {
        en = "[img]gfx/ui/events/event_77.png[/img][M] While near the town of %townname%, your mercenary troop is approached by what appears to be a village elder and some desperate looking peasants. They look harmless enough, so you and your men leave your weapons sheathed and hear them out. The elder is the first to speak. %SPEECH_ON%Good day to you gents. I see that you are a crew of tough men with worldy knowledge about yourselves.%SPEECH_OFF% You tell the man to get to the point. %SPEECH_ON%Situation's like this, sir. One of our storehouse rooves collapsed just this morn. We've no shortage of strong men or timber, but we lack a man with the ability to lay out roof tiles. Perhaps...?%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_77.png[/img][M] Близ города %townname% к вашему отряду подходят, судя по виду, деревенский староста и несколько крестьян с отчаянными лицами. Выглядят они безобидно, так что вы с людьми оставляете оружие в ножнах и выслушиваете их. Первым говорит староста: %SPEECH_ON%Доброго дня, господа. Вижу, вы люди бывалые и в мире кое-что смыслите.%SPEECH_OFF% Вы просите его перейти к делу. %SPEECH_ON%Дело такое, сударь. Нынче утром у нас крыша амбара рухнула. Ни в крепких руках, ни в брёвнах нужды нет, а вот человека, что уложит черепицу, у нас нету. Может, вы...?%SPEECH_OFF%"
    }
    {
        en = "%roofer%, sounds like you're perfect for the job."
        ru = "%roofer%, похоже, это работёнка как раз для тебя."
    }
    {
        en = "[img]gfx/ui/events/event_77.png[/img][M] You nod towards %roofer% the roofer. %SPEECH_ON%Right, captain, suppose if you can spare me I can help the poor sods out.%SPEECH_OFF% The villagers perk up and lead %roofer% off in the direction of the ruined storehouse. \n\n After several hours, %roofer% returns, looking none the worse for the wear and holding a small pouch of crowns. %SPEECH_ON%Couple of younger lads picked up the knowledge damn quick, barely had to lift a finger myself other than to show 'em how to lay out the tiles. Good thing, cause the little squirts could climb up there faster than I could. Paid me well, too. Drinks on me tonight!%SPEECH_OFF%"
        ru = "[img]gfx/ui/events/event_77.png[/img][M] Вы киваете на %roofer%, кровельщика. %SPEECH_ON%Ну что ж, командир, коли я вам сейчас без надобности, помогу бедолагам.%SPEECH_OFF% Селяне оживают и уводят %roofer% к развалившемуся амбару. \n\n Через несколько часов %roofer% возвращается — бодрый, с небольшим кошелём крон в руке. %SPEECH_ON%Пара парней помоложе всё схватили на лету, мне и делать почти ничего не пришлось, только показал, как черепицу класть. Оно и к лучшему: эти мелкие взбирались наверх быстрее меня. Да ещё и заплатили славно. Нынче выпивка за мой счёт!%SPEECH_OFF%"
    }
    // en = "roofer"
    // FILE: scripts/events/events/hackflows/scenario/paladin_commander_intro_event.nut
    {
        en = "[img]gfx/ui/events/event_137.png[/img][M] A cold breeze on the horizon is one of many bad omens. The talk among the town stokes your concerns. War is coming, but it is unclear if it will be one fought between humans or against some other, more sinister threat. Up until this point you have been thoroughly unconcerned with the world at large, instead living contract by contract and spending your spare coin on women or booze. \n\n However, after a night of particularly heavy drinking you awaken to a second consciousness invading your mind, relentlessly commanding you to start a mercenary company, the likes of which the world has never seen. You try to fight it off, but it only speaks of the need for champions to rise up to the challeges humanity will soon face. \n\n You try to drive the damn thing from your mind, but the voice only increases in volume until you finally relent and shout out: %SPEECH_ON%Damn you, I'll fucking do it, just begone!%SPEECH_OFF% The voice is as gone as suddenly as it appeared. You find yourself standing in the town square, with several townsfolk looking upon you with wide and fearful eyes. \n\n A gentle golden glow emnates from your scabbard. You draw your sword only to discover it is not your sword...your old one in any case. The voice returns to whisper just one word before it is gone for the second and final time. %SPEECH_ON%Excalibur...%SPEECH_OFF%It seems that some greater power has plans for you, but for the time being only you can decide what to make of yourself."
        ru = "[img]gfx/ui/events/event_137.png[/img][M] Холодный ветер на окоёме — лишь одна из многих дурных примет. Городские пересуды тревожат вас ещё сильнее. Война близко, но неясно, будет ли это война людей с людьми или с чем-то иным, куда более зловещим. До сих пор судьбы мира вас нисколько не заботили: вы жили от контракта к контракту, спуская лишние монеты на баб и выпивку. \n\n Но после ночи особенно крепкой попойки вы просыпаетесь оттого, что в ваш разум вторгается чужое сознание и неотступно велит собрать отряд наёмников, какого свет ещё не видывал. Вы пытаетесь отбиться, а оно твердит лишь о том, что нужны заступники, готовые встретить испытания, что скоро падут на род людской. \n\n Вы гоните эту дрянь из головы, но голос звучит всё громче, пока вы наконец не сдаётесь и не кричите: %SPEECH_ON%Да чтоб тебя, сделаю я это, только сгинь!%SPEECH_OFF% Голос исчезает так же внезапно, как появился. Вы обнаруживаете себя посреди городской площади, а горожане смотрят на вас круглыми от страха глазами. \n\n Из ножен исходит мягкое золотое сияние. Вы обнажаете меч — и понимаете, что это не ваш меч... во всяком случае, не прежний. Голос возвращается, чтобы шепнуть одно-единственное слово, и умолкает уже навсегда. %SPEECH_ON%Экскалибур...%SPEECH_OFF%Похоже, у некой высшей силы на вас есть виды, но пока лишь вам решать, кем стать."
    }
    {
        en = "I wonder what future awaits me."
        ru = "Любопытно, что за будущее меня ждёт."
    }
    {
        en = "A New Beginning"
        ru = "Новое начало"
    }
    // FILE: scripts/events/events/hackflows/scenario/random_four_intro_event.nut
    {
        en = "[img]gfx/ui/events/event_134.png[/img][M] You aren't sure how the five of you ended up together, and even less sure of why you have been made the leader of the outfit. There is much about even yourself that you do not remember. \n\n You only vaguely recall that the fate of your group holds some grander significance. Until you regain your memory there's no reason not to trust that gut feeling."
        ru = "[img]gfx/ui/events/event_134.png[/img][M] Вы не знаете, как вас пятерых свело вместе, и уж тем более не понимаете, почему главой отряда сделали именно вас. Многого вы не помните даже о себе самом. \n\n Смутно припоминается лишь, что судьба вашей ватаги значит нечто большее. Пока память не вернулась, нет причин не доверять этому чутью."
    }
    {
        en = "I wonder what future awaits us."
        ru = "Любопытно, что за будущее нас ждёт."
    }
    // FILE: scripts/events/events/hackflows/scenario/treasure_hunters_intro_event.nut
    {
        en = "[img]gfx/ui/events/event_04.png[/img][M] You and your current companions have been a squad of treasure hunters for the past few years. Many capable and adventurous spirits have come and gone, either to peaceful retirements with their spoils or to unfortunate ends during the team's various escapades. \n\nAfter a particuarly risky and profitable endeavor, most of the squad was either killed or left with enough treasure to last for their entire lives. As they split off to go their separate ways, the spirit of adventure still remains in the four of you; the historian, the cartographer, the falconer, and of course, yourself. You decide to continue searching for treasure using your established system, but also seek glory as a mercenary company. After all, what is the point of adventuring if no one else hears of your exploits?"
        ru = "[img]gfx/ui/events/event_04.png[/img][M] Вы и ваши нынешние спутники уже несколько лет промышляете охотой за сокровищами. Немало умелых и лихих людей прошло через вашу ватагу: одни ушли на покой с добычей, другие сгинули в очередной вылазке. \n\nПосле особенно опасного и прибыльного дела большая часть отряда либо полегла, либо разжилась добром на всю оставшуюся жизнь. Они разошлись каждый своей дорогой, но в вас четверых — историке, картографе, сокольничем и, само собой, в вас самом — тяга к приключениям не угасла. Вы решаете и дальше искать сокровища по заведённому у вас порядку, но заодно добыть славу наёмного отряда. В конце концов, что толку от приключений, если о них никто не услышит?"
    }
    {
        en = "For treasure and glory!"
        ru = "За сокровища и славу!"
    }
    {
        en = "An End and a Beginning"
        ru = "Конец и начало"
    }
    // FILE: scripts/events/events/hackflows/skirmisher_trains_stealth_event.nut
    {
        // Text = "[img]gfx/ui/events/event_134.png[/img][M] While on the move, you discover %skirmisher% the skirmisher lecturing three other members of your company. It appears that he is trying to give an impromptu lesson on guerilla fighting. %SPEECH_ON%Listen, meatheads, it\'s all about getting as much of the enemy fucker\'s attention as you can. You gotta trick the marksman into thinking you forgot about him, when actually your shield\'s already ready to block.%SPEECH_OFF% %otherBro1% speaks. %SPEECH_ON%How the hell are we supposed to do that without risking catching one of the pointy fucks with our gut?%SPEECH_OFF% %skirmisher% responds: %SPEECH_ON%You have to be quick with your shield arm, simple as that. Only way to avoid being shot is to never be shot at, and even then with all the shite flying around you can never be too sure.%SPEECH_OFF% The discussion continues further, but it seems that eventually some of your men pick up some techniques for dodging ranged attacks.",
        mode = "pattern"
        en = "[img]gfx/ui/events/event_134.png[/img][M] While on the move, you discover %skirmisher% the skirmisher lecturing three other members of your company. It appears that he is trying to give an impromptu lesson on guerilla fighting. %SPEECH_ON%Listen, meatheads, it's all about getting as much of the enemy fucker's attention as you can. You gotta trick the marksman into thinking you forgot about him, when actually your shield's already ready to block.%SPEECH_OFF% %otherBro1% speaks. %SPEECH_ON%How the hell are we supposed to do that without risking catching one of the pointy fucks with our gut?%SPEECH_OFF% %skirmisher% responds: %SPEECH_ON%You have to be quick with your shield arm, simple as that. Only way to avoid being shot is to never be shot at, and even then with all the shite flying around you can never be too sure.%SPEECH_OFF% The discussion continues further, but it seems that eventually some of your men pick up some techniques for dodging ranged attacks."
        ru = "[img]gfx/ui/events/event_134.png[/img][M] На марше вы застаёте %skirmisher%, застрельщика, за поучениями трёх других бойцов отряда. Похоже, он на ходу устроил урок партизанской драки. %SPEECH_ON%Слушайте сюда, тупицы: главное — оттянуть на себя как можно больше вражьего внимания. Надо обмануть стрелка, чтоб он думал, будто ты про него забыл, а у самого щит уже наготове.%SPEECH_OFF% Подаёт голос %otherBro1%: %SPEECH_ON%И как это, чёрт возьми, делать, чтоб не поймать пузом одну из этих острых штук?%SPEECH_OFF% %skirmisher% отвечает: %SPEECH_ON%Рука со щитом должна быть быстрой, вот и всё. Единственный способ не поймать стрелу — не подставляться под выстрел, да и то при этакой куче железа в воздухе зарекаться нельзя.%SPEECH_OFF% Разговор идёт и дальше, и, похоже, кое-кто из ваших людей всё-таки перенимает пару приёмов, как уходить от стрел."
    }
    {
        en = "Nice work."
        ru = "Хорошая работа."
    }
    {
        en = "Taught some brothers to dodge arrows."
        ru = "Научил братьев уворачиваться от стрел."
    }
    {
        // text = _event.m.OtherBro1.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+6[/color] Ranged Defense"
        mode = "pattern"
        en = "<name:str> gains [color=<c:str>]+6[/color] Ranged Defense"
        ru = "<name> получает [color=<c>]+6[/color] к защите в дальнем бою"
    }
    // en = "skirmisher"
    // FILE: scripts/events/events/hackflows/surgeon_cures_temporary_injury_event.nut
    {
        // Text = "[img]gfx/ui/events/event_34.png[/img][M] Knowing that %injuredbro% had suffered an injury recently, during a free moment you move to check up on him. After all, sometimes just letting a brother know that the captain is concerned about them is enough to raise their morale. However, you discover the man laughing genially with a friendly arm wrapped around %surgeon% the surgeon\'s shoulder, looking almost no worse for the wear. He looks up to you and happily says, %SPEECH_ON%Sir, the day you hired this man right here is the day %companyname% the divines were smiling upon us. Almost magic, what he pulled off. Not even sure what happened myself.%SPEECH_OFF% He points at the surgeon with his other hand. The surgeon simply cracks a small smile.%SPEECH_ON%The men in this world are made out of some tough stuff. %injuredbro% would have recovered just fine in due time...I just helped speed up the process a little.%SPEECH_ON%You return to your other duties, making note of the positive impact the surgeon has had on the company.",
        mode = "pattern"
        en = "[img]gfx/ui/events/event_34.png[/img][M] Knowing that %injuredbro% had suffered an injury recently, during a free moment you move to check up on him. After all, sometimes just letting a brother know that the captain is concerned about them is enough to raise their morale. However, you discover the man laughing genially with a friendly arm wrapped around %surgeon% the surgeon's shoulder, looking almost no worse for the wear. He looks up to you and happily says, %SPEECH_ON%Sir, the day you hired this man right here is the day %companyname% the divines were smiling upon us. Almost magic, what he pulled off. Not even sure what happened myself.%SPEECH_OFF% He points at the surgeon with his other hand. The surgeon simply cracks a small smile.%SPEECH_ON%The men in this world are made out of some tough stuff. %injuredbro% would have recovered just fine in due time...I just helped speed up the process a little.%SPEECH_ON%You return to your other duties, making note of the positive impact the surgeon has had on the company."
        ru = "[img]gfx/ui/events/event_34.png[/img][M] Помня, что %injuredbro% недавно был ранен, вы в свободную минуту идёте его проведать: порой довольно и того, чтобы брат знал, что командиру не всё равно. Но вы застаёте его добродушно хохочущим, с рукой на плече %surgeon%, хирурга, и на вид почти целым. Он поднимает на вас глаза и радостно говорит: %SPEECH_ON%Сударь, в тот день, когда вы наняли вот этого человека, боги улыбнулись %companyname%. Он же чудо сотворил. Я и сам толком не понял, что было.%SPEECH_OFF% Свободной рукой он указывает на хирурга. Тот лишь чуть заметно улыбается. %SPEECH_ON%Люди в этом мире сделаны из крепкого теста. %injuredbro% и сам бы со временем оклемался... я лишь малость поторопил дело.%SPEECH_ON%Вы возвращаетесь к своим делам, отметив про себя, как хирург пошёл отряду на пользу."
    }
    {
        en = "We are lucky to have a surgeon with us."
        ru = "Нам повезло, что с нами хирург."
    }
    {
        // text = _event.m.InjuredBro.getName() + " no longer suffers from " + injury.getNameOnly()
        mode = "pattern"
        en = "<name:str> no longer suffers from <injury:str>"
        ru = "<name> избавился от травмы <injury:t>"
    }
    {
        en = "Helped cure a wound using his expertise as a surgeon"
        ru = "Залечил рану своим лекарским умением"
    }
    // en = "injuredbro"
    // FILE: scripts/events/events/hackflows/tailor_crafts_masterwork_armor_event.nut
    {
        en = "[img]gfx/ui/events/event_41.png[/img][M] While the company is on the march, %tailor% the tailor draws up alongside you. He smiles and speaks. %SPEECH_ON%Hey captain. I noticed that we've been lugging around some of those direwolf hides since the last time we fought some of the relentless fuckers. How crazy would it be if we used the skins of our slain enemies to block some hits from the next unlucky sons o' bitches we met out there on the battlefield? I have some basic materials for the armor on hand. If you can spare me some crowns to cover the costs and, of course, the pelts, I reckon I could make us a damn fine set of leather armor.%SPEECH_OFF% He looks at you with an excited sparkle in his eye. If you reject him now, he likely won't bring it up again, so you decide to carefully weigh the pros and cons of entertaining him on this little project."
        ru = "[img]gfx/ui/events/event_41.png[/img][M] Отряд идёт своей дорогой, когда %tailor%, портной, пристраивается рядом. Он улыбается и говорит: %SPEECH_ON%Слушайте, командир. Я приметил, что мы с прошлой драки с этими неугомонными тварями таскаем шкуры лютоволков. А что, если пустить шкуры убитых врагов на то, чтобы держать удары следующих несчастных сукиных детей, какие нам попадутся? Кое-что для доспеха у меня есть. Дайте крон на расходы да, само собой, шкуры — и, сдаётся мне, выйдет отменный кожаный доспех.%SPEECH_OFF% В его глазах горит азарт. Откажи вы сейчас — он, скорее всего, больше об этом не заговорит, так что вы решаете как следует взвесить всё за и против."
    }
    {
        en = "You can have the pelts, and here are the crowns. Get to work."
        ru = "Шкуры твои, вот кроны. Берись за дело."
    }
    {
        en = "Forget your tailoring ways and focus on being a sellsword."
        ru = "Забудь своё шитьё и займись ремеслом наёмника."
    }
    {
        en = "[img]gfx/ui/events/event_41.png[/img][M] What's the harm in letting %tailor% try his hand at his old craft? It isn't like you were planning on using those wolf pelts anytime soon anyhow. Furthermore, they are cluttering up valuable inventory space that could be used for storing other loot and materials. You give him the nod and he excitedly scampers off toward the supply wagons. \n\n Awhile later, he returns and presents to you his masterpiece. It is surprisingly well made and exceptionally light considering its durability. A wolf head is draped around the shoulders, a truly grotesque sight that is sure to intimidate foes of the %companyname%. You clap the tailor on the back and praise him for a job well done!"
        ru = "[img]gfx/ui/events/event_41.png[/img][M] А что дурного в том, чтобы дать %tailor% тряхнуть стариной? Пускать волчьи шкуры в дело вы всё равно в ближайшее время не собирались. Да и место в обозе они занимают, а его можно отдать под другую добычу и припасы. Вы киваете, и он радостно спешит к обозным телегам. \n\n Спустя время он возвращается и являет вам своё творение. Работа на удивление ладная, а доспех, при его прочности, необычайно лёгок. Через плечи переброшена волчья голова — зрелище поистине жуткое, врагам %companyname% явно не по себе станет. Вы хлопаете портного по спине и хвалите за отличную работу!"
    }
    {
        en = "I'll be damned, but this really is a fine piece of light armor."
        ru = "Чтоб мне провалиться, отличный лёгкий доспех."
    }
    {
        // item.m.Name = _event.m.Tailor.getNameOnly() + "\'s Masterwork Armor";
        mode = "pattern"
        en = "<name:str>'s Masterwork Armor"
        ru = "Идеальный доспех от <name>"
    }
    {
        en = "Crafted a suit of light armor of exceptional quality"
        ru = "Сшил лёгкий доспех исключительного качества"
    }
    // en = "tailor"
    // FILE: scripts/events/events/hackflows/tailor_cures_clumsy_event.nut
    {
        en = "[img]gfx/ui/events/event_13.png[/img][M] The %companyname% is on the march. For a band of killers for hire, things are quiet...almost too quiet. Then you realize that you can no longer hear the characteristic clanking of %clumsybro%'s gear as he drops his weapon for the umpteenth fucking time.\n\n As it turns out, %tailor% the tailor has been training the clumsy oaf with a devastatingly simple technique. %clumsybro% now keeps a scrap of purple cloth wrapped tightly around his dominant hand and the grip of his sword. This alone seems to have been enough to allow %clumsybro% to swing his weapon with as much competence as any average man. He still trips over his own two feet occassionally, but at list his sword swings should be less haphazard from here on out."
        ru = "[img]gfx/ui/events/event_13.png[/img][M] %companyname% в пути. Для ватаги наёмных убийц вокруг тихо... пожалуй, даже слишком тихо. И тут вы понимаете, что больше не слышите привычного лязга, с каким %clumsybro% в сотый раз роняет оружие.\n\n Оказывается, %tailor%, портной, натаскал этого увальня приёмом до смешного простым. Теперь %clumsybro% туго обматывает лоскутом лиловой ткани рабочую руку вместе с рукоятью меча. Одного этого хватило, чтобы %clumsybro% замахивался не хуже любого обычного человека. Спотыкаться на ровном месте он иногда не перестал, но хотя бы удары его теперь пойдут поаккуратнее."
    }
    {
        en = "Almost sounds too good to be true."
        ru = "Звучит слишком хорошо, чтобы быть правдой."
    }
    {
        // text = _event.m.ClumsyBro.getName() + " is no longer clumsy"
        mode = "pattern"
        en = "<name:str> is no longer clumsy"
        ru = "<name> больше не неуклюжий"
    }
    {
        en = "Used some spare cloth and a neat mental trick to improve a fellow brother"
        ru = "Лоскутом ткани и ловкой хитростью выправил брата по оружию"
    }
    {
        en = "No longer as hindered by clumsiness as he was before"
        ru = "Неуклюжесть больше так ему не мешает"
    }
    // en = "clumsybro"
    // FILE: scripts/events/events/hackflows/torturer_bestows_bloodthirsty_event.nut
    {
        en = "[img]gfx/ui/events/event_81.png[/img][M] You didn't expect it when %torturer% the torturer joined the company, but it turns out the man is actually quite the talkative type. Evidently chatting genially with his victims was one of %torturer%'s unorthodox ways of keeping the job fresh.\n\n Now the chatterbox is sharing tales of pulling fingernails, breaking bones, and slicing flesh as if he were a drifter describing encounters with passersby on the road. Amazingly enough, the man has garnered somewhat of a fan club, with %otherbro1%, %otherbro2%, and %otherbro3% listening in with growing malicious glee. It seems that your comrades have gotten much more bloodthirsty as of late. You hope that their increased predilection for brutality will translate to fiercer and more efficient combat out on the battlefield."
        ru = "[img]gfx/ui/events/event_81.png[/img][M] Когда %torturer%, палач-заплечник, пришёл в отряд, вы такого не ждали, но человек оказался изрядно словоохотливым. Судя по всему, добродушная болтовня с жертвами была одним из тех необычных способов, какими %torturer% не давал работе наскучить.\n\n Теперь этот говорун травит байки о вырванных ногтях, переломанных костях и вспоротой плоти так, будто он бродяга, вспоминающий встречных на дороге. И, что удивительно, у него завелись поклонники: %otherbro1%, %otherbro2% и %otherbro3% слушают со всё большим злорадным удовольствием. Похоже, ваши товарищи в последнее время стали куда кровожаднее. Остаётся надеяться, что их тяга к зверству обернётся на поле боя большей яростью и толком."
    }
    {
        en = "Looks like our outfit just got a lot more bloodthirsty."
        ru = "Похоже, наш отряд заметно озверел."
    }
    {
        // text = _event.m.OtherBro1.getName() + " is now bloodthirsty"
        mode = "pattern"
        en = "<name:str> is now bloodthirsty"
        ru = "<name> теперь кровожадный"
    }
    // en = "torturer"
    // FILE: scripts/events/events/hackflows/torturer_removes_craven_event.nut
    {
        en = "During a Spare Moment..."
        ru = "На досуге..."
    }
    {
        en = "[img]gfx/ui/events/event_64.png[/img][M] During the monotonous march to the company's next great adventure, you pass within earshot of %torturer% and %cravenbro%. You internally raise an eyebrow, as the torturer has always been chatty about his previous occupation and %cravenbro% has been afraid of his own damn shadow for about as long as you can remember. %cravenbro% has frequently not-so-subtly avoided marching in line with %torturer%.\n\n You imagine that %cravenbro% would be cringing at whatever gruesome tales that the torturer had to tell, but instead you see the man rather cheerfully listening to his companion."
        ru = "[img]gfx/ui/events/event_64.png[/img][M] Во время нудного перехода к очередному великому приключению вы проходите так, что слышите %torturer% и %cravenbro%. Про себя вы удивлённо поднимаете бровь: заплечник всегда охотно болтал о прежнем ремесле, а %cravenbro%, сколько вы его помните, боится собственной тени. %cravenbro% и раньше не слишком-то скрытно избегал идти в строю рядом с %torturer%.\n\n Вы ждёте, что %cravenbro% будет морщиться от любой жуткой байки, но вместо этого видите, как тот вполне бодро слушает собеседника."
    }
    {
        en = "Let's listen in on the conversation..."
        ru = "Послушаем, о чём они..."
    }
    {
        en = "[M]%SPEECH_ON%So you see, %cravenbro%, the tales I tell are of breaking downright stout-hearted men. Knights that wouldn't bat an eyelash at cutting down wee lads and fair lasses for their lords, spies indoctrinated with crazy patriotism for their noble houses, sellswords who've seen all of that and then some. Truth is most men are rather pathetic sods, and even draggin' them before the table is enough to set 'em howling that they'll submit.%SPEECH_OFF% The torturer shakes his head. %SPEECH_ON%Takes the fun out of it, I say. Anyhow, %cravenbro%, just standing out on the battlefield facing down the shite we face for coin means you got more guts than plenty of men I've carved open in the past. We can prove it later if you like.%SPEECH_OFF% At this, %torturer% grins as %cravenbro%'s expression briefly distorts into horror before realizing the joke and belting out a heartier guffaw than normal. As you fall back into line, it seems that the praise from the torturer was not wasted on %cravenbro%. The man's eyes now demonstrate a glint of determination instead of pathetic timidity. His movements become filled with purpose, with his back much straighter and knees much higher as he continues the march with renewed vigor. It seems incredible to you, but you begin to wonder how %cravenbro% will perform in the next battle."
        ru = "[M]%SPEECH_ON%Понимаешь, %cravenbro%, байки-то мои о том, как ломают по-настоящему крепких людей. Рыцарей, что и глазом не моргнут, рубя по приказу господина мальцов и девиц; лазутчиков, оболваненных бешеной верностью своим домам; наёмников, повидавших всё это и побольше. А по правде, большинство людишек — жалкие тряпки: иных довольно подтащить к столу, как они уже воют, что во всём сознаются.%SPEECH_OFF% Заплечник качает головой. %SPEECH_ON%Всё удовольствие портят, скажу я тебе. Да и вообще, %cravenbro%: уже то, что ты за деньги выходишь на поле и смотришь в глаза всей той дряни, что нам попадается, значит, что смелости в тебе больше, чем в куче тех, кого я вскрывал. Хочешь — потом проверим.%SPEECH_OFF% На этих словах %torturer% скалится, лицо %cravenbro% на миг перекашивает от ужаса, но затем он понимает шутку и гогочет громче обычного. Возвращаясь в строй, вы видите: похвала заплечника не пропала для %cravenbro% даром. В глазах у него теперь блеск решимости вместо жалкой робости. Движения полны смысла, спина куда прямее, шаг выше — он идёт с новыми силами. Вам самому не верится, но вы уже задумываетесь, как %cravenbro% покажет себя в следующем бою."
    }
    {
        en = "To think the cowardly bastard needed a pep talk from the fucking torturer of all people."
        ru = "Подумать только: трусливому ублюдку понадобилось напутствие от заплечника — из всех людей!"
    }
    {
        // text = _event.m.CravenBro.getName() + " is no longer craven"
        mode = "pattern"
        en = "<name:str> is no longer craven"
        ru = "<name> больше не трус"
    }
    {
        en = "Used his past to give a nice pep talk"
        ru = "Прошлое ремесло помогло ему приободрить товарища"
    }
    {
        en = "Got over his squeamishness of combat"
        ru = "Переборол свой страх перед боем"
    }
    // en = "cravenbro"
    // FILE: scripts/events/events/hackflows/torturer_removes_fainthearted_event.nut
    {
        en = "[img]gfx/ui/events/event_64.png[/img][M] During the monotonous march to the company's next great adventure, you pass within earshot of %torturer% and %faintheartedbro%. You internally raise an eyebrow, as the torturer has always been chatty about his previous occupation and %faintheartedbro% has been quite faint of heart ever since he joined the company. %faintheartedbro% has frequently not-so-subtly avoided marching in line with %torturer% before.\n\n You imagine that %faintheartedbro% would be cringing at whatever gruesome tales that the torturer had to tell, but instead you see the man rather cheerfully listening to his companion."
        ru = "[img]gfx/ui/events/event_64.png[/img][M] Во время нудного перехода к очередному великому приключению вы проходите так, что слышите %torturer% и %faintheartedbro%. Про себя вы удивлённо поднимаете бровь: заплечник всегда охотно болтал о прежнем ремесле, а %faintheartedbro% с самого прихода в отряд слывёт робким. %faintheartedbro% и раньше не слишком-то скрытно избегал идти в строю рядом с %torturer%.\n\n Вы ждёте, что %faintheartedbro% будет морщиться от любой жуткой байки, но вместо этого видите, как тот вполне бодро слушает собеседника."
    }
    {
        en = "[M]%SPEECH_ON%So you see, %faintheartedbro%, the tales I tell are of breaking downright stout-hearted men. Knights that wouldn't bat an eyelash at cutting down wee lads and fair lasses for their lords, spies indoctrinated with crazy patriotism for their noble houses, sellswords who've seen all of that and then some. Truth is most men are rather pathetic sods, and even draggin' them before the table is enough to set 'em howling that they'll submit.%SPEECH_OFF% The torturer shakes his head. %SPEECH_ON%Takes the fun out of it, I say. Anyhow, %faintheartedbro%, just standing out on the battlefield facing down the shite we face for coin means you got more guts than plenty of men I've carved open in the past. We can prove it later if you like.%SPEECH_OFF% At this, %torturer% grins as %faintheartedbro%'s expression briefly distorts into horror before realizing the joke and belting out a heartier guffaw than normal. As you fall back into line, it seems that the encouragement from the torturer was not lost on %faintheartedbro%. His march is with renewed purpose, his back a little straighter. You hope that this turn in attitude will carry over to the battlefield."
        ru = "[M]%SPEECH_ON%Понимаешь, %faintheartedbro%, байки-то мои о том, как ломают по-настоящему крепких людей. Рыцарей, что и глазом не моргнут, рубя по приказу господина мальцов и девиц; лазутчиков, оболваненных бешеной верностью своим домам; наёмников, повидавших всё это и побольше. А по правде, большинство людишек — жалкие тряпки: иных довольно подтащить к столу, как они уже воют, что во всём сознаются.%SPEECH_OFF% Заплечник качает головой. %SPEECH_ON%Всё удовольствие портят, скажу я тебе. Да и вообще, %faintheartedbro%: уже то, что ты за деньги выходишь на поле и смотришь в глаза всей той дряни, что нам попадается, значит, что смелости в тебе больше, чем в куче тех, кого я вскрывал. Хочешь — потом проверим.%SPEECH_OFF% На этих словах %torturer% скалится, лицо %faintheartedbro% на миг перекашивает от ужаса, но затем он понимает шутку и гогочет громче обычного. Возвращаясь в строй, вы видите: ободрение заплечника не прошло для %faintheartedbro% даром. Он шагает с новым смыслом, спина чуть прямее. Остаётся надеяться, что эта перемена скажется и на поле боя."
    }
    {
        en = "Looks like the scaredy cat's got some guts now."
        ru = "Похоже, у нашего трусишки прибавилось духу."
    }
    {
        // text = _event.m.FaintheartedBro.getName() + " is no longer fainthearted"
        mode = "pattern"
        en = "<name:str> is no longer fainthearted"
        ru = "<name> больше не робкий"
    }
    // en = "faintheartedbro"
    // FILE: scripts/events/events/hackflows/town_watchman_improves_scouting_event.nut
    {
        en = "[img]gfx/ui/events/event_90.png[/img][M] While on the move, %townwatchman% the town watchman taps your shoulder to get your attention. He speaks. %SPEECH_ON%Captain, when you hired me you knew I had been a town watchman. You never questioned why I suddenly wanted to become a mercenary.%SPEECH_OFF% Sensing that the man was going to say more, you simply remain silent and nod at him. %SPEECH_ON%Truth of the matter is, life of a watchman is pretty easy. You rarely actually need to be on the front lines. Hell, if you come from a bigger town, most of the time all you need to be able to do is sound the alarm. Still, around town you were treated as one of the milita, one of the brave souls trusted to keep the townsfolk safe. \n\n ...Which brings me back to what I was meaning to say. Dumb fuck like me, had a bit much to drink after a local holiday. Should have let my partner take my shift for the night, but didn't let him. By the time I noticed the danger and sounded the alarm the fucking bandits were already in, looting and pillaging.%SPEECH_OFF% %townwatchman%'s eyes well up with tears for the first time since you hired him. %SPEECH_ON%All of my fellow militiamen, my friends, who time and again had surged forth to defend our hometown at my call...they fought bravely, but many didn't have time to put on all their armor.%SPEECH_OFF% He trails off, and for a time the two of you march side by side in silence.%SPEECH_ON%They died because of me, captain. Obviously I could not show my face at home ever again, but I made a vow that whatever mercenary company I joined with would not meet their end by ambush...not on my watch. \n\n It was difficult to hone my observation on the move. On town watch duty the environment was always the same, you see. But now that I've gotten used to mercenary life, you'll see that day or night, any slimy fuck will have a hard time sneaking about while I'm around.%SPEECH_OFF% %townwatchman% straightens his back defiantly. You guess that he has been seeking atonement for his past ever since he joined the company and give him a friendly pat on the back, and soon the two of you settle back into the marching line."
        ru = "[img]gfx/ui/events/event_90.png[/img][M] На марше %townwatchman%, городской стражник, трогает вас за плечо. Он говорит: %SPEECH_ON%Командир, вы знали, кем я был, когда нанимали меня, — городским стражником. И ни разу не спросили, с чего вдруг я подался в наёмники.%SPEECH_OFF% Чувствуя, что он скажет больше, вы молча киваете. %SPEECH_ON%По правде, жизнь стражника лёгкая. В первый ряд лезть почти не надо. Да что там, в городе побольше от тебя чаще всего требуется одно — поднять тревогу. И всё же в городе тебя считали своим, из ополчения, из тех смельчаков, кому доверили беречь горожан. \n\n ...К тому и веду. Дурень я этакий, перебрал после местного праздника. Надо было отдать ночную смену напарнику, а я не дал. Пока я заметил беду и поднял тревогу, бандиты уже были внутри и грабили вовсю.%SPEECH_OFF% Глаза %townwatchman% впервые с найма наполняются слезами. %SPEECH_ON%Все мои товарищи-ополченцы, мои друзья, что раз за разом по моему зову бросались защищать родной город... дрались они храбро, только многие не успели надеть доспех.%SPEECH_OFF% Он умолкает, и какое-то время вы идёте бок о бок в тишине. %SPEECH_ON%Они погибли из-за меня, командир. Домой мне, ясное дело, дороги больше нет, но я дал зарок: в каком бы отряде наёмников я ни оказался, из засады его не перебьют... не на моём дежурстве. \n\n Наловчиться высматривать на ходу было непросто: в городской страже округа всегда одна и та же. Но теперь, когда я обвыкся с наёмной жизнью, сами увидите: хоть днём, хоть ночью ни одна скользкая тварь незаметно не подберётся, пока я рядом.%SPEECH_OFF% %townwatchman% упрямо расправляет плечи. Вы понимаете, что он с самого прихода в отряд искал искупления, дружески хлопаете его по спине, и вскоре вы оба возвращаетесь в колонну."
    }
    {
        en = "I wish you luck, and thank you."
        ru = "Удачи тебе. И спасибо."
    }
    {
        en = "Improved the sight capabilities of the company"
        ru = "Отряд стал видеть дальше"
    }
    {
        en = "Had a meaningful talk with the captain"
        ru = "Поговорил с командиром по душам"
    }
    {
        en = "Your company can now see further when moving about on the overworld"
        ru = "Теперь ваш отряд видит дальше при передвижении по карте"
    }
    // en = "townwatchman"
    // FILE: scripts/scenarios/world/hackflows/treasure_hunters_scenario.nut
    {
        en = "the Brain"
        ru = "Мозг"
    }
    {
        en = "the Eyes"
        ru = "Глаза"
    }
    {
        en = "the Heart"
        ru = "Сердце"
    }
    // FILE: scripts/skills/backgrounds/hackflows/arbalester_background.nut
    {
        en = "Arbalester"
        ru = "Арбалетчик"
    }
    {
        en = "Arbalesters have served as professional crossbowmen at some point in their lives."
        ru = "Арбалетчики служили профессиональными стрелками из арбалета в прошлом."
    }
    {
        en = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he'd wasted all his money and he laughed. He said he'd purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two."
        ru = ""
    }
    {
        en = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger."
        ru = ""
    }
    {
        en = "the Arbalester"
        ru = "Арбалетчик"
    }
    {
        en = "the Crossbowman"
        ru = "Стрелок"
    }
    {
        en = "the Sniper"
        ru = "Снайпер"
    }
    {
        en = "the Precise"
        ru = "Меткий"
    }
    {
        en = "{%name%'s father was a bowyer of significant repute, as far as lowly bowmakers could go. In his youth, %name% never doubted that one day he would take up the craft to continue the family's legacy. Sadly, this future was not be. His father was brutally murdered by a nobleman, who upon discovering the superior quality of his order, sought to keep a similar weapon out of his enemy's hands. Seeking revenge, %name% took up the crossbow, swearing an oath that one day he would humiliate the offender by ending him with a crossbow bolt between the eyes. He returns your gaze with a fiery expression, stating that he would never fulfill this aim by keeping watch atop fortress battlements. You silently agree.}"
        ru = "{Отец %name% был известным мастером-лучником, насколько вообще могли быть известны простые изготовители луков. В юности %name% не сомневался, что однажды продолжит семейное дело. Увы, этому не суждено было сбыться. Его отца жестоко убил дворянин, который, обнаружив превосходное качество своего заказа, решил не допустить появления подобного оружия у врагов. Жаждая мести, %name% взял в руки арбалет, поклявшись однажды унизить обидчика, всадив ему болт между глаз. Он смотрит на тебя пылающим взором, заявляя, что никогда не достигнет этой цели, сторожа на крепостных стенах. Ты молча соглашаешься.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/atilliator_background.nut
    {
        en = "Atilliator"
        ru = "Оружейник"
    }
    {
        en = "Atilliators tend to have some knowledge about how to use the ranged weaponry they used to craft."
        ru = ""
    }
    {
        en = "While at a jousting tournament, a young boy was using an oddly shaped, yet perfectly crafted bow. His aiming hand was shaky, yet the arrows did not wobble upon being loosed. After he won the competition, you inquired about where the boy had gotten such an incredible bow. He stated that a bowyer by the name of %name% had crafted it. Apparently, he's known for making the finest bows in all the land!"
        ru = ""
    }
    {
        en = "After you left the %companyname%, you sent a letter inquiring about the status of %name% the bowyer. You got word that he had discovered a way to craft the finest bow possible and, instead of giving this secret to the company, he departed to start his own business. He did not get far: whatever he had learned about his trade died with him on a muddy road out {north | south | west | east} of here, his body ironically skewered with what is said to have been a dozen arrows."
        ru = ""
    }
    {
        en = "the Crossbow Crafter"
        ru = "Самострелодел"
    }
    {
        en = "the Atilliator"
        ru = "Самострельщик"
    }
    {
        en = "the Crafter"
        ru = "Ремесленник"
    }
    {
        en = "the Patient"
        ru = "Терпеливый"
    }
    {
        en = "{With deft fingers and a gift for linking together machinery, %name% actually began his career as an architect for siege engines. However, after his lord's castle was assailed by catapaults and trebuchets of %name%'s own design, %name% was forced to flee for his life and undergo a hasty career change. Fortunately for him his gift with machines applies just as well to crossbows as it does rockslingers. Having recently caught wind that his original lord has been on the hunt for him, %name% now seeks a more mobile occupation.}"
        ru = "{Благодаря ловким рукам и таланту к механизмам, %name% начал карьеру как строитель осадных орудий. Однако после того, как замок его лорда был разрушен катапультами и требушетами собственной конструкции %name%, ему пришлось спасаться бегством и спешно менять профессию. К счастью, его дар к механизмам оказался столь же полезен для арбалетов, как и для камнемётов. Недавно прослышав, что его бывший лорд начал охоту за ним, %name% теперь ищет более подвижную работу.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/barkeep_background.nut
    {
        en = "Barkeep"
        ru = "Трактирщик"
    }
    {
        en = "Barkeeps have some brawling experience from breaking up fights at the taverns they work in."
        ru = "Трактирщики имеют опыт в драках, ведь им часто приходится разнимать потасовки в своих заведениях."
    }
    {
        en = "the Bartender"
        ru = "Бармен"
    }
    {
        en = "the Barkeep"
        ru = "Трактирщик"
    }
    {
        en = "the Brewer"
        ru = "Самогонщик"
    }
    {
        en = "the Burly"
        ru = "Здоровяк"
    }
    {
        en = "the Tapmaster"
        ru = "Разливала"
    }
    {
        en = "the Hopper"
        ru = "Хмельной"
    }
    {
        en = "the Beer Brewer"
        ru = "Пивовар"
    }
    {
        en = "{A lifetime in the tavern has shaped %name% the barkeep into a hardy, burly, muscular man. In troubled times, %name% often had had to 'resolve disagreements', 'escort patrons to the door', or 'ensure that customers paid fairly' on his own. Having heard his share of tales of heroic deeds, violent clashes, and exciting treasure hunts, %name% is more than ready to see the wide world for himself. He has a solid build; he might make a name for himself yet!"
        ru = "{Годы работы в таверне превратили трактирщика %name% в крепкого, коренастого мужика. В неспокойные времена %name% частенько приходилось 'улаживать разногласия', 'провожать гостей до дверей' и 'следить за честной оплатой' своими силами. Наслушавшись историй о подвигах, жестоких схватках и поисках сокровищ, %name% готов сам повидать большой мир. У него крепкое телосложение - глядишь, и прославится!"
    }
    // FILE: scripts/skills/backgrounds/hackflows/berserker_background.nut
    {
        en = "Berserker"
        ru = "Берсерк"
    }
    {
        en = "Kill or be killed. Berserkers are men who have been forged by cruel hardship since birth, and as a result are naturally fearless combatants."
        ru = "Убей или умри. Берсерки — люди, закалённые жестокими испытаниями с рождения, и потому являются бесстрашными воинами от природы."
    }
    {
        en = "While the %companyname% visited a town for rest and recuperation, a local princess took a shine to %name% the wildman. He was 'purchased' for a large sum of gold and given to the noblewoman. You went and visited the man recently. For dinner, he sat at a kingly table, grinning goofily and mimicking the nobles around him as best he could. His new and inexplicable wife adored him, and him her. When you said your goodbyes, he offered you a heavy golden crown off the top of his head. It weighed heavy with traditions and ancient histories. You said it'd be best if he kept it. The wildman shrugged and walked off, spinning the circlet around a finger."
        ru = "Когда %companyname% остановилась в городе для отдыха, местная принцесса положила глаз на %name% дикаря. Его 'купили' за кругленькую сумму и отдали знатной даме. Недавно вы навестили его. За королевским столом он сидел с глуповатой улыбкой, изо всех сил подражая окружающим дворянам. Его новая и неожиданная жена обожала его, а он её. Прощаясь, он предложил вам тяжёлую золотую корону со своей головы. Она была полна традиций и древней истории. Вы сказали, что ему лучше оставить её себе. Дикарь пожал плечами и ушёл, крутя венец на пальце."
    }
    {
        en = "%name% the wildman stayed with the fragmenting %companyname% for a time and then, just like that, he was gone. The company went out looking for him in a forest, eventually finding some sort of crude note: an enormous pile of crowns next to a dirt-drawing of the %companyname% and some of its members, all of them being hugged by a big, literal stick figure with a goofy smile on its face. There was also an offering of a dead, half-eaten rabbit."
        ru = "%name% дикарь пробыл с разваливающейся %companyname% некоторое время, а потом просто исчез. Отряд отправился искать его в лесу и в итоге нашёл странную записку: огромную кучу корон рядом с рисунком на земле, изображавшим %companyname% и некоторых её членов, которых обнимала большая, буквально палочная фигура с глуповатой улыбкой. Рядом также лежал подарок — мёртвый, наполовину съеденный кролик."
    }
    {
        en = "the Berserker"
        ru = "Берсерк"
    }
    {
        en = "the Crazed"
        ru = "Безумный"
    }
    {
        en = "the Bloodthirsty"
        ru = "Кровожадный"
    }
    {
        en = "the Feral"
        ru = "Зверьё"
    }
    {
        en = "the Wild"
        ru = "Дикарь"
    }
    {
        en = "the Battleforged"
        ru = "Закалённый"
    }
    {
        en = "{It is said that man is born with the wilderness in him, and that he does wrong by turning his back on it. This is a mantra esteemed by those that find refuge in the forests, spurning the filth of civilization and returning to the old ways. However, between the men of the wilderness and the men of civilization, there exists a third class of men that dare to live at the fringes of both. They are called berserkers. %name% is one such man. He is so immense that lesser men appear almost as children; his body is covered in scars and his hair grows unimpeded in every which way. At a quick glance he appears to be a conventional wildman, if indeed there exists such a thing. However, his piercing, intelligent gaze shows that though his body was honed by the cruelties of nature, so too has his mind been honed by the cruelties of man.}"
        ru = "{Говорят, что человек рождается с дикостью внутри, и что он поступает неправильно, отворачиваясь от неё. Это мантра тех, кто находит убежище в лесах, отвергая грязь цивилизации и возвращаясь к старым путям. Однако между людьми дикими и цивилизованными существует третий род — те, кто осмеливается жить на грани обоих миров. Их называют берсерками. %name% — один из таких. Он настолько огромен, что прочие люди кажутся детьми рядом с ним; его тело покрыто шрамами, а волосы беспорядочно растут во все стороны. На первый взгляд он кажется обычным дикарём, если такое вообще возможно. Однако его пронзительный, умный взгляд показывает, что хоть его тело и закалила жестокость природы, разум его отточила жестокость людей.}"
    }
    {
        en = "dirt"
        ru = ""
    }
    {
        en = "body"
        ru = ""
    }

    // FILE: scripts/skills/backgrounds/hackflows/blacksmith_background.nut
    {
        en = "Blacksmith"
        ru = "Кузнец"
    }
    {
        en = "The endurance and precision needed to forge weapons of war gives blacksmiths a head start in becoming combat ready."
        ru = "Выносливость и точность, необходимые для ковки боевого оружия, дают кузнецам преимущество в освоении боевых искусств."
    }
    {
        en = "the Smith"
        ru = "Кузнец"
    }
    {
        en = "the Smithy"
        ru = "Наковальня"
    }
    {
        en = "the Blacksmith"
        ru = "Ковач"
    }
    {
        en = "the Metalworker"
        ru = "Слесарь"
    }
    {
        en = "the Forgemaster"
        ru = "Штамповщик"
    }
    {
        en = "the Swordmaker"
        ru = "Клинковар"
    }
    {
        en = "the Hammerer"
        ru = "Молотобоец"
    }
    {
        en = "the Furnacemaster"
        ru = "Горновой"
    }
    {
        en = "the Metalcaster"
        ru = "Литейщик"
    }
    {
        en = "{%name%’s father was a smith, and that man’s father before him as well, so naturally, he was quick to pick up the trade. | When his father passed at a young age, %name% was forced to start providing for the family, taking up smithing to keep mouths fed. | %name%’s family sword was a priceless heirloom passed down from generations, but after it disappeared in a break-in, %name% turned to smithing to forge a new blade for his family to take pride in.} {But when a local nobleman was unhappy with a dagger he commissioned, he sent his men to put the smith’s shop to the torch. | Filled with wanderlust, he set out to join a mercenary company, determined not to wither away in the shop he’s spent his whole life in. | Yet when his father rose from the grave and the rest of the cemetery with him, %name% vowed to put his hammer to a more righteous cause.}  {He tells you he can forge a blade so sharp it can cut through stone. You don’t know about that, but a blacksmith of his experience would be a fit for any company. | The man’s muscled arms are proof enough that he’s no stranger to the hammer - perhaps you can help him put it to a new use. | It’s doubtful the man has swung a sword in his life. But he has a soldier’s build, and with the proper training, you think you can mold him into a true fighter. | While he may not be a fearsome warrior, a smith like him is always handy to have around. You just hope he’s as good at striking foes as he is at striking nails. | He figured a band a of mercenaries would suit him, and while he’s no swordmaster, the might of his hammer arm suggests he might be right.}"
        ru = "{Отец %name% был кузнецом, как и его отец до него, так что ремесло далось ему легко. | Когда отец умер, юному %name% пришлось кормить семью, взявшись за кузнечное дело. | Фамильный меч %name% был бесценной реликвией, передававшейся из поколения в поколение, но после того как его украли воры, %name% занялся кузнечным делом, чтобы выковать новый клинок, которым семья могла бы гордиться.} {Но когда местный дворянин остался недоволен заказанным кинжалом, он послал людей спалить кузницу дотла. | Одержимый жаждой странствий, он отправился в наёмники, не желая зачахнуть в мастерской, где провёл всю жизнь. | Но когда его отец восстал из могилы вместе со всем кладбищем, %name% поклялся направить свой молот на правое дело.} {Он говорит, что может выковать клинок, способный разрубить камень. Вы в этом сомневаетесь, но кузнец с таким опытом пригодится в любом отряде. | Мускулистые руки выдают в нём человека, привычного к молоту — возможно, вы поможете ему найти молоту новое применение. | Вряд ли он когда-либо держал в руках меч. Но телосложение у него воинское, и с должной подготовкой из него выйдет настоящий боец. | Хоть он и не грозный воин, такой кузнец всегда пригодится. Остаётся надеяться, что он так же хорошо бьёт врагов, как и по наковальне. | Он решил, что ему самое место среди наёмников, и хоть он не мастер меча, сила его молота говорит, что он может быть прав.}"
    }

    // FILE: scripts/skills/backgrounds/hackflows/bodyguard_background.nut
    {
        en = "Bodyguard"
        ru = "Телохранитель"
    }
    {
        en = "Bodyguards are burly men that specialize in keeping people of interest from being killed."
        ru = "Телохранители — крепкие мужчины, которые специализируются на защите важных персон от смерти."
    }
    {
        en = "the Bodyguard"
        ru = "Телохранитель"
    }
    {
        en = "the Shield"
        ru = "Щит"
    }
    {
        en = "the Meatshield"
        ru = "Живой Щит"
    }
    {
        en = "the Giant"
        ru = "Великан"
    }
    {
        en = "the Enforcer"
        ru = "Мордоворот"
    }
    {
        en = "the Guard"
        ru = "Вахтёр"
    }
    {
        en = "the Watchdog"
        ru = "Барбос"
    }
    {
        en = "the Sentry"
        ru = "Часовой"
    }
    {
        en = "the Invincible"
        ru = "Неуязвимый"
    }
    {
        en = "the Impenetrable"
        ru = "Непробей"
    }
    {
        en = "the Steadfast"
        ru = "Верный"
    }
    {
        en = "the Stalwart"
        ru = "Крепыш"
    }
    {
        en = "the Impregnable"
        ru = "Стойкий"
    }
    {
        en = "{The illegitimate son of a hedge knight, %name% was disowned by his father early in life for failing to inherit his 'killer's disposition'. What %name% did inherit, however, was his father's towering physical build. He attracted the attention of a local lord after hearing news of a bear of a man singlehandedly repelling a bandit attack, and was hired on as a personal bodyguard. %name% served him faithfully for many years, until the lord eventually passed peacefully of old age. Because the lord lacked an heir, the succession struggle was messy, and soon %name% turned to mercenary work, in search of other great men to shield from evil.}"
        ru = "{Будучи незаконным сыном странствующего рыцаря, %name% был рано отвергнут отцом за то, что не унаследовал его 'убийственный нрав'. Зато %name% унаследовал богатырское телосложение отца. Он привлёк внимание местного лорда, когда тот прослышал о медведе-человеке, в одиночку отбившем нападение бандитов. Лорд нанял его личным телохранителем. %name% верно служил ему долгие годы, пока тот не скончался мирно от старости. Поскольку у лорда не было наследника, борьба за престол вышла грязной, и вскоре %name% подался в наёмники, в поисках других великих людей, которых можно защищать от зла.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/bounty_hunter_background.nut
    {
        en = "Bounty Hunter"
        ru = "Охотник за головами"
    }
    {
        en = "Persistence is key. Bounty hunters are paid good coin to recover any human target, dead or alive."
        ru = "Главное - упорство. Охотникам за головами хорошо платят за поимку любого человека, живым или мертвым."
    }
    {
        en = "the Hunter"
        ru = "Охотник"
    }
    {
        en = "the Bounty Hunter"
        ru = "Ловчий"
    }
    {
        en = "the Relentless"
        ru = "Неутомимый"
    }
    {
        en = "the Hound"
        ru = "Ищейка"
    }
    {
        en = "the Dog"
        ru = "Пёс"
    }
    {
        en = "the Eagle"
        ru = "Орёл"
    }
    {
        en = "the Reaper"
        ru = "Жнец"
    }
    {
        en = "the Persistent"
        ru = "Упорный"
    }
    {
        en = "the Tracker"
        ru = "Следопыт"
    }
    {
        en = "{%name%'s past is a mystery, as even those that have worked with him the past have seldom heard more than a few sentences unrelated to the task at hand. What is abundantly clear though, is that just as beast slayers specialize in eliminating the monstrosities of the world, so too does %name% the bounty hunter hunt monstrosities, specializing particularly in those that hide behind the mask of man. His line of work is already quite similar to a mercenary's; forking over the coin for a man like %name% would certainly be worthwhile for any reputable outfit.}"
        ru = "{О прошлом %name% ничего не известно - даже те, кто работал с ним бок о бок, слышали от него лишь пару фраз о текущем деле. Ясно одно: как истребители чудовищ специализируются на уничтожении монстров, так и %name% охотится за извергами, что прячутся под маской человека. Его ремесло мало чем отличается от работы наемника - такой человек, как %name%, определенно станет ценным приобретением для любой уважающей себя компании.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/carpenter_background.nut
    {
        en = "Carpenter"
        ru = "Плотник"
    }
    {
        en = "Carpenters can often be found in forest settlements, doing the critical work of converting logs to high quality planks."
        ru = "Плотников часто можно встретить в лесных поселениях, где они занимаются важным делом превращения бревен в качественные доски."
    }
    {
        en = "the Craftsman"
        ru = "Мастеровой"
    }
    {
        en = "the Carpenter"
        ru = "Плотник"
    }
    {
        en = "the Woodworker"
        ru = "Деревщик"
    }
    {
        en = "{From humble beginnings was raised a humble man. %name% the carpenter lived simply, taking up the fine work that his father and his grandfather had before. He and his older brother had made a great team. His brother had a much stronger build, and so chopped the wood that %name% would then cut into workable construction materials. One day %name%'s brother ventured into the forests to chop wood, but never returned in the evening. %name%, seeking answers, small in stature but not in bravery, now seeks to solve the mystery of his older brother once and for all.}"
        ru = "{Из простых корней вырос простой человек. %name% плотник жил скромно, продолжая благородное дело своего отца и деда. Они со старшим братом составляли отличную команду. Брат был крепче телом и рубил деревья, которые %name% затем превращал в годный строительный материал. Однажды брат %name% отправился в лес за древесиной, но так и не вернулся вечером. %name%, невеликий статью, но не храбростью, теперь ищет разгадку тайны исчезновения старшего брата.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/cartographer_background.nut
    {
        en = "Cartographer"
        ru = "Картограф"
    }
    {
        en = "Cartographers specialize in the creation of accurate maps. Unlike historians, they have modest experience outdoors from their time spent travelling with supply caravans to map the landscape."
        ru = "Картографы специализируются на создании точных карт. В отличие от историков, они имеют некоторый опыт походной жизни, полученный во время путешествий с торговыми караванами для составления карт местности."
    }
    {
        en = "the Studious"
        ru = "Заучка"
    }
    {
        en = "the Cartographer"
        ru = "Картограф"
    }
    {
        en = "the Mapmaker"
        ru = "Чертёжник"
    }
    {
        en = "the Sketcher"
        ru = "Рисовальщик"
    }
    {
        en = "the Observant"
        ru = "Заметливый"
    }
    {
        en = "{Plagued by a chronic illness since birth, %name% was never able to grow to the health and constitution of even an average man. Unable to help his hometown defend itself by joining the militia, %name% was scorned by his peers. Aghast at the shame he felt he was bringing upon his family, he one day risked life and limb by charting the local area and discovering locations of bandit hideouts. This information proved critical in repelling the next raid, and jeers turned quickly to praise for %name%'s ability. Now he seeks to map places uncharted by man. He would be better suited to hire a mercenary band than join one; but nevertheless you muse that it would be nice to have another man with brains in the outfit.}"
        ru = "{С самого рождения %name% страдал от хронической болезни и никогда не мог достичь здоровья и силы даже обычного человека. Не в силах помочь родному городу, вступив в ополчение, %name% стал объектом насмешек. Измученный стыдом, который он, как ему казалось, навлёк на свою семью, однажды он рискнул жизнью, составив карту окрестностей и обнаружив места бандитских логовищ. Эти сведения оказались решающими при отражении следующего набега, и насмешки быстро сменились похвалой способностям %name%. Теперь он стремится наносить на карты неизведанные земли. Ему больше подошло бы нанять отряд наёмников, чем присоединиться к нему, но всё же вы думаете, что ещё один умный человек в отряде не помешает.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/champion_background.nut
    {
        en = "Champion"
        ru = "Чемпион"
    }
    {
        en = "Champions are knights that have gained renown as one on one fighters. Men of such repute are usually in the employ of noble houses and as such not typically in the market for mercenary work."
        ru = "Чемпионы — это рыцари, прославившиеся как бойцы один на один. Такие именитые воины обычно служат знатным домам и редко ищут работу наёмника."
    }
    {
        en = "A man like %name% would always find a way. The hedge knight eventually, if not inevitably, left the company and set out on his own. Unlike many other brothers, he did not spend his crowns on land or ladders with which to climb the noble life. Instead, he bought himself the finest war horses and the talents of armorers. The behemoth of a man rode from one jousting tournament to the next, winning them all with ease. He's still at it to this day, and you think he won't stop until he's dead. The hedge knight simply knows no other life."
        ru = ""
    }
    {
        en = "%name% the hedge knight eventually left the company. He traveled the lands, returning to his favorite past time of jousting, which was really a cover for his real favorite past time of lancing men off horses in a shower of splinters and glory. At some point, he was ordered to 'throw' a match against a pitiful and gangly prince to earn the nobleman some prestige. Instead, the hedge knight drove his lance through the man's skull. Furious, the lord of the land ordered the hedge knight killed. They say over a hundred soldiers took to his home and only half returned alive."
        ru = ""
    }
    {
        en = "the Legendary"
        ru = "Легенда"
    }
    {
        en = "the Mighty"
        ru = "Могучий"
    }
    {
        en = "the Unbeatable"
        ru = "Непобедимый"
    }
    {
        en = "the Undefeated"
        ru = "Непобеждённый"
    }
    {
        en = "the Favorite"
        ru = "Любимчик"
    }
    {
        en = "the Champion"
        ru = "Чемпион"
    }
    {
        en = "the Steady"
        ru = "Незыблемый"
    }
    {
        en = "the Mountain"
        ru = "Гора"
    }
    {
        en = "Strongface"
        ru = "Рожа кирпичом"
    }
    {
        en = "the Unbreakable"
        ru = "Несокрушимый"
    }
    {
        en = "the Knightslayer"
        ru = "Убийца рыцарей"
    }
    {
        en = "{Some say that there are but two types of men: those that know no defeat whose deeds invariably become the stuff of legends, and completely irrelevant milkdrinkers. Regardless of the veracity of this little idiom, one look at %name% and it is abundantly clear which class he would fall into. Despite his relative youth, %name% has already spent several years as a combat instructor at the local training hall. Why he wants to join a mercenary company now is unclear. You look at his desired wages and almost burst out laughing. All %name% has to say is that he is willing to take a pay cut if it means experiencing adventure again.}"
        ru = "{Говорят, есть лишь два типа мужчин: те, кто не знает поражений и чьи подвиги неизбежно становятся легендами, и полные ничтожества-молокососы. Вне зависимости от правдивости этой поговорки, одного взгляда на %name% достаточно, чтобы понять, к какому типу он относится. Несмотря на юный возраст, %name% уже несколько лет преподаёт боевое искусство в местной школе. Неясно, почему он хочет присоединиться к отряду наёмников. Вы смотрите на его желаемую плату и чуть не прыскаете со смеху. %name% лишь говорит, что готов согласиться на меньшие деньги, если это значит снова почувствовать вкус приключений.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/cobbler_background.nut
    {
        en = "Cobbler"
        ru = "Сапожник"
    }
    {
        en = "Cobblers are humble folk making a living by crafting footwear of all kinds."
        ru = "Сапожники — скромные люди, зарабатывающие на жизнь изготовлением обуви всех видов."
    }
    {
        en = "the Shoemaker"
        ru = "Башмачник"
    }
    {
        en = "the Cobbler"
        ru = "Сапожник"
    }
    {
        en = "the Shoemender"
        ru = "Ремонт обуви"
    }
    {
        en = "the Cordwainer"
        ru = "Шнур"
    }
    {
        en = "Bootsmith"
        ru = "Ботинщик"
    }
    {
        en = "Shoesmith"
        ru = "Обуварь"
    }
    {
        en = "{%name% the cobbler, much like the vast majority of peasants, has no interesting backstory. When you ask why he wishes to become a mercenary, he simply shrugs his shoulders, and mumbles something to the effect of shoemaking not making enough coin. Your eyebrows raise in surprise; his asking salary is pretty low as it is, so you accurately surmise that shoemaking is not the best craft to invest into.}"
        ru = "{%name% сапожник, как и большинство крестьян, не может похвастаться интересной историей. Когда вы спрашиваете, почему он хочет стать наёмником, он просто пожимает плечами и бормочет что-то о том, что сапожное дело приносит мало монет. Ваши брови удивлённо поднимаются; его запрошенное жалование и так довольно низкое, так что вы верно догадываетесь — сапожное ремесло не лучшее дело для вложений.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/con_artist_background.nut
    {
        en = "Con Artist"
        ru = "Мошенник"
    }
    {
        en = "Con artists make their living by swindling other folks. Those astute enough to realize when they are pressing their luck often turn to mercenary work to begin anew."
        ru = "Мошенники зарабатывают на обмане других людей. Те из них, кто достаточно смышлен, чтобы понять, когда пора делать ноги, часто подаются в наемники, чтобы начать всё с чистого листа."
    }
    {
        en = "the Con Artist"
        ru = "Мошенник"
    }
    {
        en = "the Scammer"
        ru = "Пройдоха"
    }
    {
        en = "Two Face"
        ru = "Двуличный"
    }
    {
        en = "the Trickster"
        ru = "Ловкач"
    }
    {
        en = "the Thief"
        ru = "Вор"
    }
    {
        en = "the Untrustworthy"
        ru = "Скользкий"
    }
    {
        en = "the Cheat"
        ru = "Туфтогон"
    }
    {
        en = "the Hustler"
        ru = "Шаромыжник"
    }
    {
        en = "{%name% the con artist eyes you nervously as you approach. Before you can a word out he exclaims that he doesn't owe you any money and that any purchases made were final. As it turns out, the scammer has been on the run for so long and from so many people that for a moment you begin to wonder if he really DOES owe you cash. He has a dangerous, desperate look in his eyes, and is undoubtedly looking for a mercenary crew for some protection. You know little else of his background, but what else is even relevant to know?"
        ru = "{%name% нервно смотрит на вас, когда вы подходите. Не дав вам и слова сказать, он восклицает, что ничего вам не должен, и все сделки окончательны. Похоже, аферист так долго бегал от стольких людей, что на миг вы сами задумались — а может, он и правда вам что-то должен? В его глазах читается опасное отчаяние, и он явно ищет наемников для защиты. О его прошлом вы знаете мало, но разве это имеет значение?"
    }
    // FILE: scripts/skills/backgrounds/hackflows/cook_background.nut
    {
        en = "Cook"
        ru = "Повар"
    }
    {
        en = "Cooks have little combat or travel experience, having spent most of their careers indoors preparing delicious meals for the local nobility."
        ru = "Повара редко имеют боевой опыт или опыт путешествий, проведя большую часть карьеры на кухне, готовя изысканные блюда для местной знати."
    }
    {
        en = "the Cook"
        ru = "Повар"
    }
    {
        en = "the Chef"
        ru = "Шеф"
    }
    {
        en = "the Fat"
        ru = "Жирдяй"
    }
    {
        en = "the Jolly"
        ru = "Весельчак"
    }
    {
        en = "{%name% the cook has always liked food. Once, during better times, a local lord contributed several delicacies to a peasant holiday. Upon sampling the baked treats, %name% was so overcome with emotion that he begged the lord to allow his chef to accept him as an understudy, so that he may bring smiles to other poor folk in the future. The gracious nobleman accepted, and for a time %name% spent happy years honing his craft. Sadly, after being caught sampling food from the larder during times of hardship, %name% has been kicked to the curb. Oddly enough, this hasn't seemed to bother the cook very much. He now seeks mercenary work so that he 'doesn't have to be so damn hungry all the time.'}"
        ru = "{%name% всегда любил поесть. Однажды, в лучшие времена, местный лорд прислал несколько деликатесов на крестьянский праздник. Отведав печёные угощения, %name% был настолько восхищён, что упросил лорда позволить его шефу взять его в подмастерья — чтобы и он мог приносить радость бедным людям. Милостивый дворянин согласился, и %name% провёл несколько счастливых лет, оттачивая своё мастерство. Увы, после того как его поймали на воровстве еды из кладовой в тяжёлые времена, %name% вышвырнули на улицу. Как ни странно, повара это особо не расстроило. Теперь он ищет работу наёмником, чтобы 'не шляться вечно голодным'.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/dissenter_background.nut
    {
        en = "Dissenter"
        ru = "Смутьян"
    }
    {
        en = "Dissenters have trouble keeping their mouths shut, seeking mercenary work as a means to escape a grisly end at the hands of goons hired by the targets of their denunciations."
        ru = "Смутьяны не держат язык за зубами и ищут работу наёмника, чтобы избежать жестокой расправы от головорезов, нанятых теми, кого они обличают."
    }
    {
        en = "the Dissenter"
        ru = "Раскольник"
    }
    {
        en = "the Loudmouth"
        ru = "Горлопан"
    }
    {
        en = "the Disagreeable"
        ru = "Несносный"
    }
    {
        en = "Sharptongue"
        ru = "Острослов"
    }
    {
        en = "the Just"
        ru = "Правдоруб"
    }
    {
        en = "{After watching his father executed without trial for a crime he didn't commit and his mother burned at the stake because of a bogus accusation, %name% the dissenter's heart has been filled with nothing but absolute hatred for nobility. Lacking the strength or skill to kill kings himself, his spends his time shouting for the peasantry to rise up and overthrow the existing political order. However, his vocalizations have largely fallen on deaf ears. You surmise that the reason %name% yet lives is that no one important takes him as a serious threat. As if reading your mind, the dissenter tells you that THAT is the exact reason he is looking to join a mercenary band.}"
        ru = "{После того как его отца казнили без суда за преступление, которого он не совершал, а мать сожгли на костре по ложному обвинению, сердце смутьяна %name% наполнилось лишь ненавистью к знати. Не имея сил или умения убивать королей самому, он тратит время на призывы к крестьянам восстать и свергнуть существующий порядок. Однако его речи в основном пропадают впустую. Вы полагаете, что %name% до сих пор жив лишь потому, что власть имущие не считают его серьёзной угрозой. Словно прочитав ваши мысли, смутьян говорит, что ИМЕННО поэтому он и хочет вступить в отряд наёмников.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/drifter_background.nut
    {
        en = "Drifter"
        ru = "Бездомный"
    }
    {
        en = "For one reason or another, drifters lack any city to call home, finding themselves wandering from place to place and doing odd jobs to keep themselves fed."
        ru = "По разным причинам бродяги не имеют города, который могли бы назвать домом, скитаясь от места к месту и берясь за случайную работу, чтобы не умереть с голоду."
    }
    {
        en = "Having enough of all the fighting, %name% the once-drifter retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he'd wasted all his money and he laughed. He said he'd purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two."
        ru = "Устав от всех сражений, %name% бывший бродяга покинул %companyname%. Ты знаешь, что он неплохо заработал в отряде наёмников, но на днях видел его снова просящим милостыню. Ты спросил, не растратил ли он все деньги, а он рассмеялся. Сказал, что купил земли и у него всё в порядке. Затем протянул свою жестянку и попросил крону. Ты дал ему две."
    }
    {
        en = "the Drifter"
        ru = "Бродяга"
    }
    {
        en = "the Dirty"
        ru = "Чумазый"
    }
    {
        en = "the Outcast"
        ru = "Изгой"
    }
    {
        en = "Fleetfoot"
        ru = "Шатун"
    }
    {
        en = "the Wanderer"
        ru = "Скиталец"
    }
    {
        en = "the Homeless"
        ru = "Бомжара"
    }
    {
        en = "{The third child born to a modest merchant family, %name% spent much of his early life idly wasting time with trivial pursuits. When his father died, %name%'s older brother took over the family business, leaving %name% with a chunk of change to spend. Lacking direction in his life, %name% has since been wandering around in search of purpose. The man has a bit of an empty gaze. No matter. Your band has seen less able men join the shield wall.}"
        ru = "{Третий ребёнок в семье небогатого торговца, %name% провёл юность праздно растрачивая время на пустяки. Когда его отец умер, старший брат %name% унаследовал семейное дело, оставив %name% с горстью монет на руках. Не имея цели в жизни, %name% с тех пор скитается в поисках предназначения. У мужчины немного отсутствующий взгляд. Неважно. Ваш отряд видел и менее способных бойцов в строю щитов.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/druid_background.nut
    {
        en = "Druid"
        ru = "Друид"
    }
    {
        en = "Druids are men that are more in tune with mystic forces than the average layman."
        ru = "Друиды - это люди, более чуткие к мистическим силам, чем обычные смертные."
    }
    {
        en = "the Druid"
        ru = "Друид"
    }
    {
        en = "the Mystic"
        ru = "Мистик"
    }
    {
        en = "the Mysterious"
        ru = "Загадочный"
    }
    {
        en = "the Nature Spirit"
        ru = "Дух природы"
    }
    {
        en = "the Channeler"
        ru = "Чародей"
    }
    {
        en = "the Arcane"
        ru = "Мудрец"
    }
    {
        en = "{The tattoos and runes printed upon %name% the druid's body make him quite a sight to behold in town. Raised in the wild from birth, yet not entirely lacking the mannerisms of civilized man, %name%'s past is shrouded in mystery. The man informs you of that he is seeking mercenary work, for a druidic prophecy foretold that a band of brothers would one day face hordes of untold horrors. You aren't sure if you should hire him or not; either way his message is deeply unsettling.}"
        ru = "{Татуировки и руны, покрывающие тело друида %name%, делают его весьма примечательным в городе. Выросший в диких землях, но не чуждый манерам цивилизованного человека, %name% хранит своё прошлое в тайне. Он рассказывает, что ищет работу наёмника, поскольку друидическое пророчество предрекло, что однажды братство воинов встретится с полчищами невиданных ужасов. Вы не уверены, стоит ли его нанимать; в любом случае, его слова глубоко тревожат.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/falconer_background.nut
    {
        en = "Falconer"
        ru = "Сокольничий"
    }
    {
        en = "Falconers, as the name suggests, have mastery of falcons."
        ru = "Сокольничие, как следует из названия, в совершенстве владеют искусством соколиной охоты."
    }
    {
        en = "While the %companyname% continued on with great success, %name% the falconer eventually saw fit to leave it all behind. He returned to the forests, starting an aviary of trained falcons. All told, his experience as a mercenary didn't change his demeanor; %name% and his falcons transitioned smoothly from hunting men back to hunting beasts."
        ru = "Пока %companyname% продолжала преуспевать, сокольничий %name% решил оставить всё позади. Он вернулся в леса и основал питомник для обученных соколов. В целом, опыт наёмника не изменил его характер — %name% и его соколы легко перешли от охоты на людей обратно к охоте на зверей."
    }
    {
        en = "With the decline of the %companyname% readily obvious, %name% the falconer departed from the company and returned to falconry. Unfortunately, he fell upon hard times and was forced to sell his prized birds to make ends meet. Last you heard, the decision drove him mad and he wandered off into the forest, never to be seen again."
        ru = "Видя явный упадок %companyname%, сокольничий %name% покинул отряд и вернулся к соколиной охоте. К несчастью, он попал в трудные времена и был вынужден продать своих драгоценных птиц, чтобы свести концы с концами. По последним слухам, это решение свело его с ума, и он ушёл в лес, где его больше никто не видел."
    }
    {
        en = "the Falconer"
        ru = "Сокольничий"
    }
    {
        en = "the Birdmaster"
        ru = "Птицелов"
    }
    {
        en = "the Falconmaster"
        ru = "Соколиный Мастер"
    }
    {
        en = "the Woodsman"
        ru = "Лесник"
    }
    {
        en = "Eagle Eye"
        ru = "Орлиный Глаз"
    }
    {
        en = "the Scoutmaster"
        ru = "Следопыт"
    }
    {
        en = "the Watcher"
        ru = "Дозорный"
    }
    {
        en = "Can release falcons for no AP cost"
        ru = "Может выпускать соколов без затрат ОД"
    }
    {
        en = "Falcons released by the falconer reveal 16 tiles distance instead of 12"
        ru = "Соколы, выпущенные сокольничим, открывают обзор на 16 клеток вместо 12"
    }
    {
        en = "{%name% always had a fascination with avian creatures. Little did he know, this fascination would one day become his niche on the battlefield. | %name%'s father was a skilled hunter. Though %name% didn't share quite the same aptitude with the bow, his skill with birds made him an invaluable hunting companion. | Early in his life, %name% liked to traipse about the forests. Once, he chanced upon an injured falcon and took it under his wing. Since then, %name% has become a master of dealing with avian creatures.} {The falconer eventually realized that his knack for scouting for beasts in the forests could be just as easily applied to scouting enemy formations. | When a misplaced target callout led to a fellow woodsman being shot in the neck, %name% knew his career as a conventional falconer was over. | Sadly, a bad hunting season forced the birdmaster into seeking other means of income. | War drove the game out of the forests, and with them, %name%. Now he seeks another line of work.} {Any outfit could use an eagle eye such as this man. | Despite his humble backgrounds, %name% has already proven to be a valuable scout in many a noble war. | %name%'s falcon is perched majestically atop his shoulder. It is clear that the two are extensions of each other. | %name% looks like he has something to prove - his sharp eyes and nimble movements may prove useful on the battlefield yet. | The falcon atop his shoulder has steely eyes; you suspect that it has seen many more battles from above than the average wannabe mercenary.}"
        ru = "{%name% всегда был очарован пернатыми созданиями. Он и не подозревал, что это увлечение однажды станет его козырем на поле боя. | Отец %name% был умелым охотником. Хоть %name% и не унаследовал его талант к стрельбе из лука, его мастерство обращения с птицами сделало его незаменимым спутником на охоте. | В юности %name% любил бродить по лесам. Однажды он наткнулся на раненого сокола и взял его под своё крыло. С тех пор %name% стал мастером в обращении с пернатыми.} {Со временем сокольничий понял, что его умение выслеживать зверей в лесу можно с тем же успехом применять для разведки вражеских построений. | Когда из-за неверного целеуказания стрела попала в шею другому леснику, %name% понял, что с обычной соколиной охотой покончено. | К сожалению, неудачный охотничий сезон вынудил птицелова искать другие источники дохода. | Война выгнала дичь из лесов, а вместе с ней и %name%. Теперь он ищет другое занятие.} {Такой зоркий глаз пригодится любому отряду. | Несмотря на скромное происхождение, %name% уже проявил себя как ценный разведчик во многих благородных войнах. | Сокол %name% величественно восседает на его плече. Видно, что они с хозяином — единое целое. | %name% выглядит так, будто ему есть что доказать — его острый взгляд и ловкие движения ещё пригодятся на поле боя. | У сокола на его плече стальной взгляд; похоже, он видел сверху куда больше битв, чем среднестатистический новоиспеч"
    }
    // FILE: scripts/skills/backgrounds/hackflows/fletcher_background.nut
    {
        en = "Fletcher"
        ru = "Стрелодел"
    }
    {
        en = "Fletchers are the counterpart of bowyers, specializing in making and selling arrows."
        ru = "Стрелоделы - это мастера вроде лучников, но специализирующиеся на изготовлении и продаже стрел."
    }
    {
        en = "the Arrowmaker"
        ru = "Стрелодел"
    }
    {
        en = "the Arrow Seller"
        ru = "Стрелоторговец"
    }
    {
        en = "{A man of humble origins, %name% found a talent early on for crafting ammunition and has been at it ever since. Fortunately for him, the war and strife in the world had hitherto given him plenty of work. Despite this, %name% always felt that there was more to see in the world. You aren't sure if the man will be able to make a name for himself in the history books, but he should know his way around a bow, at the very least.}"
        ru = "{Выходец из простой семьи, %name% рано обнаружил в себе талант к изготовлению боеприпасов и с тех пор этим и занимается. К его счастью, войны и раздоры в мире до сих пор обеспечивали его работой. Несмотря на это, %name% всегда чувствовал, что в мире есть что повидать. Вы не уверены, сможет ли он вписать своё имя в историю, но уж с луком-то он точно управится.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/folk_hero_background.nut
    {
        en = "Folk Hero"
        ru = "Народный Герой"
    }
    {
        en = "Folk heroes are commoners that have achieved great heights, earning the admiration of the peasantry and begrudging respect of knights with their mythical deeds."
        ru = "Народные герои - простолюдины, достигшие небывалых высот, заслужившие восхищение крестьян и неохотное уважение рыцарей своими легендарными подвигами."
    }
    {
        en = "the Hero"
        ru = "Герой"
    }
    {
        en = "the Legend"
        ru = "Легенда"
    }
    {
        en = "the Folk Hero"
        ru = "Народный Герой"
    }
    {
        en = "the Lionhearted"
        ru = "Львиное Сердце"
    }
    {
        en = "the Magnanimous"
        ru = "Великодушный"
    }
    {
        en = "the Storied"
        ru = "Прославленный"
    }
    {
        en = "the Humble"
        ru = "Скромный"
    }
    {
        en = "{Some say that men are born into their stations, destined either for great things or utter medocrity by the circumstances of their birth. %name% is a picture perfect contradiction of this mantra. Towering well over six feet tall, %name% exudes an aura of pure strength, but carries himself with a dignified reserve. Nearby peasants whisper amongst themselves in excited tones. Evidently, despite being born in abject poverty and orphaned early in life, %name% eventually became something of a folk hero, with feats including but not limited to facing a band of 20 brigands on his own and emerging victorious. As you ask him to separate the fact from fiction of this paricular myth, without looking up from his mug, he merely replies, '25'.}"
        ru = "{Говорят, что люди рождаются каждый в своём положении, и обстоятельства рождения предопределяют их судьбу - быть великими или прозябать в посредственности. %name% - живое опровержение этой мантры. Возвышаясь далеко за шесть футов, %name% излучает ауру чистой силы, но держится с достойной сдержанностью. Крестьяне вокруг взволнованно перешёптываются. Очевидно, что несмотря на рождение в крайней нищете и раннее сиротство, %name% со временем стал народным героем, чьи подвиги включают, помимо прочего, победу над бандой из 20 разбойников в одиночку. Когда вы просите его отделить правду от вымысла в этом конкретном мифе, он, не поднимая глаз от кружки, лишь отвечает: '25'.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/gardener_background.nut
    {
        en = "Gardener"
        ru = "Садовник"
    }
    {
        en = "Gardeners are men with green thumbs often hired by noblemen to maintain extravant gardens as status symbols."
        ru = "Садовники - это люди с врождённым талантом к растениям, которых часто нанимают дворяне для ухода за роскошными садами - символами статуса."
    }
    {
        en = "the Gardener"
        ru = "Садовник"
    }
    {
        en = "Green Thumbed"
        ru = "Зелёная Рука"
    }
    {
        en = "the Caretaker"
        ru = "Смотритель"
    }
    {
        en = "{A somewhat meek individual by nature, %name% spent much of his life tending to the gardens in the lavish castles of higher nobility. When the lord's wife became pregnant while he was out on campagin, the household required a scapegoat. Poor %name% drew the short straw, and lacking the courage to prove his innocence, fled the estate. He does seem a bit more timid to you than normal, but nonetheless carries himself like an outdoorsman.}"
        ru = "{%name%, будучи от природы довольно кротким человеком, большую часть жизни провёл ухаживая за садами в роскошных замках высшей знати. Когда жена лорда забеременела, пока тот был в походе, дому потребовался козёл отпущения. Бедняге %name% не повезло, и, не найдя в себе смелости доказать невиновность, он сбежал из поместья. Он кажется вам немного более пугливым, чем обычные люди, но всё же держится как настоящий человек природы.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/hangman_background.nut
    {
        en = "Hangman"
        ru = "Палач"
    }
    {
        en = "Hangmen are no strangers to death, but also have not seen it dealt in the myriad of sloppy methods out on the battlefield."
        ru = "Палачи не понаслышке знакомы со смертью, но не видали её во всём многообразии неуклюжих способов, что встречаются на поле боя."
    }
    {
        en = "A former militiaman such as %name% eventually left the %companyname%. He traveled the lands, visiting villages and helping them establish credible militias with which to defend themselves. Finding success in an increasingly dangerous world, %name% eventually came to be a known name, called upon as a sort of 'fixer' to come and ensure these villages would remain safe. Last you heard, he's purchased a plot of land and was raising a family far from the strife of the world."
        ru = ""
    }
    {
        en = "%name% left the collapsing company and returned to his village. Back in the militia, it wasn't long until {greenskins | raiders} attacked and he was called to action. It's said that he stood tall, rallying the defense as he slew through countless enemies before succumbing to mortal wounds. When you visited the village, you found children playfighting beneath a statue made in the militiaman's image."
        ru = ""
    }
    {
        en = "the Hangman"
        ru = "Вешатель"
    }
    {
        en = "the Executioner"
        ru = "Каратель"
    }
    {
        en = "the Lever Arm"
        ru = "Рычаг"
    }
    {
        en = "the Last Word"
        ru = "Последнее Слово"
    }
    {
        en = "the Cold"
        ru = "Холодный"
    }
    {
        en = "{With a past as a coroner, %name% is and always has been unperturbed by the sight of death. Once, when in his town the local peasantry were looking to lynch a grave robber, %name% volunteered to pull the lever. Transitioning from examining dead bodies to creating them didn't weight heavily on %name%'s conscience, and soon enough he became the town hangman. %name% returns your gaze with a cold expression and the eyes of a dead fish, stating simply that if acting the executioner could not stir his emotions, perhaps the heat of battle would.}"
        ru = "{Будучи в прошлом коронером, %name% всегда был равнодушен к виду смерти. Однажды, когда местные крестьяне хотели линчевать осквернителя могил, %name% сам вызвался дёрнуть рычаг. Переход от осмотра трупов к их созданию не тяготил совесть %name%, и вскоре он стал городским палачом. %name% смотрит на вас холодным взглядом мёртвой рыбы и просто говорит, что раз роль палача не всколыхнула его чувства, возможно, это сделает пыл битвы.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/herbalist_background.nut
    {
        en = "Herbalist"
        ru = "Травник"
    }
    {
        en = "Herbalists are capable of recognizing the medicinal properties of a plethora of plant life. They produce salves and creams that relieve pain and discomfort."
        ru = "Травники способны распознавать целебные свойства многочисленных растений. Они создают мази и кремы, облегчающие боль и дискомфорт."
    }
    {
        en = "Perhaps one of the sharpest men you've ever met, %name% the apprentice was the quickest learner in the %companyname%. With plenty of crowns stored, he retired from fighting to take his talents to the business world. Last you heard he was doing very well for himself across multiple trades. If you ever have a son, this is the man you'll send him to for apprenticeship."
        ru = ""
    }
    {
        en = "%name% the apprentice was, by far, the quickest learner in the %companyname%. Little surprise then that he was also one of the quickest to recognize its inevitable downfall and leave while he still could. Had he been born in a different time he would have gone on to do great things. Instead, many wars, invasions, and plagues spreading across the land ultimately ensured %name% and many other talented men went to total waste."
        ru = ""
    }
    {
        en = "the Herbalist"
        ru = "Травник"
    }
    {
        en = "the Apothecary"
        ru = "Аптекарь"
    }
    {
        en = "the Naturalist"
        ru = "Натуралист"
    }
    {
        en = "the Medicine Man"
        ru = "Знахарь"
    }
    {
        en = "the Healer"
        ru = "Целитель"
    }
    {
        mode = "pattern"
        en = "<exp:str_tag> Experience Gain"
        ru = "<exp> к получаемому опыту"
    }
    {
        en = "{The natural world hides incredible bounties, if one just knows where to look. %name% is one such man. His father was a soldier purported to survive wounds accrued over a hundred battles. This legend sprouted from the effective healing ointments and disinfecting salves produced by %name%'s mother. With both his parents having since died of old age, %name% hopes to use the secret remedies passed down to him to spark tales of an invincible mercenary company.}"
        ru = "{Природа скрывает невероятные сокровища, нужно лишь знать, где искать. %name% как раз из таких знатоков. Его отец был солдатом, который, как говорят, пережил раны от сотни битв. Эта легенда выросла из действенных целебных мазей и дезинфицирующих притираний, что готовила мать %name%. Теперь, когда оба родителя умерли от старости, %name% надеется использовать переданные ему тайные снадобья, чтобы породить легенды о неуязвимой наёмничьей компании.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/lancer_background.nut
    {
        en = "Lancer"
        ru = "Копейщик"
    }
    {
        en = "Lancers, true to their namesake, are extremely proficient with lances and polearms. Though they perfom well in jousting tournaments, in terms of general combat hardiness they fall short of true knights."
        ru = "Копейщики, верные своему призванию, чрезвычайно умелы в обращении с копьями и древковым оружием. Хоть они и преуспевают на рыцарских турнирах, в плане боевой выносливости они уступают истинным рыцарям."
    }
    {
        en = "the Lancer"
        ru = "Копейщик"
    }
    {
        en = "the Lance"
        ru = "Копьё"
    }
    {
        en = "the Jouster"
        ru = "Турнирщик"
    }
    {
        en = "the Spearman"
        ru = "Копьеносец"
    }
    {
        en = "the Child of Light"
        ru = "Дитя Света"
    }
    {
        en = "the Stabber"
        ru = "Протыкатель"
    }
    {
        en = "{Having received special combat training in his youth, %name% used his spear proficiency to earn his living by entering and winning jousting tournaments. Yet as time went on the lancer felt the glory in the jousting ring to be incomplete. Now he seeks to make a name for himself in no holds barred combat.}"
        ru = "{Получив особую боевую подготовку в юности, %name% использовал своё мастерство владения копьём, чтобы зарабатывать на жизнь участием и победами в рыцарских турнирах. Но со временем копейщик почувствовал, что славы на турнирной арене недостаточно. Теперь он стремится сделать себе имя в настоящих боях без правил.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/leper_background.nut
    {
        en = "Leper"
        ru = "Прокажённый"
    }
    {
        en = "Lepers are shunned from society for their ghastly appearance, but also benefit from a general lack of sensation."
        ru = "Прокажённых сторонится общество из-за их жуткого вида, но они также имеют преимущество в виде общего отсутствия чувствительности."
    }
    {
        en = "the Leper"
        ru = "Прокажённый"
    }
    {
        en = "the Ragged"
        ru = "Рванина"
    }
    {
        en = "the Sick"
        ru = "Болезный"
    }
    {
        en = "the Damned"
        ru = "Клятый"
    }
    {
        en = "the Unlucky"
        ru = "Невезучий"
    }
    {
        en = "the Blighted"
        ru = "Порченый"
    }
    {
        en = "{In his youth, %name% was a charmer full of panache, popular with every maiden in his village. | Coming from a long line of butchers, %name% never doubted that he would follow in his family's footsteps. | %name%’s life was an uneventful one - he was a simple man, making a modest living as a subsistence farmer.} {But after contracting a deadly plague, the man’s skin was left peeling and his face deformed. | Yet after a fateful day he blames on some woman he lay with, a horrible illness befell him, leaving his flesh decayed and numb. | It seemed his life would continue that way, but after mysterious symptoms started sprouting and his skin began to crumble, the people he once knew rejected him as a freak.} {Spurned from every other profession, the life of a mercenary was the only one left for him to turn to. You doubt it’ll be a successful life path for him, but it can’t be much worse than before. | He tells you he once fought off two children who pelted rocks at him as if you’ll be in respect of the feat. Considering the state he’s in now, you almost are. | Skin covered, voice hoarse, and arms weak, the man looks about as much of a mercenary as your grandmother. Just a bit less fierce. | You almost don’t feel right bringing the man into your ranks. But, who else to catch the arrows? | You doubt %name% will fit in a shieldwall, nor a pike line. Maybe he can be your mascot.}"
        ru = "{В юности %name% был обаятельным щёголем, любимцем всех деревенских девиц. | Происходя из длинной череды мясников, %name% никогда не сомневался, что пойдёт по стопам семьи. | Жизнь %name% была непримечательной - простой человек, едва сводивший концы с концами крестьянин.} {Но после того как он подхватил смертельную чуму, его кожа начала облезать, а лицо исказилось. | Но после рокового дня, в котором он винит некую женщину, с которой переспал, его поразила ужасная болезнь, оставившая его плоть гниющей и онемевшей. | Казалось, что так и будет продолжаться его жизнь, но после того как появились загадочные симптомы и кожа начала отваливаться, люди, которых он когда-то знал, отвергли его как урода.} {Отвергнутый всеми другими профессиями, жизнь наёмника осталась единственным доступным путём. Вы сомневаетесь, что это будет успешный выбор, но хуже уже точно не будет. | Он рассказывает вам, как однажды отбился от двух детей, кидавших в него камни, будто это какой-то подвиг. Учитывая его нынешнее состояние, почти что и правда подвиг. | С закрытой кожей, хриплым голосом и слабыми руками этот человек похож на наёмника не больше, чем ваша бабушка. Разве что чуть менее свирепый. | Вы почти чувствуете себя неправильно, беря его в отряд. Но кому ещё ловить стрелы? | Вы сомневаетесь, что %name% впишется в строй щитов или копейщиков. Может, сделать его талисманом отряда?}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/locksmith_background.nut
    {
        en = "Locksmith"
        ru = "Взломщик"
    }
    {
        en = "Locksmiths are men handy to have around when brute force isn't enough to crack open a door, catacomb, or treasure chest."
        ru = "Взломщики - полезные ребята, когда одной грубой силы не хватает, чтобы вскрыть дверь, катакомбы или сундук с сокровищами."
    }
    {
        en = "the Keymaster"
        ru = "Ключник"
    }
    {
        en = "the Locksmith"
        ru = "Слесарь"
    }
    {
        en = "the Keymaker"
        ru = "Мастер Ключей"
    }
    {
        en = "Lightfingered"
        ru = "Пальчики"
    }
    {
        en = "the Lockpicker"
        ru = "Медвежатник"
    }
    {
        en = "the Nimble"
        ru = "Проворный"
    }
    {
        en = "{As a locksmith by trade, %name% has always had a knack for breaking open hard to open doors, chests, or vaults to reveal the hidden treasures inside. However, when hard times struck his hometown %name% found a shortage of things worth cracking open. Now he seeks to join a mercenary troop, seeking to use his skills to uncover undiscovered riches hidden away in the wilderness.}"
        ru = "{Будучи взломщиком по ремеслу, %name% всегда имел особый талант к вскрытию неприступных дверей, сундуков и хранилищ, чтобы добраться до спрятанных внутри сокровищ. Однако когда в родном городе настали тяжёлые времена, %name% обнаружил, что взламывать стало особо нечего. Теперь он хочет примкнуть к отряду наёмников, чтобы применить свои навыки в поисках несметных богатств, сокрытых в диких землях.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/master_archer_background.nut
    {
        en = "Master Archer"
        ru = "Мастер-лучник"
    }
    {
        en = "Master archers have spent their lives honing their abilities. Though they are extremely talented marksmen, they are incompetent melee fighters."
        ru = "Мастера-лучники посвятили жизнь оттачиванию своего мастерства. Хоть они и невероятно метко стреляют, в ближнем бою от них толку мало."
    }
    {
        en = "the Master Marksman"
        ru = "Меткий Стрелок"
    }
    {
        en = "Sure-shot"
        ru = "Верняк"
    }
    {
        en = "the Headhunter"
        ru = "Охотник за Головами"
    }
    {
        en = "the Longbowman"
        ru = "Длинный лук"
    }
    {
        en = "the Peerless"
        ru = "Несравненный"
    }
    {
        en = "{%name% is considered to be one of the most dangerous bowmen to walk the earth. Legends say that once, he slew 20 men at range in as many seconds, and that subdivisions of noble spy networks would be dedicated to tracking his movements. Sadly, as time went on his old age has deteriorated the most important sense for an archer: sight. Suspecting that if he settled down eventually someone would seek to kill him, %name% now seeks to keep his skills sharp out on the battlefield.}"
        ru = "{%name% считается одним из самых опасных лучников на земле. Легенды гласят, что однажды он уложил 20 человек за столько же секунд, а благородные шпионские сети выделяли целые подразделения, чтобы следить за его перемещениями. К несчастью, время взяло своё, и старость ослабила самое важное для лучника чувство: зрение. Подозревая, что оседлая жизнь рано или поздно приведёт убийц к его порогу, %name% теперь поддерживает свои навыки острыми на поле боя.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/myrmidon_background.nut
    {
        en = "Myrmidon"
        ru = "Мирмидон"
    }
    {
        en = "Not quite strong enough to be raiders, not quite sneaky enough to be thieves, myrmidons nevertheless make up for their lack of standout talents with their eagerness to commit unscrupulous acts."
        ru = "Недостаточно сильны, чтобы быть разбойниками, недостаточно хитры, чтобы быть ворами - мирмидоны компенсируют отсутствие выдающихся талантов готовностью на любые бесчестные поступки."
    }
    {
        en = "the Rat"
        ru = "Крыса"
    }
    {
        en = "the Scummy"
        ru = "Мерзкий"
    }
    {
        en = "the Brutal"
        ru = "Жестокий"
    }
    {
        en = "the Criminal"
        ru = "Преступник"
    }
    {
        en = "the Highwayman"
        ru = "Разбойник"
    }
    {
        en = "{Tough enough to be a bandit, but not tough enough to be a bandit leader, %name% the myrmidon spent much of his time as the right hand man of a notorious brigand leader. This came to an abrupt end when a fellow bandit betrayed the location of their base camp and the group was ambushed by a large noble force and cohort of mercenaries. With his leader and most of his comrades killed, %name% has decided that it is time for a career change.}"
        ru = "{Достаточно крепкий для бандита, но недостаточно для главаря, мирмидон %name% долгое время был правой рукой известного атамана разбойников. Всё резко оборвалось, когда один из бандитов выдал расположение их лагеря, и на группу напал большой отряд дворянского войска с наёмниками. После гибели главаря и большинства товарищей %name% решил, что пора сменить род занятий.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/outlander_background.nut
    {
        en = "Outlander"
        ru = "Чужеземец"
    }
    {
        en = "Outlanders come from faraway lands that take months or even years to reach by ship. They are hard to read at the best of times, but especially so in combat."
        ru = "Чужеземцы прибывают из далёких краёв, до которых месяцы или даже годы пути по морю. Их трудно понять в обычной жизни, а уж в бою и подавно."
    }
    {
        en = "the Outsider"
        ru = "Чужак"
    }
    {
        en = "the Outlander"
        ru = "Чужеземец"
    }
    {
        en = "the Stranger"
        ru = "Странник"
    }
    {
        en = "the Foreigner"
        ru = "Иноземец"
    }
    {
        en = "the Silent"
        ru = "Молчаливый"
    }
    {
        en = "the Unfamiliar"
        ru = "Незнакомец"
    }
    {
        en = "Dimitri"
        ru = "Димитрий"
    }
    {
        en = "Alexander"
        ru = "Александр"
    }
    {
        en = "Maksim"
        ru = "Максим"
    }
    {
        en = "Ivan"
        ru = "Иван"
    }
    {
        en = "Vladislav"
        ru = "Владислав"
    }
    {
        en = "Vladmir"
        ru = "Владимир"
    }
    {
        en = "Yaroslav"
        ru = "Ярослав"
    }
    {
        en = "Bogdan"
        ru = "Богдан"
    }
    {
        en = "Miroslav"
        ru = "Мирослав"
    }
    {
        en = "Mihai"
        ru = "Михай"
    }
    {
        en = "Dorin"
        ru = "Дорин"
    }
    {
        en = "Irinel"
        ru = "Иринел"
    }
    {
        en = "Iskander"
        ru = "Искандер"
    }
    {
        en = "Benjamin"
        ru = "Бенджамин"
    }
    {
        en = "Noah"
        ru = "Ной"
    }
    {
        en = "Samuel"
        ru = "Самуэль"
    }
    {
        en = "Raphael"
        ru = "Рафаэль"
    }
    {
        en = "Jean"
        ru = "Жан"
    }
    {
        en = "Simon"
        ru = "Симон"
    }
    {
        en = "Arthur"
        ru = "Артур"
    }
    {
        en = "Tristan"
        ru = "Тристан"
    }
    {
        en = "Gaston"
        ru = "Гастон"
    }
    {
        en = "Yves"
        ru = "Ив"
    }
    {
        en = "Brice"
        ru = "Брис"
    }
    {
        en = "Etienne"
        ru = "Этьен"
    }
    {
        en = "Louis"
        ru = "Луи"
    }
    {
        en = "Henri"
        ru = "Генри"
    }
    {
        en = "Victor"
        ru = "Виктор"
    }
    {
        en = "Luc"
        ru = "Люк"
    }
    {
        en = "Leo"
        ru = "Лео"
    }
    {
        en = "Marcel"
        ru = "Марсель"
    }
    {
        en = "Guy"
        ru = "Гай"
    }
    {
        en = "Alexei"
        ru = "Алексей"
    }
    {
        en = "Artyom"
        ru = "Артём"
    }
    {
        en = "Igor"
        ru = "Игорь"
    }
    {
        en = "Kirill"
        ru = "Кирилл"
    }
    {
        en = "Lev"
        ru = "Лев"
    }
    {
        en = "Mikhail"
        ru = "Михаил"
    }
    {
        en = "Oleg"
        ru = "Олег"
    }
    {
        en = "Rolan"
        ru = "Ролан"
    }
    {
        en = "Sacha"
        ru = "Саша"
    }
    {
        en = "Vasili"
        ru = "Василий"
    }
    {
        en = "Viktor"
        ru = "Виктор"
    }
    {
        en = "Yuri"
        ru = "Юрий"
    }
    {
        en = "Conor"
        ru = "Конор"
    }
    {
        en = "Liam"
        ru = "Лиам"
    }
    {
        en = "Cillian"
        ru = "Киллиан"
    }
    {
        en = "Fionn"
        ru = "Фионн"
    }
    {
        en = "Finn"
        ru = "Финн"
    }
    {
        en = "Eoin"
        ru = "Эойн"
    }
    {
        en = "Oscar"
        ru = "Оскар"
    }
    {
        en = "Aidan"
        ru = "Эйдан"
    }
    {
        en = "Shane"
        ru = "Шейн"
    }
    {
        en = "Cormac"
        ru = "Кормак"
    }
    {
        en = "Colm"
        ru = "Колм"
    }
    {
        en = "Lorcan"
        ru = "Лоркан"
    }
    {
        en = "{%name%'s past is shrouded in mystery. There is only one thing for sure; the man is definitely not from here. How or why he ended up in this gods forsaken place, you do not know, and you have the distinct feeling you won't be finding out anytime soon.}"
        ru = "{Прошлое %name% окутано тайной. Ясно лишь одно — этот человек определённо не местный. Как и почему он оказался в этой забытой богами дыре, вы не знаете, и у вас стойкое чувство, что в ближайшее время не узнаете.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/painter_background.nut
    {
        en = "Painter"
        ru = "Художник"
    }
    {
        en = "Unsuited to the hardships of both combat and reality as a whole, painters nevertheless create beautiful artwork capable of briefly staving off the bleakness of life."
        ru = "Не приспособленные к тяготам боя и реальности в целом, художники всё же создают прекрасные произведения, способные ненадолго отогнать мрачность жизни."
    }
    {
        en = "the Artist"
        ru = "Артист"
    }
    {
        en = "the Painter"
        ru = "Живописец"
    }
    {
        en = "the Creator"
        ru = "Творец"
    }
    {
        en = "the Artisan"
        ru = "Рукодельник"
    }
    {
        en = "{In better days, %name% the painter spent his time painting beautiful landscapes and selling them to rich art collectors. Sadly, in these difficult times demand for such artwork has dried up. Lacking much in the way of other worldly skills, the hapless painter has been forced to turn to mercenary work. Though he certainly looks a little frail, he appears to be able to know his way around a sword about as well as any other man.}"
        ru = "{В лучшие времена художник %name% проводил дни, рисуя прекрасные пейзажи и продавая их богатым коллекционерам. Увы, в нынешние тяжёлые времена спрос на такое искусство иссяк. Не имея особых житейских навыков, незадачливому художнику пришлось податься в наёмники. Хоть он и выглядит немного хилым, похоже, что с мечом он управляется не хуже прочих.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/paladin_commander_background.nut
    {
        en = "Paladin"
        ru = "Паладин"
    }
    {
        en = "Paladins are men whose deeds have achieved legendary status. It is a rare sight to see one for hire, and rarer still for a mercenary group to be able to afford one."
        ru = "Паладины — люди, чьи подвиги стали легендарными. Редко встретишь такого наёмника, и ещё реже найдётся отряд, способный его нанять."
    }
    {
        en = "the Paladin"
        ru = "Паладин"
    }
    {
        en = "the Smiter"
        ru = "Сокрушитель"
    }
    {
        en = "the Blessed"
        ru = "Благословенный"
    }
    {
        en = "the Heroic"
        ru = "Героический"
    }
    {
        en = "Lightsworn"
        ru = "Светоносный"
    }
    {
        en = "Darkslayer"
        ru = "Истребитель Тьмы"
    }
    {
        en = "Lightbringer"
        ru = "Светоч"
    }
    {
        en = "the Knight"
        ru = "Рыцарь"
    }
    {
        en = "{A popular saying states, there are two types of men: good men, and powerful ones. %name% is a true diamond in the rough, his very existence perfectly contradicting the idiom. Peasants herald the man as a hero, for wherever he goes monster attacks invariably lessen, and then disappear, in intensity. You ask why he is even looking for a mercenary company. He merely tells you that he knows of dens of monsters that even he cannot handle alone. His exhorbitant asking salary is simply to cover his services for non monster related contracts in the meantime.}"
        ru = "{Есть такая поговорка: бывают люди хорошие и люди могущественные. %name% — настоящий самородок, само существование которого противоречит этой присказке. Крестьяне славят его как героя, ведь где бы он ни появился, нападения чудовищ неизменно становятся реже, а потом и вовсе прекращаются. На вопрос, зачем ему наниматься в отряд наёмников, он отвечает лишь, что знает о логовах монстров, с которыми даже ему не справиться в одиночку. А его баснословное жалование — всего лишь плата за участие в обычных походах между делом.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/pirate_background.nut
    {
        en = "Pirate"
        ru = "Пират"
    }
    {
        en = "Though sailing skills aren't applicable on dry land, fighting skills are. Pirates are used to the savagery of combat."
        ru = "Хоть навыки мореплавания и бесполезны на суше, боевые умения всегда при деле. Пираты привычны к жестокости битвы."
    }
    {
        en = "A former raider, %name% fit in well with the %companyname% and proved himself an excellent fighter. Having saved a veritable mountain of crowns, he retired from the company and returned from whence he came. He was last seen sailing a riverboat toward a small village."
        ru = ""
    }
    {
        en = "As the %companyname% speedily declined, %name% the raider departed from the company and went on his own way again. He returned to raiding, taking his greedy violence along the shorelines of river villages. You're not sure if it's true, but word has it that he was impaled with a pitchfork by a stable boy. Word has it that the town hoisted his body parts along the outer walls as a warning to future would-be raiders."
        ru = ""
    }
    {
        en = "the Cutthroat"
        ru = "Головорез"
    }
    {
        en = "the Marauder"
        ru = "Мародёр"
    }
    {
        en = "the Pirate"
        ru = "Пират"
    }
    {
        en = "Pegleg"
        ru = "Деревяшка"
    }
    {
        en = "the Albatross"
        ru = "Альбатрос"
    }
    {
        en = "the Toothless"
        ru = "Беззубый"
    }
    {
        en = "{Instilled with a love for the sea as a child, %name% started his life as a sailor aboard a merchant vessel. However, though the seas proved to be safe from monsters, it was unsafe from the greed and ambitions of man. Once while his ship was transporting some particularly valuable spices, it was boarded by pirates. His fellow crewmates were cut down almost to a man. %name% alone was spared because he provided the location of another treasure fleet. This second round of piracy was so successful that %name% was invited to join the pirate crew. Since then, merchant ships have become few and far between, and now %name% seeks to find his land legs again. He figures that mercenary work and piracy align well; you aren't entirely sure if you agree.}"
        ru = "{С детства влюблённый в море, %name% начал свой путь матросом на торговом судне. Но хоть море и оказалось безопасным от чудовищ, оно не защитило от жадности и амбиций людей. Однажды, когда его корабль перевозил особо ценные специи, на них напали пираты. Почти всю команду перебили. %name% пощадили лишь потому, что он выдал местонахождение другого торгового флота. Второй набег оказался настолько удачным, что %name% пригласили в пиратскую команду. С тех пор торговых судов стало меньше, и теперь %name% ищет работу на суше. Он считает, что ремесло наёмника мало чем отличается от пиратства. Вы не совсем уверены, что согласны с этим.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/roofer_background.nut
    {
        en = "Roofer"
        ru = "Кровельщик"
    }
    {
        en = "Due to the time spent atop ladders and in high places for their profession, roofers are sure-footed and have no issue maintaining their balance."
        ru = "Благодаря времени, проведённому на лестницах и высоте по долгу службы, кровельщики уверенно держат равновесие и не боятся высоты."
    }
    {
        en = "the Roofer"
        ru = "Кровельщик"
    }
    {
        en = "the Sure-footed"
        ru = "Верхолаз"
    }
    {
        en = "the Tiler"
        ru = "Черепица"
    }
    {
        en = "the Shingle Layer"
        ru = "Кровелье"
    }
    {
        en = "{%name% spent much of his life following the same trade as his father, inspecting, installing, and replacing roof materials to ensure that the buildings stayed upright and kept the cold out. Sadly, in recent times people have been much more concerned with getting food in their mouths instead of home maintenance. The roofer grumbles that winter will always come and that one day people will regret putting him out of work, but nonetheless until that day arrives he must find a way to get food in HIS mouth.}"
        ru = "{%name% большую часть жизни продолжал дело отца: осматривал, ставил и чинил крыши, чтобы здания стояли прочно и не пускали холод. Увы, в последнее время людей больше волнует, как прокормиться, чем поддержание домов. Кровельщик ворчит, что зима всё равно придёт и люди ещё пожалеют, что оставили его без работы, но пока этот день не настал, ему самому нужно как-то добывать себе пропитание.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/skirmisher_background.nut
    {
        en = "Skirmisher"
        ru = "Налётчик"
    }
    {
        en = "Skirmishers are light combatants that specialize in harassing larger groups of heavily armored soldiers. They can do a surprising amount of damage, but are unsuited to direct confrontation."
        ru = "Налётчики — лёгкие бойцы, специализирующиеся на изматывании больших групп хорошо бронированных солдат. Они способны нанести неожиданно большой урон, но не подходят для прямого столкновения."
    }
    {
        en = "the Skirmisher"
        ru = "Налётчик"
    }
    {
        en = "the Lightfooted"
        ru = "Легконогий"
    }
    {
        en = "the Ambusher"
        ru = "Засадник"
    }
    {
        en = "{%name% the skirmisher is a member of an emerging class of fighters specializing in midranged combat. Armed only with several packs of throwing weapons, and light armor, %name% has dedicated his life to dealing maximum damage to the enemy while skirting the edge of disaster. You ask %name% how he summons the courage to pursue such an aggressive fighting style. He merely shrugs and tells you that becoming a frontliner wasn't likely to earn him any heavier defensive gear anyway.}"
        ru = "{%name% налётчик принадлежит к новому поколению бойцов, что специализируются на бое со средней дистанции. Вооружённый лишь парой связок метательного оружия и одетый в лёгкую броню, %name% посвятил жизнь нанесению максимального урона врагу, балансируя на грани катастрофы. Ты спрашиваешь %name%, откуда у него смелость драться в таком агрессивном стиле. Он лишь пожимает плечами и отвечает, что сражаясь в первых рядах он всё равно не разжился бы более крепкой броней.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/surgeon_background.nut
    {
        en = "Surgeon"
        ru = "Лекарь"
    }
    {
        en = "Capable surgeons are a rare find, and often have their hands full with patching up wounded soldiers and villagers alike. They are used to the sight of blood and have operated in high stress situations, but are below average combatants."
        ru = "Умелые лекари - редкая находка, и они обычно по горло заняты, латая как раненых солдат, так и крестьян. Они привыкли к виду крови и умеют работать в стрессовых ситуациях, но не очень хороши в бою."
    }
    {
        en = "the Surgeon"
        ru = "Резака"
    }
    {
        en = "the Doc"
        ru = "Док"
    }
    {
        en = "the Doctor"
        ru = "Доктор"
    }
    {
        en = "the Medic"
        ru = "Медик"
    }
    {
        en = "{Learned medical men are a treasured rarity in these troubled times. Nonetheless, %name% is one such man, serving for years as a medic for noble armies and saving the lives of countless soldiers. However, when he failed to save an important nobleman's son, he was dishonorably discharged. Lacking the resources and assistants to work his previous miracles, %name% now seeks a much humbler life as a medic for a merceary group, stating that he has been due for some real adventure.}"
        ru = "{В эти неспокойные времена учёные лекари - редкое сокровище. %name% как раз из таких - годами он служил полковым медиком в армиях знати, спасая жизни бесчисленных солдат. Однако после того, как ему не удалось спасти сына важного дворянина, его с позором уволили. Лишившись ресурсов и помощников для совершения прежних чудес, %name% теперь ищет куда более скромной жизни медика в отряде наёмников, говоря, что давно пора попробовать настоящих приключений.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/torturer_background.nut
    {
        en = "Torturer"
        ru = "Истязатель"
    }
    {
        en = "All noblemen employ torturers, though few would admit it openly. Torturers' personalities vary wildly from cruel detachment to psychotic malice. Nevertheless, they are all brutally efficient at inflcting pain and permanent damage."
        ru = "Все дворяне держат заплечных дел мастеров, хоть мало кто признается в этом открыто. Характеры у палачей разные: от хладнокровной отрешённости до психотической злобы. Тем не менее, все они чрезвычайно искусны в причинении боли и увечий."
    }
    {
        en = "the Psychotic"
        ru = "Психопат"
    }
    {
        en = "the Malicious"
        ru = "Злобный"
    }
    {
        en = "the Torturer"
        ru = "Мучитель"
    }
    {
        en = "the Bloodletter"
        ru = "Кровопускатель"
    }
    {
        en = "the Cruel"
        ru = "Жестокий"
    }
    {
        en = "{Even in his youth, it was clear that %name%'s mind was wired in a sinister way. He reveled in the suffering of the weak, torturing frogs, rabbits, and even cats with perverse glee. It wasn't long before his father begged the local lord to either cure the lad or lock him away. The lord however, sensed talent and did neither; opting instead to hire him as a torturer. You don't know why he is looking for mercenary work now...but you get the feeling that you don't want to know.}"
        ru = "{Ещё в юности было ясно, что с головой у %name% не всё в порядке. Он упивался страданиями слабых, с извращённым удовольствием мучая лягушек, кроликов и даже кошек. Вскоре его отец умолял местного лорда либо вылечить парня, либо запереть. Но лорд, почуяв талант, не сделал ни того, ни другого, а нанял его палачом. Вы не знаете, почему он теперь ищет работу наёмника... но чувствуете, что лучше вам этого и не знать.}"
    }
    // FILE: scripts/skills/backgrounds/hackflows/town_watchman_background.nut
    {
        en = "Town Watchman"
        ru = "Стражник"
    }
    {
        en = "Town Watchmen are hired by burgomeisters to keep the peace and identify early threats to a town."
        ru = "Стражники нанимаются бургомистрами для поддержания порядка и раннего выявления угроз городу."
    }
    {
        en = "the Overseer"
        ru = "Надзиратель"
    }
    {
        en = "the Town Watchman"
        ru = "Страж"
    }
    {
        en = "the Night Owl"
        ru = "Сова"
    }
    {
        en = "the Patrolman"
        ru = "Патрульный"
    }
    {
        en = "{To be able to combat a threat, one must first know of its existence. %name% the town watchman was responsible for just that, able to spot threats at a distance and rouse the town militia whenever enemies were on the approach. However, one night after a town festival %name% was too plastered to notice brigands creeping up for a raid, and the resulting losses weighed too heavily on his conscience for him to continue serving at his post. Now he seeks to join a mercenary crew, knowing fully well that they go after bandits at the source on a regular basis.}"
        ru = "{Чтобы противостоять угрозе, нужно сначала узнать о её существовании. %name% служил городским стражем именно для этого - высматривал угрозы издалека и поднимал ополчение, когда враги приближались к городу. Однако после одного городского праздника %name% был слишком пьян, чтобы заметить бандитов, подкрадывающихся для набега. Понесённые потери слишком тяжело легли на его совесть, и он не смог продолжать службу. Теперь он хочет присоединиться к отряду наёмников, прекрасно зная, что они регулярно бьют разбойников в их логове.}"
    }
]
::Rosetta.add(rosetta, pairs);
