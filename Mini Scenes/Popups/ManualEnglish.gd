extends Node

func pages_setup(images):
	var en_pages = [   # Manual
	[['text', {'title':'THE LONG GAME', 
	'text':"""THE LONG GAME is a singleplayer medieval diplomacy game.
	Play the Prisoner\'s Dilemma over the course of 6 rounds, investigate opponents\' previous matches and influence them by sharing information and telling lies."""}
	],
	['text', {'title':'ACTIONS', 
	'text':"""Every player has 3 ACTIONS per round. They may be spent on:
	-BATTLE: take the Agressive stance against another character.
	-INVESTIGATION: get more information on another character.
	-INFLUENCE: change their position on the Throne Track.
	-DIPLOMACY: send messages to other players.
	-FORGERY: modify letters received from other players."""}
	], 
	['text', {'title':'BATTLE - THE PRISONER\'S DILEMMA',
	'text':"""The Prisoner's Dilemma is a game theory-related thought experiment. In it, each player chooses between a Passive Stance and an Agressive Stance.
	Being PASSIVE is overall better for the two players, but it opens the individual up to getting betrayed. It is also better diplomatically.
	Going AGRESSIVE, on the other hand, is way better for the individual, but it costs an Action and makes the enemy resentful."""}
	],
	['image', {'image':images[0], 'space':350}
	],
	['text', {'title':'INVESTIGATION',
	'text':"""Investigating a player can be really helpful to get a clue on what the enemy will play for the Prisoner's Dilemma. 
	It reveals three pieces of information:
	1- Their POINT COUNT.
	2- Their PREVIOUS MATCHES against all other players.
	3- Their RELATION (opinion) towards all other players.
	INVESTIGATION takes 1 ACTION."""}
	],
	['image', {'image':images[1], 'space':350}
	],
	['text', {'title':'INFLUENCE',
	'text':"""Influence is a measure of power and notoriety in the land. Players with greater Influence play ahead in the turn order and are more likely to receive messages and get attacked.
	A player can change their placing in the Influence track using the buttons on the lower part of the screen. Be aware that the track only updates at the end of each round."""}
	],
	['text', {'title':'DIPLOMACY', 
	'text':"""Finally, there's DIPLOMACY. Using the DIPLOMACY AREA menu shown above, the player can send messages to other characters. Likewise, other characters may send messages to the player from time to time.
	Sending a message costs 1 ACTION, and it is, in essence, the crux of the game. This system is what allows the player to truly manipulate other characters in powerful ways. There are two ways to do that:
	-WRITING: to write a message, select the three options (Subject, Action, Object) in the Diplomacy Area that you want to write. When you're done, click on Send.
	-RESENDING: you may also resend a message written by another player using the Envelope icon, making the receiver think that the original author sent it to them. This is a really powerful move, and can cause lots of havoc between would-be allies.
	In order to manipulate NPCs effectively, the player also has complete access to every character's behaviors and traits."""}
	],
	['text', {'title':'FORGERY',
	'text':"""Forgery opens even more avenues for deception. With it, players may create fake letters using messages 
	written by other players, altering their contents to eventually resend them. Each alteration costs 1 ACTION."""}
	],
	['text', {'title':'COUNCIL',
	'text':"""At the beginning of every turn, the leader of the Influence Track proposes a Decree to the Council. A
	Decree consists of a Stance and a Target, and, if passed, forces all players to take the chosen Stance against the
	chosen Target next turn.
	After the proposal is made, every player votes on the Decree, with the second player of the Track having its vote
	counted twice. If there are more 'Ayes' than 'Nays', the Decree passes."""}
	],
	['text', {'title':'TRAITS AND CHARACTERS',
	'text':"""This game comes with a document detailing each character's profile. They are divided in three parts:
	-INITIAL RELATIONS: their initial relations with other characters.
	-TRAITS: pieces of personality that govern, among other things, how they react to events and information.
	-ACTION PRIORITY: a list of actions that the character may take. They will always take the first action unless doing so is impossible and/or redundant, in which case they move on to the next action and repeat the evaluation process.
	That's all you need to know to play THE LONG GAME. Good luck!"""}
	]],
	# Characters
	[['text', {'title':'CHARACTERS - BEFORE READING',
	'text':"""Don't be intimidated by the size of this document. Skim it over first, experiment for a few games and come back later once you become more familiarized with the game."""}
	],
	['text', {'title':'TURN ORDER', 
	'text':"""Edraele/Obrulena/Horlin/Salem/Thoren/Kallysta/Grolk/Zardri"""}
	], 
	['text', {'title':'COMMON TERMS', 
	'text':"""INFORMATION/MESSAGES
	Made up of three parts, in order: Subject/Action/Object

	RELATIONSHIPS
	Relation track:
	Enraged/Hostile/Suspicious/Trustful/Friendly
	Enraging/Hostilized/Suspected/Trusted/Befriended

	STANCES
	Cooperate: Passive vs Passive
	Slaughter: Agressive vs Passive
	Get slaughtered: Passive vs Agressive
	Fight: Agressive vs Agressive"""}
	]],
	# Salem
	[['text', {'title':'SALEM', 
	'text':"""It's you. 
	Race: Human"""}
	],
	['text', {'title':'TRAITS', 
	'text':"""-PLAYER CHARACTER.
	-CHARISMATIC: at the start of the game, a random character is chosen to have their relation with Salem improved by one."""}
	]],
	# Grolk
	[['text', {'title':'GROLK',
	'text':"""Hates weak and/or traitorous players. Acts agressively and recklessly.
	Race: Orc"""}
	],
	['text', {'title':'INITIAL RELATIONS',
	'text':"""-HOSTILE to Salem.
	-SUSPICIOUS of Kallysta.
	-SUSPICIOUS of Horlin.
	-SUSPICIOUS of Obrulena.
	-HOSTILE to Thoren.
	-SUSPICIOUS to Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR',
	'text':"""Grolk doesn't get angry with battles, but does get angry with players who betray him or get slaughtered by him.
	He also hates players that attack his friends, and befriends players that like his friends. He also always believes his friends and ignore his enemies.
	He appreciates receiving true information, dislikes receiving lies, and once he's enraged with someone, will never forgive them."""}
	],
	['text', {'title':'WARLORD', 'color':Color.red,
	'text':"""One doesn't degrade relation with him when FIGHTING (Agressive vs Agressive) him. Becomes HOSTILE to players that are SLAUGHTERED (Passive vs Agressive) by him."""}
	],
	['text', {'title':'HATRED', 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED when a TRUSTED/BEFRIENDED player slaughters (Agressive vs Passive) him. Also becomes HOSTILE when a SUSPECTED player slaughters him."""}
	],
	['text', {'title':'BROTHERHOOD',  'color':Color.darkblue,
	'text':"""Becomes HOSTILE (unless already ENRAGED or FRIENDLY) to a player when he either discovers that this player will attack a TRUSTED/BEFRIENDED player, or that this player is HOSTILE/ENRAGED against a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'ALLIANCE', 'color':Color.blue,
	'text':"""Becomes TRUSTFUL (unless already ENRAGED or FRIENDLY) of a player when he either discovers that this player will ally with a TRUSTED/BEFRIENDED player, or that a TRUSTED/BEFRIENDED player is TRUSTFUL/FRIENDLY towards this player."""}
	],
	['text', {'title':'GENERAL', 'color':Color.cyan,
	'text':"""His relation can be improved by telling him information he discovers is true. The opposite happens with information he discovers is false."""}
	],
	['text', {'title':'SIMPLE-MINDED', 'color':Color.darkgreen,
	'text':"""Always believes info from a TRUSTED/BEFRIENDED player. Never believes info from others, though he remembers of what they said (for the purposes of General)."""}
	],
	['text', {'title':'IGNORANT', 'color':Color.darkolivegreen,
	'text':"""His relation with the Leader improves/degrades when they agree/disagree with his Voting Policies. Ignores other votes, however."""}
	],
	['text', {'title':'BITTER', 'space':180, 'color':Color.brown,
	'text':"""If ENRAGED with someone, nothing will make him change his Relation with them. Overrides all other Traits."""}
	],
	['text', {'title':'ACTION PRIORITY', 'space':400, 
	'text':"""1- Attack an ENRAGING player.
	2- Attack a HOSTILIZED player.
	3- Tell a TRUSTED/BEFRIENDED player about his Relation with other opponents.
	4- Tell a BEFRIENDED player about information he has.
	5- Attack a SUSPECTED player.
	6- If he's not the first in the Influence track, increase his Influence."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Aye if it's an attack against a HOSTILIZED/ENRAGING player.
	2a- Nay if it's an attack against BEFRIENDED players or himself.
	2b- Nay if it's peace with an ENRAGING player.
	3- Aye if the leader is BEFRIENDED.
	4a- Nay if it's an attack against a TRUSTED player.
	4b- Nay if it's peace with a HOSTILIZED player.
	5- Aye if the leader is TRUSTED.
	6- Nay."""}
	]],
	# Zardri
	[['text', {'title':'ZARDRI',
	'text':"""Born in the dark woods of Ecnar, Zardri stealthly searches for quick ambushes on downed enemies.
	Race: Goblin"""}
	],
	['text', {'title':'INITIAL RELATIONS',
	'text':"""-SUSPICIOUS to Salem.
	-SUSPICIOUS of Kallysta.
	-TRUSTFUL of Horlin.
	-SUSPICIOUS of Obrulena.
	-HOSTILE to Thoren.
	-SUSPICIOUS to Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR',
	'text':"""Zardri's main strategy is betrayal. When someone is being overwhelmed by attacks, Zardri takes this opportunity to
	backstab them in their most vulnerable state. He's also quite wary of getting backstabbed himself, and as such always disbelieves
	information from others and becomes enraged at the first sign of danger.'"""}
	],
	['text', {'title':'AMBUSHER', 'color':Color.mediumvioletred,
	'text':"""Becomes HOSTILE against Suspected players who are already HOSTILE/ENRAGED against two or more other players."""}
	],
	['text', {'title':'HATRED', 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED when a TRUSTED/BEFRIENDED player slaughters (Agressive vs Passive) him. Also becomes HOSTILE when a SUSPECTED player slaughters him."""}
	],
	['text', {'title':'PARANOID', 'color':Color.darkgray,
	'text':"""Becomes ENRAGED to a player he discovers is planning to attack him."""}
	],
	['text', {'title':'TREACHERY', 'color':Color.darkred,
	'text':"""Becomes HOSTILE to players that get slaughtered (Passive vs Aggressive) by him."""}
	],
	['text', {'title':'INTUITION', 'color':Color.gold,
	'text':"""When investigating the PLAYER CHARACTER, judges their Relation with other players based on their last match. 
	If there was a Slaughter on any side: ENRAGED
	If there was a Fight: HOSTILE 
	If there was Cooperation: TRUSTFUL 
	If there wasn't a match (Round 1): SUSPICIOUS"""}
	],
	['text', {'title':'DIM-WITTED', 'color':Color.palegreen,
	'text':"""Always believes the opposite of received messages. His relation with a player degrades by 1 every time they send a message to him."""}
	],
	['text', {'title':'IGNORANT', 'color':Color.darkolivegreen,
	'text':"""His relation with the Leader improves/degrades when they agree/disagree with his Voting Policies. Ignores other votes, however."""}
	],
	['text', {'title':'ACTION PRIORITY',
	'text':"""1- Attack an ENRAGING player.
	2- Attack a HOSTILIZED player.
	3- If it's an even round,  tell a lie to a HOSTILIZED player.
	4- Investigate a SUSPECTED player."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Nay if it’s an attack against himself.
	2a- Aye if it's an attack against someone else.
	2b- Aye if it’s peace with himself.
	"""}
	]],
	
	# Kallysta
	[['text', {'title':'KALLYSTA',
	'text':"""An individualistic and cunning leader. Kallysta distrusts almost everyone and is great at breaking strong alliances.
	Race: Tiefling"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':260, 
	'text':"""-SUSPICIOUS of Salem.
	-SUSPICIOUS of Grolk.
	-SUSPICIOUS of Zardri.
	-SUSPICIOUS of Horlin.
	-SUSPICIOUS of Obrulena.
	-SUSPICIOUS of Thoren.
	-SUSPICIOUS of Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':470, 
	'text':"""Kallysta's individualistic nature makes her unable to become Friendly to someone. She is quite good at finding and interpreting information, and uses this skill to predict other players' behavior.
	Kallysta's signature trait, Chain-Breaker, makes her Hostile to players with multiple allies. Using diplomacy and investigation, the tiefling leader can easily dismantle friendships within one or two turns.
	She also reacts to received information appropriately, defending herself from enemies."""}
	],
	['text', {'title':'PARANOID', 'space':170, 'color':Color.darkgray,
	'text':"""Becomes ENRAGED to a player she discovers is planning to attack her or is HOSTILE/ENRAGED against her."""}
	],
	['text', {'title':'JUSTICE', 'space':140, 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED to players that SLAUGHTER (Agressive vs Passive) her."""}
	],
	['text', {'title':'DEDUCTION', 'space':310, 'color':Color.yellow,
	'text':"""Can deduce the PLAYER CHARACTER's relation with other players based on other players' relation with him. For example, if she discovers that one is ENRAGED with the PLAYER CHARACTER, she will deduce that the PLAYER CHARACTER is ENRAGED with them."""}
	],
	['text', {'title':'CHAIN-BREAKER', 'space':170, 'color':Color.darkred,
	'text':"""Becomes HOSTILE to players who are considered by two or more other players (excluding herself) to be TRUSTED/BEFRIENDED."""}
	],
	['text', {'title':'CYNIC', 'space':90, 'color':Color.blueviolet,
	'text':"""Can never become FRIENDLY."""}
	],
	['text', {'title':'INTRIGUE', 'space':610, 'color':Color.darkcyan,
	'text':"""When receiving messages, cross-references it to previous data. If there's a contradiction or ilogical conclusion between message and data, believes in the data. If there's a contradiction or ilogical conclusion between messages, gives priority to the one from the most trusted sender.
	If there's no contradiction and the message comes from a Suspected player, investigates the validity of this information, if possible. If not, dismisses it.
	In any case, becomes ENRAGED if she discovers the message is false. Alternatively, if the message is true and doesn't involve the sender, then her relation with them increases."""}
	],
	['text', {'title':'DIPLOMATIC', 'color':Color.darkmagenta,
	'text':"""Her relation with other voters and the Leader improves/degrades when they agree/disagree with her Voting Policies."""}
	],
	['text', {'title':'ACTION PRIORITY',
	'text':"""1- Attack an ENRAGING player.
	2- If it's an odd round (except the first), investigate a SUSPECTED player.
	3- Resend a letter she believes is false and written by a HOSTILIZED player to a player who is SUSPICIOUS of them.
	4- First, choose a HOSTILIZED X player. Then, choose two players, Y and Z, who find X to be TRUSTED/BEFRIENDED.
	  4a- If Y has Allegiances and is ENRAGED with Z, tell Y that X will ally with Z.
	  4b- If Y has Alliance and is TRUSTFUL/FRIENDLY both to her and Z, tell Y that X will attack Z.
	5- Attack a HOSTILIZED player.
	6- Tell a SUSPECTED player she will co-op with them.
	7- Investigate a HOSTILIZED player.
	8- Investigate a TRUSTED player."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Nay if it’s an attack against herself.
	2a- Aye if it's an attack against a HOSTILIZED/ENRAGING player.
	2b- Aye if it’s peace with herself.
	3- Nay if the leader is HOSTILIZED/ENRAGING.
	"""}
	]],
	
	# Horlin
	[['text', {'title':'HORLIN', 'space':180,
	'text':"""Although his military abilities are beyond subpar, the astute High Mayor of Glittergold has proven great talent for both writing and falsification.
	Race: Gnome"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':260, 
	'text':"""-SUSPICIOUS of Salem.
	-SUSPICIOUS of Grolk.
	-TRUSTFUL of Zardri.
	-SUSPICIOUS of Kallysta.
	-FRIENDLY with Obrulena.
	-TRUSTFUL of Thoren.
	-TRUSTFUL of Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':480, 
	'text':("Horlin is a terrible general, but a great writer. As such, he interprets messages received not as information, but as " +
	"requests. When someone sends him a request, he tries to falsify one of his letters and send them to the requester, which they can use " +
	"as they see fit. Apart from that, Horlin has pretty average traits, reacting to other types of information appropriately.")}
	],
	['text', {'title':'REACTIVE', 'space':250, 'color':Color.aqua,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player he discovers is planning to attack him or is HOSTILE/ENRAGED against him. Becomes SUSPICIOUS of an ENRAGING/HOSTILIZED player that he discovers is planning to ally with him."""}
	],
	['text', {'title':'JUSTICE', 'space':140, 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED to players that SLAUGHTER (Agressive vs Passive) him."""}
	],
	['text', {'title':'DEDUCTION', 'space':310, 'color':Color.yellow,
	'text':"""Can deduce the PLAYER CHARACTER's relation with other players based on other players' relation with him. For example, if she discovers that one is ENRAGED with the PLAYER CHARACTER, she will deduce that the PLAYER CHARACTER is ENRAGED with them."""}
	],
	['text', {'title':'WRITER', 'color':Color.lightsteelblue,
	'text':('Messages whose subject isn’t the sender are interpreted as requests, not information. For example, if someone sends ' +
	'"X will attack Y" to him, he will try to falsify a letter written by X that says “X will attack Y” and send this back to the requester.')}
	],
	['text', {'title':'ARCHIVIST', 'space':400, 'color':Color.khaki,
	'text':('Orders requests based on relation level with the requester, and, if tied, by receipt order. Ignores requests that involve himself.' +
	' Denies requests from HOSTILIZED and ENRAGING players. After resolving a request, his relation with the requester increases.')}
	],
	['text', {'title':'DIPLOMATIC', 'color':Color.darkmagenta,
	'text':"""His relation with other voters and the Leader improves/degrades when they agree/disagree with his Voting Policies."""}
	],
	['text', {'title':'ACTION PRIORITY', 'space':400, 
	'text':"""1- With his current request, modify a letter from X until it mirrors the request.
	2- With his current request, resend the modified letter to the requester. Advance to next request.
	3- Investigate a SUSPECTED/HOSTILIZED player.
	4- Attack an ENRAGING player.
	5- Investigate a TRUSTED player.
	6- If he's not the second in the Influence Track, increase his Influence.
	7- Attack a HOSTILIZED player."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Nay if it’s an attack against himself.
	2- Aye if the Leader is BEFRIENDED.
	3- Aye if it’s peace to himself.
	4- Nay if the leader is HOSTILIZED/ENRAGING.
	"""}
	]],
	
	# Obrulena
	[['text', {'title':'OBRULENA', 'space':260,
	'text':"""The nomadic zealot from the Gigraltar plains hopes to bring peace to the entire region, always
	trying to mediate conflicts between her allies and opponents. 
	Race: Loxodon"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':260, 
	'text':"""-SUSPICIOUS of Salem.
	-HOSTILE of Grolk.
	-SUSPICIOUS of Zardri.
	-TRUSTFUL of Kallysta.
	-TRUSTFUL of Horlin.
	-TRUSTFUL of Thoren.
	-SUSPICIOUS of Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':380, 
	'text':"""Obrulena, as a promoter of peace, quickly makes friends to those she corresponds with or is already a friend of a friend. 
	Conversely, any slaughter someone commits is a grave offense to her dogmas. She always believes her allies and never believes players whom she doesn't yet trust. Due to her traditional views, she also has 
	greater respect to the player with the most Influence."""}
	],
	['text', {'title':'SERENE', 'space':140, 'color':Color.whitesmoke,
	'text':"""Her Relation with a player improves every time she sends a letter to them."""}
	],
	['text', {'title':'PACIFIST', 'space':170, 'color':Color.aqua,
	'text':"""Her Relation with a player degrades twice for each SLAUGHTER (Agressive vs Passive) she discovers they commited."""}
	],
	['text', {'title':'REACTIVE', 'color':Color.aqua,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player she discovers is planning to attack her or is HOSTILE/ENRAGED against her. Becomes SUSPICIOUS of an ENRAGING/HOSTILIZED player she discovers is planning to ally with her."""}
	],
	['text', {'title':'INTUITION', 'space':340, 'color':Color.gold,
	'text':"""When investigating the PLAYER CHARACTER, judges their Relation with other players based on their last match. 
	If there was a Slaughter on any side: ENRAGED
	If there was a Fight: HOSTILE 
	If there was Cooperation: TRUSTFUL 
	If there wasn't a match (Round 1): SUSPICIOUS"""}
	],
	['text', {'title':'ALLIANCE', 'space':260, 'color':Color.blue,
	'text':"""Becomes TRUSTFUL (unless already ENRAGED or FRIENDLY) of a player when he either discovers that this player will ally with a TRUSTED/BEFRIENDED player, or that a TRUSTED/BEFRIENDED player is TRUSTFUL/FRIENDLY towards this player."""}
	],
	['text', {'title':'SIMPLE-MINDED', 'space':190, 'color':Color.darkgreen,
	'text':"""Always believes info from a TRUSTED/BEFRIENDED player. Never believes info from others, though she remembers of what they said."""}
	],
	['text', {'title':'DIPLOMATIC', 'color':Color.darkmagenta,
	'text':"""Her relation with other voters and the Leader improves/degrades when they agree/disagree with her Voting Policies."""}
	],
	['text', {'title':'ACTION PRIORITY', 'space':400, 
	'text':"""1- Only once per round. Find two TRUSTED/BEFRIENDED players that aren't both TRUSTFUL/FRIENDLY of each other:
	  1a- If one of them has Alliance but not Allegiances, tell this player that the other will co-op with Obrulena. 
	  1b- Otherwise, tell them that the other will co-op with them.
	2- Only if she sent a letter in (1):
	  2a- If the letter's subject has Alliance but not Allegiances, tell this player that the letter's recipient will co-op with Obrulena. 
	  2b- Otherwise, tell them that they will co-op with them.
	3- Tell a SUSPECTED/TRUSTED player without Intrigue that she will coop with them.
	4- Investigate the Subject of a message she believes in that involves an attack.
	4- Attack an ENRAGING player.
	5- Attack a HOSTILIZED player.
	6- Tell a HOSTILIZED player she will attack them.
	7- If she's not the first in the Influence Track, increase her Influence, unless the leader has Heir and is TRUSTED/BEFRIENDED.
	8- Investigate a SUSPECTED player."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Aye if the Leader is BEFRIENDED and it’s an attack against a HOSTILIZED/ENRAGING player.
	2- Nay if it’s peace and both Leader and target are HOSTILIZED/ENRAGING.
	3- Nay if it’s an attack.
	4- Aye if it’s peace.
	"""}
	],
	['text', {'title':'PROPOSAL PRIORITY',
	'text':"""1- Peace to another TRUSTED/BEFRIENDED player.
	2- Peace to herself."""}
	]],
	
	# Thoren
	[['text', {'title':'THOREN', 'space':180,
	'text':"""A great ally and a fearsome opponent. Thoren greatly values loyalty above all else.
	Race: Dwarf"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':260, 
	'text':"""-HOSTILE to Salem.
	-ENRAGED with Grolk.
	-SUSPICIOUS of Zardri.
	-SUSPICIOUS of Kallysta.
	-TRUSTFUL of Horlin.
	-SUSPICIOUS of Obrulena.
	-TRUSTFUL of Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':480, 
	'text':"""Thoren believes in his friends and mostly disbelieves his enemies. He tries to investigate suspicious info, but ignores it if he can't.
	He also hates players that attack his friends, and befriends players that like his friends. However, if someone befriends his enraging enemies, he'll become hostile towards them.
	Thoren reacts appropriately to information he believes, attacking enemies who attack him and making peace with those that do the same. He hates being betrayed."""}
	],
	['text', {'title':'REACTIVE', 'space':250, 'color':Color.aqua,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player he discovers is planning to attack him or is HOSTILE/ENRAGED against him. Becomes SUSPICIOUS of an ENRAGING/HOSTILIZED player that he discovers is planning to ally with him."""}
	],
	['text', {'title':'JUSTICE', 'space':140, 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED to players that SLAUGHTER (Agressive vs Passive) him."""}
	],
	['text', {'title':'INTUITION', 'space':340, 'color':Color.gold,
	'text':"""When investigating the PLAYER CHARACTER, judges their Relation with other players based on their last match. 
	If there was a Slaughter on any side: ENRAGED
	If there was a Fight: HOSTILE 
	If there was Cooperation: TRUSTFUL 
	If there wasn't a match (Round 1): SUSPICIOUS"""}
	],
	['text', {'title':'BROTHERHOOD', 'space':260, 'color':Color.darkblue,
	'text':"""Becomes HOSTILE (unless already ENRAGED or FRIENDLY) to a player when he either discovers that this player will attack a TRUSTED/BEFRIENDED player, or that this player is HOSTILE/ENRAGED against a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'ALLIANCE', 'space':260, 'color':Color.blue,
	'text':"""Becomes TRUSTFUL (unless already ENRAGED or FRIENDLY) of a player when he either discovers that this player will ally with a TRUSTED/BEFRIENDED player, or that a TRUSTED/BEFRIENDED player is TRUSTFUL/FRIENDLY towards this player."""}
	],
	['text', {'title':'ALLEGIANCES', 'space':220, 'color':Color.orange,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player when he discovers that this player will ally with an ENRAGING player or that this player finds an ENRAGING player to be TRUSTFUL/FRIENDLY."""}
	],
	['text', {'title':'GENERAL', 'space':180, 'color':Color.cyan,
	'text':"""His relation can be improved by telling him information he discovers is true. The opposite happens with information he discovers is false."""}
	],
	['text', {'title':'TACTICAL', 'space':400, 'color':Color.lightgreen,
	'text':"""Always believes info from a TRUSTED/BEFRIENDED player. Believes the opposite of what a HOSTILE/ENRAGING player tells him about other players, and dismisses what they say if it involves themselves. 
	Investigates info from SUSPECTED players, or dismisses it if he can't.  He still remembers of what was actually said for two rounds (for the purposes of General)."""}
	],
	['text', {'title':'DIPLOMATIC', 'color':Color.darkmagenta,
	'text':"""His relation with other voters and the Leader improves/degrades when they agree/disagree with his Voting Policies."""}
	],
	['text', {'title':'ACTION PRIORITY', 'space':400, 
	'text':"""1- Attack an ENRAGING player.
	2- Attack a HOSTILIZED player.
	3- Tell a TRUSTED/BEFRIENDED player that an ENRAGING player will attack him.
	4- Share information with a TRUSTED/BEFRIENDED player about an incoming attack towards them.
	5- Tell a TRUSTED/BEFRIENDED player that a HOSTILIZED player will attack him.
	6- Investigate the Subject of a message he received from a SUSPECTED player.
	7- Tell a TRUSTED/BEFRIENDED player that another TRUSTED/BEFRIENDED player will ally with him.
	8- Investigate a SUSPECTED player.
	9- If he's not the first in the Influence track, increase his Influence, unless the leader has Heir and is TRUSTED/BEFRIENDED.
	10- Investigate a TRUSTED player."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Nay if it’s an attack against himself or a BEFRIENDED player.
	2- Aye if the Leader is BEFRIENDED.
	3- Nay if it’s an attack against a TRUSTED player.
	4- Aye if it's an attack against a HOSTILIZED/ENRAGING player.
	5- Aye if the Leader is TRUSTED.
	6- Nay if the leader is HOSTILIZED/ENRAGING."""}
	],
	['text', {'title':'PROPOSAL PRIORITY',
	'text':"""1- Attack on an ENRAGING player.
	2- Attack on a HOSTILIZED player.
	3- Peace to himself."""}
	]],
	
	# Edraele
	[['text', {'title':'EDRAELE', 'space':180,
	'text':"""Manipulative. Acts friendly but may backstab. Dinamically adapts to the player.
	Race: Elf"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':260, 
	'text':"""-SUSPICIOUS of Salem.
	-SUSPICIOUS to Grolk.
	-SUSPICIOUS of Zardri.
	-SUSPICIOUS of Kallysta.
	-TRUSTFUL of Horlin.
	-SUSPICIOUS of Obrulena.
	-TRUSTFUL of Thoren."""}
	],
	['text', {'title':'TRAITS - TL;DR',
	'text':"""Edraele changes her behavior based on how she views the Player Character. When receiving information, she cross-references it to previous data and determines what is true and what is not.
	She reacts appropriately to information she believes, attacking enemies who attack her and making peace with those that do the same. She also imitates the feelings of her opponents, if possible.
	She gets Enraged with players that betray her and Hostile to players that she just betrayed. Finally, she dislikes players that ally with her enemies and likes players that attack them instead."""}
	],
	['text', {'title':'AGENDA', 'color':Color.pink,
	'text':"""Her Action Priority changes at the beginning of each round based on her Relation with the PLAYER CHARACTER."""}
	],
		['text', {'title':'TREACHERY', 'color':Color.darkred,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to to players that get SLAUGHTERED (Passive vs Agressive) by her."""}
	],
	['text', {'title':'JUSTICE', 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED to players that SLAUGHTER (Agressive vs Passive) her."""}
	],
	['text', {'title':'REACTIVE', 'color':Color.aqua,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player she discovers is planning to attack her or is HOSTILE/ENRAGED against her. Becomes SUSPICIOUS of an ENRAGING/HOSTILIZED player she discovers is planning to ally with her."""}
	],
	['text', {'title':'JEALOUSY', 'color':Color.purple,
	'text':"""Becomes ENRAGED at characters she discovers have more points than her. If she discovers that this ceased to be the case, becomes HOSTILE instead."""}
	],
	['text', {'title':'DEDUCTION', 'color':Color.yellow,
	'text':"""Can deduce the PLAYER CHARACTER's relation with other players based on other players' relation with him. For example, if she discovers that one is ENRAGED with the PLAYER CHARACTER, she will deduce that the PLAYER CHARACTER is ENRAGED with them."""}
	],
	['text', {'title':'INSIGHT', 'space':340, 'color':Color.blanchedalmond,
	'text':"""Can deduce the Player Character's relation with other players based on how they vote on specific proposals with said players as target:
	-Aye for War: ENRAGED
	-Nay for Peace: HOSTILE
	-Null: SUSPICIOUS
	-Aye for Peace: TRUSTFUL
	-Nay for War: FRIENDLY"""}
	],
	['text', {'title':'ALLEGIANCES', 'color':Color.orange,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player when he discovers that this player will ally with an ENRAGING player or that this player finds an ENRAGING player to be TRUSTFUL/FRIENDLY."""}
	],
	['text', {'title':'FACADE', 'color':Color.black,
	'text':"""If not ENRAGED with a player, imitates their relation after investigating them."""}
	],
	['text', {'title':'INTRIGUE','color':Color.darkcyan,
	'text':"""When receiving messages, cross-references it to previous data. If there's a contradiction or ilogical conclusion between message and data, believes in the data. If there's a contradiction or ilogical conclusion between messages, gives priority to the one from the most trusted sender.
	If there's no contradiction and the message comes from a Suspected player, investigates the validity of this information, if possible. If not, dismisses it.
	In any case, becomes ENRAGED if she discovers the message is false. Alternatively, if the message is true and doesn't involve the sender, then her relation with them increases."""}
	],
	['text', {'title':'DIPLOMATIC', 'color':Color.darkmagenta,
	'text':"""Her relation with other voters and the Leader improves/degrades when they agree/disagree with her Voting Policies."""}
	],
	['text', {'title':'ACTION PRIORITY (FRIENDLY/TRUSTFUL)', 'space':800, 
	'text':"""1- If it's Round 6, attack any player.
	2- Investigate a HOSTILIZED/SUSPECTED player that has Warlord.
	3- Attack an ENRAGING player.
	4- Attack a HOSTILIZED player.
	5- Attack a SUSPECTED player that has Warlord, but only if they are SUSPICIOUS of at least one other player.
	6- Share information with a HOSTILIZED/SUSPECTED player with Warlord about an incoming attack towards them.
	7- Investigate the Subject of a message she received from a SUSPECTED player.
	8- If she's not the first in the Influence track, increase her Influence.
	9- Tell a TRUSTED/BEFRIENDED player with BROTHERHOOD that a HOSTILIZED/ENRAGING player will attack her.
	10- Choose any X player of whom Edraele has a letter. Then, choose another Y player who’s TRUSTFUL/FRIENDLY of them. Spend Actions to modify X’s letter to say “Edraele will co-op with Y”.
	11- Resend X’s modified letter to Y.
	12- Investigate a player."""}
	],
	['text', {'title':'ACTION PRIORITY (SUSPICIOUS)', 'space':680, 'color':Color.black,
	'text':"""1- If it's Round 6, attack any player.
	2- Investigate a HOSTILIZED/SUSPECTED player that has Warlord.
	3- Attack an ENRAGING player.
	4- Attack a HOSTILIZED player.
	5- Attack a SUSPECTED player that has Warlord, but only if they are SUSPICIOUS of at least one other player.
	6- Share information with a HOSTILIZED/SUSPECTED player with Warlord about an incoming attack towards them.
	7- Investigate the Subject of a message she received from a SUSPECTED player.
	8- Investigate a SUSPECTED player.
	9- Choose any X player of whom Edraele has a letter. Then, choose a Y player who’s TRUSTFUL/FRIENDLY of them. Spend Actions to modify X’s letter to say “X will attack Y”.
	10- Resend X’s modified letter to Y.
	11- Tell a TRUSTED/BEFRIENDED player with BROTHERHOOD that a SUSPECTED player will attack her.
	12- If she's not the first in the Influence track, increase her Influence.
	13- Attack a SUSPECTED player."""}
	],
	['text', {'title':'ACTION PRIORITY (HOSTILE/ENRAGED)', 'space':280, 'color':Color.black,
	'text':"""1- Attack an ENRAGING player.
	2- Tell a TRUSTED/BEFRIENDED player with Brotherhood that an ENRAGING player mentioned in (1) will attack her.
	3- Resend a letter she believes is false and written by an ENRAGING player mentioned in (1) to a player that is SUSPICIOUS of this player.
	4- Attack a HOSTILIZED player.
	5- Tell a TRUSTED/BEFRIENDED player with Brotherhood that a HOSTILIZED player will attack her.
	6- If she's not the first in the Influence track, increase her Influence."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Nay if it’s an attack against herself or a BEFRIENDED player.
	2- Aye if it's an attack against a HOSTILIZED/ENRAGING player.
	3- Aye if the Leader is TRUSTED/BEFRIENDED.
	4- Nay if the leader is HOSTILIZED/ENRAGING.
	"""}
	],
	['text', {'title':'PROPOSAL PRIORITY',
	'text':"""1- Attack on an ENRAGING player.
	2- Attack on a HOSTILIZED player.
	3- Peace to himself.
	"""}
	]],
	
	# Drakoth
	[['text', {'title':'DRAKOTH', 'space':180,
	'text':"""The brash heir to the Empire's throne is as good in battle as he is in court, using his dynastic powers to their full potential.
	Race: Dragonborn"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':260, 
	'text':"""-SUSPICIOUS of Salem.
	-HOSTILE to Grolk.
	-HOSTILE to Zardri.
	-HOSTILE to Kallysta.
	-TRUSTFUL of Obrulena.
	-TRUSTFUL of Horlin.
	-TRUSTFUL of Thoren."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':480, 
	'text':("Drakoth is the ambitious heir to the empire's throne, and as such evaluates the player " +
	"based on they way they vote and becomes Enraged if someone tries to take the Leader position away from him. " +
	"As a fearsome and honorable warrior, Drakoth is very keen on protecting and consolidating his circle of allies, " +
	"becoming Trustful of those who trust his allies but becoming Hostile against those who attack them. He also doesn't " +
	"appreciate when someone allies with his most Enraging enemies. Aside from that, Drakoth reacts appropriately to " +
	"incoming agression, attacking enemies who attack him and making peace with those that do the same." +
	"He does, however, only believe on his allies, making manipulation a bit trickier to pull off.")}
	],
	['text', {'title':'STRATEGY', 'color':Color.brown,
	'text':"""His Proposal Priority changes at the beginning of each round based on his Relation with the Player Character."""}
	],
	['text', {'title':'HEIR', 'color':Color.darkviolet,
	'text':"""Becomes ENRAGED to players who steal his Leader position."""}
	],
	['text', {'title':'REACTIVE', 'space':250, 'color':Color.aqua,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player he discovers is planning to attack him or is HOSTILE/ENRAGED against him. Becomes SUSPICIOUS of an ENRAGING/HOSTILIZED player that he discovers is planning to ally with him."""}
	],
	['text', {'title':'JUSTICE', 'space':140, 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED to players that SLAUGHTER (Agressive vs Passive) him."""}
	],
	['text', {'title':'INSIGHT', 'space':340, 'color':Color.lightseagreen,
	'text':"""Can deduce the Player Character's relation with other players based on how they vote on specific proposals with said players as target:
	-Aye for War: ENRAGED
	-Nay for Peace: HOSTILE
	-Null: SUSPICIOUS
	-Aye for Peace: TRUSTFUL
	-Nay for War: FRIENDLY"""}
	],
	['text', {'title':'BROTHERHOOD', 'space':260, 'color':Color.darkblue,
	'text':"""Becomes HOSTILE (unless already ENRAGED or FRIENDLY) to a player when he either discovers that this player will attack a TRUSTED/BEFRIENDED player, or that this player is HOSTILE/ENRAGED against a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'ALLIANCE', 'space':260, 'color':Color.blue,
	'text':"""Becomes TRUSTFUL (unless already ENRAGED or FRIENDLY) of a player when he either discovers that this player will ally with a TRUSTED/BEFRIENDED player, or that a TRUSTED/BEFRIENDED player is TRUSTFUL/FRIENDLY towards this player."""}
	],
	['text', {'title':'ALLEGIANCES', 'space':220, 'color':Color.orange,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player when he discovers that this player will ally with an ENRAGING player or that this player finds an ENRAGING player to be TRUSTFUL/FRIENDLY."""}
	],
	['text', {'title':'SIMPLE-MINDED', 'color':Color.darkgreen,
	'text':"""Always believes info from a TRUSTED/BEFRIENDED player. Never believes info from others, though he remembers of what they said."""}
	],
	['text', {'title':'DIPLOMATIC', 'color':Color.darkmagenta,
	'text':"""His relation with other voters and the Leader improves/degrades when they agree/disagree with his Voting Policies."""}
	],
	['text', {'title':'ACTION PRIORITY',
	'text':"""1- Attack an ENRAGING player.
	2- Tell a TRUSTED/BEFRIENDED player with BROTHERHOOD that an ENRAGING player will attack him.
	3- Attack a HOSTILIZED player.
	4- If he's not the first in the Influence track, increase his Influence.
	5- Tell a TRUSTED/BEFRIENDED player with BROTHERHOOD that a HOSTILIZED player will attack him.
	6- Investigate a SUSPICIOUS player.
	7a- If it's an even round, investigate a HOSTILIZED/ENRAGING player.
	7b- If it's an odd round, investigate a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Nay."""}
	],
	['text', {'title':'PROPOSAL PRIORITY (SUSPICIOUS/TRUSTFUL/FRIENDLY)',
	'text':"""1- If the sum of all votes from TRUSTED/BEFRIENDED players is over 2, peace to himself.
	2- If no TRUSTED/BEFRIENDED players with ALLEGIANCES are ENRAGED with a SUSPECTED player, peace to this SUSPECTED player.
	3- If no TRUSTED/BEFRIENDED players are BEFRIENDED with a HOSTILIZED/ENRAGING player, attack on this HOSTILIZED/ENRAGING player.
	4- Peace to himself."""}
	],
	['text', {'title':'PROPOSAL PRIORITY (HOSTILE/ENRAGED)',
	'text':"""1- Attack on an ENRAGING player.
	2- Attack on a HOSTILIZED player."""}
	]],
	]
	
	return en_pages
