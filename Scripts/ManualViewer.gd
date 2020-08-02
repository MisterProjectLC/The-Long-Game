extends 'res://Scripts/popup.gd'

signal closed_manual

export(PackedScene) var paragrapher
export(PackedScene) var imager

var scroll_speed = 80
var min_height = 40

var current_page = 0

var en_pages = []
var br_pages = []
var de_pages = []

var pages = []
export var images = []

var instances = []

# ----------------- ANIMATION -----------------

func _ready():
	_sizer = Vector2(12, 4)
	_target_sizer = Vector2(866, 599)
	_position = Vector2(520, 302)
	_target_position = Vector2(72, 1)
	_speed = 2
	setup()
	
func _process(delta):
	processing(delta)
	
# --------------- SETUP -----------------------------

func language(language):
	var dictionary = [en_pages, br_pages, de_pages]
	pages = dictionary[language]

func manual_setup(_new):
	current_page = _new
	en_pages_setup()
	br_pages_setup()
	de_pages_setup()
	language(Global.language)

func en_pages_setup():
	en_pages = [   # Manual
	[['text', {'title':'THE LONG GAME', 'space':260,
	'text':"""THE LONG GAME is a singleplayer medieval diplomacy game.
	Play the Prisoner\'s Dilemma over the course of 6 rounds, investigate opponents\' previous matches and influence them by sharing information and telling lies."""}
	],
	['text', {'title':'ACTIONS', 'space':440, 
	'text':"""Every player has 3 ACTIONS per round. They may be spent on:
	-BATTLE: take the Agressive stance against another character.
	-INVESTIGATION: get more information on another character.
	-INFLUENCE: change their position on the Throne Track.
	-DIPLOMACY: send messages to other players."""}
	], 
	['text', {'title':'BATTLE - THE PRISONER\'S DILEMMA', 'space':440, 
	'text':"""The Prisoner's Dilemma is a game theory-related thought experiment. In it, each player chooses between a Passive Stance and an Agressive Stance.
	Being PASSIVE is overall better for the two players, but it opens the individual up to getting betrayed. It is also better diplomatically.
	Going AGRESSIVE, on the other hand, is way better for the individual, but it costs an Action and makes the enemy resentful."""}
	],
	['image', {'image':images[0], 'space':350}
	],
	['text', {'title':'INVESTIGATION', 'space':500, 
	'text':"""Investigating a player can be really helpful to get a clue on what the enemy will play for the Prisoner's Dilemma. 
	It reveals three pieces of information:
	1- Their POINT COUNT.
	2- Their PREVIOUS MATCHES against all other players.
	3- Their RELATION (opinion) towards all other players.
	INVESTIGATION takes 1 ACTION."""}
	],
	['image', {'image':images[1], 'space':350}
	],
	['text', {'title':'INFLUENCE', 'space':380,
	'text':"""Influence is a measure of power and notoriety in the land. Players with greater Influence play ahead in the turn order and are more likely to receive messages and get attacked.
	A player can change their placing in the Influence track using the buttons on the lower part of the screen. Be aware that the track only updates at the end of each round."""}
	],
	['text', {'title':'DIPLOMACY', 'space':540,
	'text':"""Finally, there's DIPLOMACY. Using the DIPLOMACY AREA menu shown above, the player can send messages to other characters. Likewise, other characters may send messages to the player from time to time.
	Sending a message costs 1 ACTION, and it is, in essence, the crux of the game. This system is what allows the player to truly manipulate other characters in powerful ways.
	To know exactly how to do that, the player has complete access to every character's behaviors and traits."""}
	],
	['text', {'title':'TRAITS AND CHARACTERS', 'space':320,
	'text':"""This game comes with a document detailing each character's profile. They are divided in three parts:
	-INITIAL RELATIONS: their initial relations with the other characters.
	-TRAITS: pieces of personality that govern, among other things, how they react to events and information.
	-ACTION PRIORITY: a list of actions that the character may take. They will always take the first action unless doing so is impossible and/or redundant, in which case they move on to the next action and repeat the evaluation process.
	That's all you need to know to play THE LONG GAME. Good luck!"""}
	]],
	# Characters
	[['text', {'title':'CHARACTERS - BEFORE READING', 'space':220,
	'text':"""Don't be intimidated by the size of this document. Skim it over first, experiment for a few games and come back later once you become more familiarized with the game."""}
	],
	['text', {'title':'TURN ORDER', 'space':120, 
	'text':"""Edraele/Salem/Thoren/Grolk"""}
	], 
	['text', {'title':'COMMON TERMS', 'space':440, 
	'text':"""INFORMATION/MESSAGES
	Made up of three parts, in order: Agent/Action/Receiver

	RELATIONSHIPS
	Relation track:
	Enraged/Hostile/Suspicious/Trustful/Friendly
	Enraging/Hostilized/Suspect/Trusted/Befriended

	STANCES
	Cooperate: Passive vs Passive
	Slaughter: Agressive vs Passive
	Get slaughtered: Passive vs Agressive
	Fight: Agressive vs Agressive"""}
	]],
	# Salem
	[['text', {'title':'SALEM', 'space':140,
	'text':"""It's you. 
	Race: Human"""}
	],
	['text', {'title':'TRAITS', 'space':120, 
	'text':"""-PLAYER CHARACTER.
	-SEER: knows the traits of every character.
	-CHARISMATIC: at the start of the game, a random character is chosen to have their relation with Salem improved by one."""}
	]],
	# Grolk
	[['text', {'title':'GROLK', 'space':180,
	'text':"""Hates weak and/or traitorous players. Acts agressively and recklessly.
	Race: Orc
	"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':210, 
	'text':"""-HOSTILE to Salem.
	-SUSPICIOUS of Kallysta.
	-HOSTILE to Thoren.
	-HOSTILE to Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':380, 
	'text':"""Grolk doesn't get angry with battles, but does get angry with players who betray him or get slaughtered by him.
	He also hates players that attack his friends, and befriends players that like his friends. He also always believes his friends and ignore his enemies.
	He appreciates receiving true information, dislikes receiving lies, and once he's enraged with someone, will never forgive them."""}
	],
	['text', {'title':'WARLORD', 'space':220, 'color':Color.red,
	'text':"""One doesn't degrade relation with him when FIGHTING (Agressive vs Agressive) him. Becomes HOSTILE to players that are SLAUGHTERED (Passive vs Agressive) by him."""}
	],
	['text', {'title':'HATRED', 'space':220, 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED when a TRUSTED/BEFRIENDED player slaughters (Agressive vs Passive) him. Also becomes HOSTILE when a SUSPECT player slaughters him."""}
	],
	['text', {'title':'BROTHERHOOD', 'space':280, 'color':Color.darkblue,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player when he either discovers that this player will attack a TRUSTED/BEFRIENDED player, or that this player is HOSTILE/ENRAGED against a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'ALLIANCE', 'space':280, 'color':Color.blue,
	'text':"""Becomes TRUSTFUL (unless already ENRAGED or FRIENDLY) of a player when he either discovers that this player will ally with a TRUSTED/BEFRIENDED player, or that a TRUSTED/BEFRIENDED player is TRUSTFUL/FRIENDLY towards this player."""}
	],
	['text', {'title':'GENERAL', 'space':180, 'color':Color.cyan,
	'text':"""His relation can be improved by telling him information he discovers is true. The opposite happens with information he discovers is false."""}
	],
	['text', {'title':'SIMPLE-MINDED', 'space':220, 'color':Color.darkgreen,
	'text':"""Always believes info from a TRUSTED/BEFRIENDED player. Never believes info from others, though he remembers of what they said for one round (for the purposes of General)."""}
	],
	['text', {'title':'BITTER', 'space':180, 'color':Color.brown,
	'text':"""If ENRAGED with someone, nothing will make him change his Relation with them. Overrides all other Traits."""}
	],
	['text', {'title':'ACTION PRIORITY', 'space':400, 
	'text':"""1- Attack an ENRAGING player.
	2- Attack a HOSTILIZED player.
	3- Tell a TRUSTED/BEFRIENDED player about his Relation with other opponents.
	4- Tell a BEFRIENDED player about information he has.
	5- Attack a SUSPECT player."""}
	]],
	# Kallysta
	[['text', {'title':'KALLYSTA', 'space':210,
	'text':"""An individualistic and cunning leader. Kallysta distrusts almost everyone and is great at breaking strong alliances.
	Race: Tiefling
	"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':210, 
	'text':"""-SUSPICIOUS of Salem.
	-SUSPICIOUS of Grolk.
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
	['text', {'title':'CHAIN-BREAKER', 'space':140, 'color':Color.darkred,
	'text':"""Becomes HOSTILE to players who are considered by two or more other players to be TRUSTED."""}
	],
	['text', {'title':'CYNIC', 'space':90, 'color':Color.blueviolet,
	'text':"""Can never become FRIENDLY."""}
	],
	['text', {'title':'INTRIGUE', 'space':610, 'color':Color.darkcyan,
	'text':"""When receiving messages, cross-references it to previous data. If there's a contradiction or ilogical conclusion between message and data, believes in the data. If there's a contradiction or ilogical conclusion between messages, gives priority to the one from the most trusted sender.
	If there's no contradiction and the message comes from a Suspect player, investigates the validity of this information, if possible. If not, dismisses it.
	In any case, becomes Enraged if she discovers the message is false. Alternatively, if the message is true and doesn't involve the sender, then her relation with them increases."""}
	],
	['text', {'title':'ACTION PRIORITY', 'space':400, 
	'text':"""1- Attack an ENRAGING player.
	2- If it's an odd round (except the first), investigate a SUSPECT player.
	3/4- First, choose a HOSTILIZED X player. Then, choose two players, Y and Z, who find X to be TRUSTED.
	3- If Y is ENRAGED with Z, tell Y that X will ally with Z.
	4- If Y is TRUSTFUL/FRIENDLY both to her and Z, tell Y that X will attack Z.
	5- If she's the first or second in the Influence track, reduce her Influence.
	6- If she's the last in the Influence track, increase her Influence.
	7- Attack a HOSTILIZED player.
	8- Tell a SUSPICIOUS player she will co-op with them.
	9- Investigate a SUSPECT player.
	10- Investigate a HOSTILIZED player.
	11- Investigate a TRUSTED player.
	"""}
	]],
	# Thoren
	[['text', {'title':'THOREN', 'space':180,
	'text':"""A great ally and a fearsome opponent. Thoren greatly values loyalty above all else.
	Race: Dwarf"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':210, 
	'text':"""-HOSTILE to Salem.
	-ENRAGED with Grolk.
	-SUSPICIOUS of Kallysta.
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
	['text', {'title':'VASSAL', 'space':170, 'color':Color.bisque,
	'text':"""His Relation with the player with the most Influence is improved by 1 for as long as they maintain this position."""}
	],
	['text', {'title':'INTUITION', 'space':360, 'color':Color.gold,
	'text':"""When investigating the PLAYER CHARACTER, judges their Relation with other players based on their last match. 
	If there was a Slaughter on any side: ENRAGED
	If there was a Fight: HOSTILE 
	If there was Cooperation: TRUSTFUL 
	If there wasn't a match (Round 1): SUSPICIOUS"""}
	],
	['text', {'title':'BROTHERHOOD', 'space':280, 'color':Color.darkblue,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player when he either discovers that this player will attack a TRUSTED/BEFRIENDED player, or that this player is HOSTILE/ENRAGED against a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'ALLIANCE', 'space':280, 'color':Color.blue,
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
	Investigates info from SUSPECT players, or dismisses it if he can't.  He still remembers of what was actually said for two rounds (for the purposes of General)."""}
	],
	['text', {'title':'ACTION PRIORITY', 'space':400, 
	'text':"""1- Attack an ENRAGING player.
	2- Tell a TRUSTED/BEFRIENDED player that an ENRAGING player will attack him.
	3- Attack a HOSTILIZED player.
	4- Share information with a TRUSTED/BEFRIENDED player about an incoming attack towards them.
	5- Tell a TRUSTED/BEFRIENDED player that a HOSTILIZED player will attack him.
	6- Investigate the Agent of a message he received from a SUSPECT player.
	7- Tell a TRUSTED/BEFRIENDED player that another BEFRIENDED player will ally with him.
	8- Investigate a SUSPECT player.
	9- If he's the first or second in the Influence track, reduce his Influence. 
	10- Investigate a TRUSTED player."""}
	]],
	# Edraele
	[['text', {'title':'EDRAELE', 'space':180,
	'text':"""Manipulative. Acts friendly but may backstab. Dinamically adapts to the player.
	Race: Elf"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':210, 
	'text':"""-SUSPICIOUS of Salem.
	-HOSTILE to Grolk.
	-SUSPICIOUS of Kallysta.
	-TRUSTFUL of Thoren."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':560, 
	'text':"""Edraele changes her behavior based on how she views the Player Character. When receiving information, she cross-references it to previous data and determines what is true and what is not.
	She reacts appropriately to information she believes, attacking enemies who attack her and making peace with those that do the same. She also imitates the feelings of her opponents, if possible.
	She gets Enraged with players that betray her and Hostile to players that she just betrayed. Finally, she dislikes players that ally with her enemies and likes players that attack them instead."""}
	],
	['text', {'title':'AGENDA', 'space':180, 'color':Color.pink,
	'text':"""Her Action Priority changes at the beginning of each round based on her Relation with the PLAYER CHARACTER."""}
	],
		['text', {'title':'TREACHERY', 'space':180, 'color':Color.darkred,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to to players that get SLAUGHTERED (Passive vs Agressive) by her."""}
	],
	['text', {'title':'JUSTICE', 'space':140, 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED to players that SLAUGHTER (Agressive vs Passive) her."""}
	],
	['text', {'title':'REACTIVE', 'space':250, 'color':Color.aqua,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player he discovers is planning to attack her or is HOSTILE/ENRAGED against her. Becomes SUSPICIOUS of an ENRAGING/HOSTILIZED player that she discovers is planning to ally with her."""}
	],
	['text', {'title':'JEALOUSY', 'space':180, 'color':Color.purple,
	'text':"""Becomes ENRAGED at characters she discovers have more points than her. If she discovers that this ceased to be the case, becomes HOSTILE instead."""}
	],
	['text', {'title':'DEDUCTION', 'space':310, 'color':Color.yellow,
	'text':"""Can deduce the PLAYER CHARACTER's relation with other players based on other players' relation with him. For example, if she discovers that one is ENRAGED with the PLAYER CHARACTER, she will deduce that the PLAYER CHARACTER is ENRAGED with them."""}
	],
	['text', {'title':'ALLEGIANCES', 'space':220, 'color':Color.orange,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player when he discovers that this player will ally with an ENRAGING player or that this player finds an ENRAGING player to be TRUSTFUL/FRIENDLY."""}
	],
	['text', {'title':'QUEEN', 'space':180, 'color':Color.darkgoldenrod,
	'text':"""Becomes TRUSTFUL (unless already FRIENDLY) to a player when she discovers that this player will attack an ENRAGING player."""}
	],
	['text', {'title':'FACADE', 'space':140, 'color':Color.black,
	'text':"""If not ENRAGED with a player, imitates their relation after investigating them."""}
	],
	['text', {'title':'INTRIGUE', 'space':610, 'color':Color.darkcyan,
	'text':"""When receiving messages, cross-references it to previous data. If there's a contradiction or ilogical conclusion between message and data, believes in the data. If there's a contradiction or ilogical conclusion between messages, gives priority to the one from the most trusted sender.
	If there's no contradiction and the message comes from a Suspect player, investigates the validity of this information, if possible. If not, dismisses it.
	In any case, becomes Enraged if she discovers the message is false. Alternatively, if the message is true and doesn't involve the sender, then her relation with them increases."""}
	],
	['text', {'title':'ACTION PRIORITY (FRIENDLY/TRUSTFUL)', 'space':800, 
	'text':"""1- If it's Round 6, attack any player.
	2- If it's Round 3, investigate a HOSTILIZED player.
	3- Attack an ENRAGING player.
	4- Attack a HOSTILIZED player.
	5- If it's Round 2 or sooner, share information with a HOSTILIZED player about an incoming attack towards them.
	6- Investigate the Agent of a message she received from a SUSPECT/HOSTILIZED player.
	7- Share information with a TRUSTED/BEFRIENDED player about an incoming attack towards them.
	8- Tell a TRUSTED/BEFRIENDED player that a SUSPECT/HOSTILIZED/ENRAGING player will attack them.
	9- Tell a TRUSTED/BEFRIENDED player that a TRUSTED player will attack them.
	10- If she's not the first in the Influence track, increase her Influence."""}
	],
	['text', {'title':'ACTION PRIORITY (SUSPICIOUS)', 'space':680, 'color':Color.black,
	'text':"""1- If it's Round 6, attack any player.
	2- If it's Round 3, investigate a HOSTILIZED player.
	3- Attack an ENRAGING player.
	4- Attack a HOSTILIZED player.
	5- If it's Round 2 or sooner, share information with a HOSTILIZED player about an incoming attack towards them.
	6- Investigate the Agent of a message she received from a SUSPECT player.
	7- Investigate a SUSPECT player.
	8- Tell a TRUSTED/BEFRIENDED player that a SUSPECT player will attack her.
	9- If she's not the first in the Influence track, increase her Influence.
	10- Attack a SUSPECT player."""}
	],
	['text', {'title':'ACTION PRIORITY (HOSTILE/ENRAGED)', 'space':280, 'color':Color.black,
	'text':"""1- Attack an ENRAGING player.
	2- Tell a TRUSTED/BEFRIENDED player that an ENRAGING player mentioned in (1) will attack her.
	3- Tell the ENRAGING player mentioned in (2) that the TRUSTED/BEFRIENDED player mentioned in (2) will ally with them.
	4- Attack a HOSTILIZED player.
	5- Tell a TRUSTED/BEFRIENDED player that a HOSTILIZED player will attack her.
	6- Share information with a HOSTILIZED player about an incoming attack towards them.
	7- Investigate the ENRAGING player mentioned in (2)."""}
	]]
	]

func br_pages_setup():
	br_pages = [[ # Manual
	['text', {'title':'THE LONG GAME', 'space':300,
	'text':"""THE LONG GAME é um jogo de diplomacia medieval contra 3 NPCs com personalidades vastamente diferentes. Durante 6 rodadas, enfrente seus oponentes no Dilema do Prisioneiro, investigue seus históricos de partidas contra outros jogadores e influencie-os compartilhando informações ou contando mentiras."""}
	],
	['text', {'title':'ACOES', 'space':470, 
	'text':"""Todo jogador tem 3 AÇÕES por round. Elas podem ser gastas com:
	-ATAQUE: tomar a postura Agressiva contra outro jogador.
	-INVESTIGAÇÃO: receber mais informação sobre outro jogador.
	-INFLUÊNCIA: mudar sua posição na Ordem do Trono.
	-DIPLOMACIA: enviar mensagens para outros jogadores."""}
	], 
	['text', {'title':'BATALHA - O DILEMA DO PRISIONEIRO', 'space':470, 
	'text':"""O DILEMA DO PRISIONEIRO é um experimento mental relacionado à teoria dos jogos.
	Nele, cada jogador escolhe entre uma Postura Passiva e uma Postura Agressiva.
	Ser PASSIVO é coletivamente melhor para os dois jogadores, mas expõe o indivíduo à traição. Além disso, esta opção é melhor diplomaticamente.
	Ser AGRESSIVO, por outro lado, é melhor para o indivíduo, mas custa uma AÇÃO e cria resentimento entre jogadores."""}
	],
	['image', {'image':images[0], 'space':350}
	],
	['text', {'title':'INVESTIGACAO', 'space':440, 
	'text':"""Investigar um jogador pode ser muito útil para obter dicas de como ele vai agir durante o Dilema do Prisioneiro. Isso revela três informações:
	1- Sua quantidade de PONTOS.
	2- Suas últimas PARTIDAS contra todos os outros jogadores.
	3- Sua RELAÇÃO (opinião) com todos os outros jogadores.
	Investigar gasta 1 AÇÃO."""}
	],
	['image', {'image':images[1], 'space':350}
	],
	['text', {'title':'INFLUENCIA', 'space':380,
	'text':"""Influência mede o poder e notoriedade de um jogador no reino. Jogadores com maior Influência agem antes no turno e têm uma maior chance de receberem mensagens ou serem atacados.
	Um jogador pode mudar sua posição na ordem de Influência usando os botões na parte inferior da tela. Tenha em mente que a ordem apenas se atualiza no fim de cada round."""}
	],
	['text', {'title':'DIPLOMACIA', 'space':550,
	'text':"""Por fim, existe a DIPLOMACIA. Usando a ÁREA DE DIPLOMACIA mostrada acima, o jogador pode enviar mensagens para outros jogadores. Da mesma forma, outros jogadores podem enviar mensagens para o jogador de tempos em tempos.
	Enviar uma mensagem gasta 1 AÇÃO, e é, em essência, o centro do jogo. É este o sistema que dá a possibilidade do jogador realmente manipular seus oponentes de forma impactante.
	Para poder controlá-los com eficácia, o jogador tem completo acesso ao comportamento e sistema de IA de cada jogador."""}
	],
	['text', {'title':'CARACTERISTICAS E PERSONAGENS', 'space':350,
	'text':"""Este jogo também vem com um documento detalhando o perfil de cada jogador. Eles estão divididos em três partes:
	-RELAÇÕES INICIAIS: suas relações iniciais com outros jogadores.
	-CARACTERÍSTICAS: traços de personalidade que governam, entre outras coisas, como eles reagem a eventos e informação.
	-PRIORIDADE DE AÇÃO: uma lista de ações que o jogador pode tomar. Eles vão sempre tomar a primeira ação da lista a não ser que isso seja impossível e/ou redundante. Nesse caso, eles movem para a próxima ação da lista e repetem o processo.
	Isso é tudo que você precisa saber para jogar THE LONG GAME. Boa sorte!"""}
	]],
	# Personagens
	[
	['text', {'title':'PERSONAGENS - ANTES DE LER', 'space':220,
	'text':"""Não se intimide com o tamanho deste documento. Dê uma passada primeiro, experimente por algumas partidas e volte depois quando estiver mais familiarizado com o jogo."""}
	],
	['text', {'title':'ORDEM DE TURNO', 'space':120, 
	'text':"""Edraele/Salem/Thoren/Grolk"""}
	], 
	['text', {'title':'TERMOS COMUNS', 'space':440, 
	'text':"""INFORMAÇÃO/MENSAGENS
	Feita de três partes, em ordem: Agente/Ação/Recebedor

	RELAÇÕES
	Níveis de relação:
	Revoltado/Hostil/Suspeito/Confiante/Amigável
	Revoltante/Hostilizado/Suspeitado/Confiável/Amigo

	POSTURAS
	Cooperação: Passiva vs Passiva
	Massacre: Agressiva vs Passiva
	Ser massacrado: Passiva vs Agressiva
	Batalha/Luta: Agressiva vs Agressiva
	"""}
	]],
	# Salem
	[['text', {'title':'SALEM', 'space':140,
	'text':"""É você. 
	Raça: Humano"""}
	],
	['text', {'title':'CARACTERISTICAS', 'space':120, 
	'text':"""-PERSONAGEM DO JOGADOR.
	-VIDENTE: conhece as características de todos os jogadores.
	-CARISMA: no início do jogo, um jogador aleatório é escolhido para ter sua relação com Salem melhorada em 1."""}
	]],
	# Grolk
	[['text', {'title':'GROLK', 'space':180,
	'text':"""Odeia fracos e traidores. Age de forma agressiva e impulsiva.
	Raça: Orc
	"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':210, 
	'text':"""-HOSTIL para Salem.
	-SUSPEITO de Kallysta.
	-HOSTIL para Thoren.
	-HOSTIL para Edraele."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':420, 
	'text':"""Grolk não se irrita com batalhas, mas odeia jogadores que o traem ou são massacradas por ele.
	Ele também odeia jogadores que atacam seus amigos, e se alia a jogadores que se aliam a seus amigos. Ele sempre acredita em seus amigos e ignora seus inimigos.
	Ele também aprecia receber info verdadeira, não gosta de receber mentiras, e nunca perdoa um inimigo revoltante."""}
	],
	['text', {'title':'GUERREIRO', 'space':170, 'color':Color.red,
	'text':"""Ao LUTAR (Agressiva vs Agressiva) contra ele, não degrada sua relação. Torna-se HOSTIL a jogadores que são MASSACRADOS (Passiva vs Agressiva) por ele."""}
	],
	['text', {'title':'ODIO', 'space':220, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADO com jogadores CONFIÁVEIS/AMIGOS que MASSACRAM (Agressiva vs Passiva) ele. Também fica HOSTIL com jogadores Suspeitados que MASSACRAM ele."""}
	],
	['text', {'title':'IRMANDADE', 'space':310, 'color':Color.darkblue,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador ou quando descobre que esse jogador vai atacar um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que esse jogador é REVOLTADO/HOSTIL contra um jogador CONFIÁVEL/AMIGO dele."""}
	],
	['text', {'title':'ALIANCA', 'space':300, 'color':Color.blue,
	'text':"""Torna-se CONFIANTE (exceto quando já REVOLTADO or AMIGÁVEL) de um jogador ou quando descobre que esse jogador vai se aliar a um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que um jogador CONFIÁVEL/AMIGO dele considera esse jogador CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'GENERAL', 'space':180, 'color':Color.cyan,
	'text':"""Sua relação melhora ao contar informação que ele descobre que é verdadeira. O oposto ocorre com informação que ele descobre que é falsa."""}
	],
	['text', {'title':'IMBECIL', 'space':220, 'color':Color.darkgreen,
	'text':"""Sempre acredita em jogadores CONFIÁVEIS/AMIGOS. Nunca acredita em outros, mas ainda lembra do que eles disseram (para ativar General)."""}
	],
	['text', {'title':'AMARGO', 'space':180, 'color':Color.brown,
	'text':"""Se estiver REVOLTADO com alguém, nada vai fazer com que ele mude sua relação com essa pessoa. Anula todas as outras Características."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Ataca um jogador HOSTILIZADO.
	3- Conta para um jogador CONFIÁVEL/AMIGO sobre sua relação com outros.
	4- Conta para um jogador AMIGO sobre informações que ele tem.
	5- Ataca um jogador SUSPEITADO."""}
	]],
	# Kallysta
	[['text', {'title':'KALLYSTA', 'space':210,
	'text':"""Uma líder individualista e perspicaz. Kallysta se desconfia de quase todos e é excelente em quebrar alianças fortes.
	Raça: Tiefling
	"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':210, 
	'text':"""-SUSPEITA de Salem.
	-SUSPEITA de Grolk.
	-SUSPEITA de Thoren.
	-SUSPEITA de Edraele.
	"""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':550, 
	'text':"""A natureza individualista de Kallysta faz ela impossível de tornar-se Amigável com alguém. Ela é excelente em encontrar e interpretar informação, e usa essa habilidade para prever o comportamento de outros jogadores.
	Com a habilidade exclusiva Quebra-Correntes, Kallysta torna-se Hostil contra jogadores com muitos aliados. Usando diplomacia e investigação, a líder tiefling consegue facilmente desmontar amizades em um ou dois turnos.
	Ela também reage de forma apropriada a mensagens recebidas, defendendo-se de inimigos."""}
	],
	['text', {'title':'PARANOIA', 'space':170, 'color':Color.darkgray,
	'text':"""Torna-se REVOLTADA a um jogador quando ele descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ela."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADA com jogadores que MASSACRAM (Agressiva vs Passiva) ela."""}
	],
	['text', {'title':'DEDUCAO', 'space':330, 'color':Color.yellow,
	'text':"""Pode deduzir a relação do PERSONAGEM DO JOGADOR com outros jogadores baseado na relação de outros jogadores com ele. Por exemplo, se ela descobre que alguém está REVOLTADO com o PERSONAGEM DO JOGADOR, ela irá deduzir que o PERSONAGEM DO JOGADOR está REVOLTADO com ele."""}
	],
	['text', {'title':'QUEBRA-CORRENTES', 'space':140, 'color':Color.darkred,
	'text':"""Torna-se HOSTIL a jogadores que são considerados CONFIAVEIS por dois ou mais outros jogadores."""}
	],
	['text', {'title':'CINICA', 'space':90, 'color':Color.blueviolet,
	'text':"""Nunca torna-se AMIGÁVEL."""}
	],
	['text', {'title':'INTRIGA', 'space':590, 'color':Color.darkcyan,
	'text':"""Ao receber mensagens, compara-as com seus outros dados. Se houver uma contradição ou conclusão ilógica, acredita em seus dados. Se houver uma contradição ou conclusão ilógica entre mensagens, dá prioridade para a mensagem vinda do remetente mais confiado.
	Se não houver contradição e a mensagem vier de um jogador SUSPEITADO, investiga a validade desta informação, se possível. Senão, ignora-a.
	Em qualquer caso, fica REVOLTADA se descobrir que a mensagem é falsa. Alternativamente, se a mensagem for verdadeira e não envolver o remetente, sua relação com ele melhora."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Se for um turno ímpar (exceto o primeiro), investiga um jogador SUSPEITADO.
	3/4- Primeiro, escolhe um jogador X HOSTILIZADO. Então, escolhe dois jogadores, Y e Z, que acham X CONFIÁVEL.
	3- Se Y estiver REVOLTADO com  Z, conta para Y que X vai cooperar com Z.
	4- Se Y estiver CONFIANTE/AMIGÁVEL com ela e Z, conta para Y que X vai atacar Z.
	5- Se sua Ordem no Trono for 1 ou 2, reduz sua Ordem no Trono.
	6- Se for a última na Ordem no Trono, aumenta sua Ordem no Trono.
	7- Ataca um jogador HOSTILIZADO.
	8- Conta para um jogador SUSPEITADO que ela irá se aliar com ele.
	9- Investiga um jogador SUSPEITADO.
	10- Investiga um jogador HOSTILIZADO.
	11- Investiga um jogador CONFIÁVEL.
	"""}
	]],
	# Thoren
	[['text', {'title':'THOREN', 'space':180,
	'text':"""Um grande aliado e um temível oponente. Thoren acredita em lealdade sobre tudo.
	Raça: Anão"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':210, 
	'text':"""-HOSTIL para Salem.
	-REVOLTADO com Grolk.
	-SUSPEITO de Kallysta.
	-CONFIANTE de Edraele."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':500, 
	'text':"""Thoren acredita em seus amigos e, no geral, não acredita em seus inimigos. Ele tenta investigar info suspeita, mas ignora-a se não puder.
	Ele também odeia jogadores que atacam seus amigos, e se alia a jogadores que se aliam a seus amigos. Porém, se alguém se aliar a um de seus inimigos revoltantes, ele fica hostil contra esta pessoa.
	Thoren reage de forma apropriada a info que ele acredita, atacando inimigos que atacam ele e fazendo paz com aqueles que também o fazem. Ele odeia ser traído."""}
	],
	['text', {'title':'REATIVO', 'space':290, 'color':Color.aqua,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador quando ele descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ele. Torna-se SUSPEITO de um jogador REVOLTANTE/HOSTILIZADO quando ele descobre que este está planejando se aliar com ele."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADO com jogadores que MASSACRAM (Agressiva vs Passiva) ele."""}
	],
	['text', {'title':'VASSALO', 'space':170, 'color':Color.bisque,
	'text':"""sua Relação com o jogador com maior Influência melhora em 1 enquanto ele se mantiver nessa posição."""}
	],
	['text', {'title':'INTUICAO', 'space':350, 'color':Color.gold,
	'text':"""ao investigar o PERSONAGEM DO JOGADOR, julga sua relação com outros jogadores baseado em sua última partida.
	Se houve Massacre em qualquer lado: REVOLTADO
	Se houve uma Batalha: HOSTIL
	Se houve Cooperação: CONFIANTE 
	Se não houve partida (Turno 1): SUSPEITO """}
	],
	['text', {'title':'IRMANDADE', 'space':300, 'color':Color.darkblue,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador ou quando descobre que esse jogador vai atacar um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que esse jogador é REVOLTADO/HOSTIL contra um jogador CONFIÁVEL/AMIGO dele."""}
	],
	['text', {'title':'ALIANCA', 'space':300, 'color':Color.blue,
	'text':"""Torna-se CONFIANTE (exceto quando já REVOLTADO or AMIGÁVEL) de um jogador ou quando descobre que esse jogador vai se aliar a um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que um jogador CONFIÁVEL/AMIGO dele considera esse jogador CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'LEALDADES', 'space':260, 'color':Color.orange,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador ou quando descobre que este irá se aliar com um jogador REVOLTANTE ou quando descobre que este considera um jogador REVOLTANTE como CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'GENERAL', 'space':190, 'color':Color.cyan,
	'text':"""Sua relação melhora ao contar informação que ele descobre que é verdadeira. O oposto ocorre com informação que ele descobre que é falsa."""}
	],
	['text', {'title':'TATICO', 'space':400, 'color':Color.lightgreen,
	'text':"""Sempre acredita em jogadores CONFIÁVEIS/AMIGOS. Acredita no oposto do que um jogador REVOLTANTE/HOSTILIZADO lhe contou sobre outros jogadores, e ignora o que eles dizem se a info involve eles mesmos. 
	Investiga info vinda de jogadores SUSPEITADOS, ou ignora ela se não puder. Ele ainda se lembra do que foi dito de verdade (para ativar General) por dois rounds."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Conta para um jogador CONFIÁVEL/AMIGO que um jogador REVOLTANTE irá atacá-lo.
	3- Ataca um jogador HOSTILIZADO.
	4- Compartilha informação com um jogador CONFIÁVEL/AMIGO sobre um ataque vindo contra ele.
	5- Conta para um jogador CONFIÁVEL/AMIGO que um jogador HOSTILIZADO irá atacá-lo.
	6- Investiga o Agente de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	7- Conta para um jogador CONFIÁVEL/AMIGO que um jogador AMIGO irá se aliar com Thoren.
	8- Investiga um jogador SUSPEITADO.
	9- Investiga um jogador CONFIÁVEL.
	10- Se ele for o primeiro ou o segundo na Ordem do Trono, reduz sua Influência."""}
	]],
	# Edraele
	[['text', {'title':'EDRAELE', 'space':180,
	'text':"""Manipulativa. Age de forma pacífica mas pode trair. Adapta-se dinamicamente ao jogador.
	Raça: Elfa"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':210, 
	'text':"""-SUSPEITA de Salem.
	-HOSTIL para Grolk.
	-SUSPEITA de Kallysta.
	-CONFIANTE de Thoren."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':560, 
	'text':"""Edraele muda seu comportamento baseado em sua relação com o Personagem do Jogador. Quando recebe info, compara-a com seus outros dados e determina o que é verdadeiro e o que não é.
	Ela reage de forma apropriada a info que ele acredita, atacando inimigos que atacam ele e fazendo paz com aqueles que também o fazem. Ela também imita a relação de seus oponentes, se possível.
	Edraele fica Revoltada com jogadores que a traem e fica Hostil com jogadores que são traídos por ela. Por fim, ela não gosta de jogadores que se aliam com seus inimigos e gosta de jogadores que os atacam."""}
	],
	['text', {'title':'AGENDA', 'space':180, 'color':Color.pink,
	'text':"""Sua Prioridade de Ação muda no começo de cada round baseado em sua relação com o PERSONAGEM DO JOGADOR."""}
	],
	['text', {'title':'PERFIDIA', 'space':140, 'color':Color.darkred,
	'text':"""Torna-se HOSTIL a jogadores que são MASSACRADOS (Passiva vs Agressiva) por ela."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADA com jogadores que MASSACRAM (Agressiva vs Passiva) ela."""}
	],
	['text', {'title':'REATIVA', 'space':300, 'color':Color.aqua,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADA) a um jogador quando ela descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ela. Torna-se SUSPEITA de um jogador REVOLTANTE/HOSTILIZADO quando ela descobre que este está planejando se aliar com ela."""}
	],
	['text', {'title':'INVEJA', 'space':180, 'color':Color.purple,
	'text':"""Fica REVOLTADA com jogadores que ela descobre têm mais pontos que ela. Se ela descobre depois que isso deixou de ser o caso, fica apenas HOSTIL."""}
	],
	['text', {'title':'DEDUCAO', 'space':330, 'color':Color.yellow,
	'text':"""Pode deduzir a relação do PERSONAGEM DO JOGADOR com outros jogadores baseado na relação de outros jogadores com ele. Por exemplo, se ela descobre que alguém está REVOLTADO com o PERSONAGEM DO JOGADOR, ela irá deduzir que o PERSONAGEM DO JOGADOR está REVOLTADO com ele."""}
	],
	['text', {'title':'LEALDADES', 'space':250, 'color':Color.orange,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADA) a um jogador ou quando descobre que este irá se aliar com um jogador REVOLTANTE ou quando descobre que este considera um jogador REVOLTANTE como CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'RAINHA', 'space':180, 'color':Color.darkgoldenrod,
	'text':"""Torna-se CONFIANTE (exceto quando já AMIGÁVEL) de um jogador quando descobre que este irá atacar um jogador REVOLTANTE."""}
	],
	['text', {'title':'FACHADA', 'space':140, 'color':Color.black,
	'text':"""Se não estiver REVOLTADA com um jogador, imita sua relação após investigá-lo."""}
	],
	['text', {'title':'INTRIGA', 'space':590, 'color':Color.darkcyan,
	'text':"""Ao receber mensagens, compara-as com seus outros dados. Se houver uma contradição ou conclusão ilógica, acredita em seus dados. Se houver uma contradição ou conclusão ilógica entre mensagens, dá prioridade para a mensagem vinda do remetente mais confiado.
	Se não houver contradição e a mensagem vier de um jogador SUSPEITADO, investiga a validade desta informação, se possível. Senão, ignora-a.
	Em qualquer caso, fica REVOLTADA se descobrir que a mensagem é falsa. Alternativamente, se a mensagem for verdadeira e não envolver o remetente, sua relação com ele melhora."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (CONFIANTE/AMIGAVEL)', 'space':870, 
	'text':"""1- Se for o Round 6, ataca qualquer jogador.
	2- Se for o Round 3, investiga um jogador HOSTILIZADO.
	3- Ataca um jogador REVOLTANTE.
	4- Ataca um jogador HOSTILIZADO.
	5- Se for o Round 2 ou anterior, compartilha informação com um jogador HOSTILIZADO sobre um ataque vindo contra ele.
	6- Investiga o Agente de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	7- Compartilha informação com um jogador CONFIÁVEL/AMIGO sobre um ataque vindo contra ele.
	8- Conta para um jogador CONFIÁVEL/AMIGO que um jogador SUSPEITADO/HOSTILIZADO/REVOLTANTE irá atacá-lo.
	9- Conta para um jogador CONFIÁVEL/AMIGO que outro jogador CONFIÁVEL/AMIGO irá atacá-lo.
	10- Se não for a primeira na Ordem do Trono, aumenta sua influência."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (SUSPEITA)', 'space': 670, 'color':Color.black,
	'text':"""1- Se for o Round 6, ataca qualquer jogador.
	2- Se for o Round 3, investiga um jogador HOSTILIZADO.
	3- Ataca um jogador REVOLTANTE.
	4- Ataca um jogador HOSTILIZADO.
	5- Se for o Round 2 ou anterior, compartilha informação com um jogador HOSTILIZADO sobre um ataque vindo contra ele.
	6- Investiga o Agente de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	7- Investiga um jogador SUSPEITADO.
	8- Conta para um jogador CONFIÁVEL/AMIGO que um jogador SUSPEITADO irá atacá-lo.
	9- Se não for a primeira na Ordem do Trono, aumenta sua influência.
	10- Ataca um jogador SUSPEITADO."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (HOSTIL/REVOLTADA)', 'space':280, 'color':Color.black,
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Conta para um jogador CONFIÁVEL/AMIGO que um jogador REVOLTANTE mencionado em (1) irá atacá-la.
	3- Conta para o jogador REVOLTANTE mencionado em (2) que o jogador CONFIÁVEL/AMIGO mencionado em (2) irá se aliar com ele.
	4- Ataca um jogador HOSTILIZADO.
	5- Conta para um jogador CONFIÁVEL/AMIGO que um jogador HOSTILIZADO irá atacá-la.
	6- Compartilha informação com um jogador HOSTILIZADO sobre um ataque vindo contra ele.
	7- Investiga o jogador REVOLTANTE mencionado em (2)."""}
	]]
	]
	
func de_pages_setup():
	de_pages = [[ # Manual
	['text', {'title':'THE LONG GAME', 'space':300,
	'text':"""THE LONG GAME ist ein mittelalterliches Diplomatie-Spiel gegen 3 NPCs mit gewaltige verschiedene Persönlichkeiten. Über 6 Runde, spiel das Gefangenendilemma, forsch den Matchverlauf deiner Opponenten gegen andere Spieler nach und beeinfluss sie durch Informationen und Lügen."""}
	],
	['text', {'title':'AKTIONEN', 'space':380, 
	'text':"""Jeder Spieler hat 3 AKTIONEN pro Runde. Man kann sie damit verbringen:
	-ANGRIFF: die Agressiv-Position gegen einen andere Spieler nehmen.
	-NACHFORSCHUNG: mehr Information über einen andere Spieler erhalten.
	-EINFLUSS: deine Position in der Thron-Reihenfolge ändern.
	-DIPLOMATIE: Briefe an andere Spieler senden."""}
	], 
	['text', {'title':'KAMPF - DER GEFANGENENDILEMMA', 'space':470, 
	'text':"""Der GEFANGENENDILEMMA ist ein Gedankenexperiment mit Bezug zur Spieltheorie.
	Darin entscheidet jeder Spieler zwischen eine Passiv- oder Agressiv-Position.
	PASSIV sein ist besser für die zwei Spieler, aber es setzt den Einzelne der Verrat aus. Außerdem ist diese Option diplomatisch besser.
	AGRESSIV sein ist andererseits besser für den Einzelne, aber es verbringt eine Aktion und steigt Abneigung gegen den Spieler."""}
	],
	['image', {'image':images[0], 'space':350}
	],
	['text', {'title':'NACHFORSCHUNGEN', 'space':440, 
	'text':"""Nachforschungen über einen Spieler anstellen kann ziemlich nützlich sein. Damit kann man Hinweise darauf bekommen, was er im Gefangenendilemma tun wird. Das ist was man kann mit einem Nachforschen entdecken:
	1- Seine Punktzahl.
	2- Seine letzte Matchs gegen alle andere Spieler.
	3- Seine Relation (Meinung) mit alle anderen Spielern.
	Eine Nachforschung verbringt 1 AKTION."""}
	],
	['image', {'image':images[1], 'space':350}
	],
	['text', {'title':'EINFLUSS', 'space':380,
	'text':"""Einfluss darstellt Macht und Allbekanntheit eines Spielers in der Königreich. Spieler, die höhen Einfluss haben, agieren früher in der Runde und haben eine höher Wahrscheinlichkeit, eine Brief zu erhalten oder attackiert zu werden.
	Ein Spieler kann seine Position in der Einfluss-Reihenfolge ändern, indem die Knöpfe im unteren Teil der Bildschirm drücken. Beachten Sie mal, dass die Reihenfolge nur am Ende jeder Runde sich aktualisiert."""}
	],
	['text', {'title':'DIPLOMATIE', 'space':550,
	'text':"""Schließlich gibt es DIPLOMATIE. Indem man den Diplomatiebereich verwendet, kann man an andere Spieler Briefe senden. Gleichfalls kann andere Charakter manchmal an den Spieler auch Briefe senden.
	Das Senden eines Briefes verbringt 1 AKTION, und ist wesentlich die Hauptmechanik des Spiels. Es ist dieses System, das ermöglicht es, der Spieler seine Gegner zu manipulieren.
	Um sie effizient zu kontrollieren, hat der Spieler komplett Zugriff auf das Verhalten und KI-System von alle Charakter."""}
	],
	['text', {'title':'EIGENSCHAFTEN UND CHARAKTER', 'space':350,
	'text':"""Dieses Spiel hat auch ein Dokument, das das Profil jedes Charakters detaliert. Sie sind in drei Teile gegliedert:
	-ANFANGSRELATIONEN: seine Anfangsrelationen mit anderen Spielern.
	-EIGENSCHAFTEN: Persönlichkeit-Eigenarten, die unter anderem bestimmen, wie sie sich mit Events und Informationen reagieren.
	-AKTIONPRIORITÄT: eine Liste von Aktionen, die der Spieler nehmen kann. Er wird immer die erste Aktion der Liste nehmen, es sei denn, das ist unmöglich und/oder redundant. In diesem Fall, übergeht er diese Aktion und nimmt stattdessen die nächste.
	Das ist alles, das du wissen musst, um THE LONG GAME zu spielen. Viel Glück!"""}
	]],
	# Personagens
	[
	['text', {'title':'CHARAKTER - VOR DEM LESEN', 'space':220,
	'text':"""Lassen Sie sich nicht mit dem Größe dieses Dokuments einschüchtern. Überfliegen Sie es zuerst, experimenten Sie für ein paar Spielen und kommen Sie züruck, wenn Sie gewöhnter mit ihm sind."""}
	],
	['text', {'title':'REIHENFOLGE', 'space':120, 
	'text':"""Edraele/Salem/Thoren/Grolk"""}
	], 
	['text', {'title':'UEBLICHE BEGRIFFE', 'space':440, 
	'text':"""INFORMATION/BRIEFE
	Aus drei Teilen, in der Reihenfolge: Akteur/Aktion/Receiver

	RELATIONEN
	Relation-Niveau:
	Wütend/Feindlich/Misstrauisch/Vertrauend/Freundlich
	Ärgerlich/Feindselig/Verdächtig/Vertraut/Befreundet

	POSITIONEN
	Kooperation: Passiv vs Passiv
	Massaker: Agressiv vs Passiv
	massakriert werden: Passiv vs Agressiv
	Kampf: Agressiv vs Agressiv
	"""}
	]],
	# Salem
	[['text', {'title':'SALEM', 'space':140,
	'text':"""Es ist du. 
	Rasse: Mensch"""}
	],
	['text', {'title':'EIGENSCHAFTEN', 'space':120, 
	'text':"""-SPIELERCHARAKTER.
	-SEHER: kennt die Eigenschaften der alle Spieler.
	-CHARISMA: am Anfang des Spiels, wird ein zufälliger Charakter gewählt, deren Relation mit Salem um 1 verbessert wird."""}
	]],
	# Grolk
	[['text', {'title':'GROLK', 'space':180,
	'text':"""Hasst schwache Spieler und Verräter. Handelt in agressiver und fahrlässiger Weise.
	Rasse: Orc
	"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':180, 
	'text':"""-FEINDLICH gegenüber Salem.
	-MISSTRAUISCH mit Kallysta.
	-FEINDLICH gegenüber Thoren.
	-FEINDLICH gegenüber Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':420, 
	'text':"""Grolk ärgert sich nicht mit Kämpfen, aber hässt Spieler, die ihn verraten oder von ihm massakriert werden.
	Er hässt auch Spieler, die seine Freunde angreifen, und kooperiert mit Spielern, die mit seinen Freunden kooperieren. Immer glaubt er an seine Freunde und ignoriert seine Gegner.
	Er mag echte Information, mag falsche Information nicht, und verzeiht nie ärgerliche Gegner."""}
	],
	['text', {'title':'KRIEGER', 'space':170, 'color':Color.red,
	'text':"""Wenn man gegen ihn KÄMPFT (Agressiv vs Agressiv), seine Relation verschlechtert nicht. Er wird FEINDLICH gegen Spieler, die MASSAKRIERT (Passiv vs Agressiv) von ihm werden."""}
	],
	['text', {'title':'HASS', 'space':220, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen VERTRAUTE/BEFREUNDETE Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv). Ausserdem wird er FEINDLICH gegen vermutete Spieler, die ihm MASSAKRIEREN."""}
	],
	['text', {'title':'BRUDERSCHAFT', 'space':310, 'color':Color.darkblue,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler einen VERTRAUTEN/BEFREUNDETEN Spielern angreifen wird, oder wenn er herausfindet, dass dieser Spieler FEINDLICH/WÜTEND gegen einen VERTRAUT/FREUNDE Spielern ist."""}
	],
	['text', {'title':'ALLIANZ', 'space':300, 'color':Color.blue,
	'text':"""Wird VERTRAUEND (sofern wenn schon WÜTEND oder FREUNDLICH) eines Spielers, entweder wenn er herausfindet, dass dieser Spieler mit einem VERTRAUTEN/BEFREUNDETEN Spieler kooperieren wird, oder wenn er herausfindet, dass ein VERTRAUTER/BEFREUNDETER Spieler diesen Spieler als VERTRAUT/BEFREUNDET betrachtet."""}
	],
	['text', {'title':'GENERAL', 'space':180, 'color':Color.cyan,
	'text':"""Seine Relation verbessert, wenn man ihm Information gibt, die er herausfindet, dass die wahr ist. Das Gegenteil passiert mit Information, die er herausfindet, dass die falsch ist."""}
	],
	['text', {'title':'IMBEZIL', 'space':220, 'color':Color.darkgreen,
	'text':"""Glaubt immer an VERTRAUTE/BEFREUNDETE Spieler. Glaubt nie an andere Spieler, aber erinnert sich immer noch an ihre Worte (für General)."""}
	],
	['text', {'title':'VERBITTERT', 'space':180, 'color':Color.brown,
	'text':"""Wenn er WÜTEND mit jemandem ist, wird nichts ihn dazubringen, seine Relation zu dem zu ändern."""}
	],
	['text', {'title':'AKTION-PRIORITAET', 'space':400, 
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Attackiert einen FEINDSELIGEN Spieler.
	3- Erzählt einem VERTRAUTEN/BEFREUNDETEN Spielern von seiner Relation mit anderen.
	4- Erzählt einem BEFREUNDETEN Spielern Informationen, die er hat.
	5- Attackiert einen VERDÄCHTIGEN Spieler."""}
	]],
	# Kallysta
	[['text', {'title':'KALLYSTA', 'space':210,
	'text':"""Ein individualistischer und clever Führer. Kallysta misstraut fast jeder und ist großartig darin, starke Allianzen zu brechen.
	Rasse: Tiefling
	"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':210, 
	'text':"""-MISSTRAUISCH mit Salem.
	-MISSTRAUISCH mit Grolk.
	-MISSTRAUISCH mit Thoren.
	-MISSTRAUISCH mit Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':470, 
	'text':"""Kallystas indivdualistische Art macht es ihr unmöglich, Freundlich zu anderen zu werden. Sie ist ziemlich gut darin, Informationen zu finden und zu interpretieren, und sie verwendet diese Fähigkeit, um das Verhalten anderer Spieler vorherzusagen.
	Kallystas charakteristische Eigenschaft, Kettebrecher, macht sie Feindlich gegenüber Spieler, die mehrere Verbündete haben. Mit Diplomatie und Nachforschungen kann die tiefling Führer schnell starke Allianze brechen.
	Außerdem reagiert sie angemessen auf erhaltene Information, indem sie sich gegen Feinde verteidigt."""}
	],
	['text', {'title':'PARANOID', 'space':170, 'color':Color.darkgray,
	'text':"""Wird WÜTEND gegen Spieler, die entweder beabsichtigen, sie zu angreifen, oder gegen sie FEINDLICH/WÜTEND sind."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihr MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'DEDUKTION', 'space':310, 'color':Color.yellow,
	'text':"""Kann die Relationen des SPIELERCHARAKTERS mit anderen Spielern an die Relationen der anderen Spieler mit ihm herleiten. Zum Beispiel, wenn sie entdeckt, dass ein Spieler WÜTEND mit dem SPIELERCHARAKTER ist, leitet sie her, dass der SPIELERCHARAKTER WÜTEND mit diesem Spieler ist."""}
	],
	['text', {'title':'KETTEBRECHER', 'space':140, 'color':Color.darkred,
	'text':"""Wird FEINDLICH gegen Spieler, die von mindestens zwei Spielern als VERTRAUT/FREUND betrachtet werden."""}
	],
	['text', {'title':'ZYNISCH', 'space':90, 'color':Color.blueviolet,
	'text':"""Wird niemals FREUNDLICH."""}
	],
	['text', {'title':'INTRIGE', 'space':610, 'color':Color.darkcyan,
	'text':"""Wenn sie Briefe erhaltet, vergleicht sie die Information mit früheren Daten. Wenn es einen Widerspruch zwischen Nachricht und Daten gibt, glaubt sie an die Daten. Wenn der Widerspruch zwischen Briefe ist, gibt sie den Vorrang dem Brief des vertrauenswürdiger Absenders.
	Falls es keinen Widerspruch gibt und der Brief von einem Verdächtigen Spieler kommt, forscht sie die Gültigkeit dieser Information nach, wenn möglich. Wenn nicht, lehnt sie ab.
	Auf jeden Fall wird sie WÜTEND, wenn sie entdeckt, dass die Information falsch ist. Auf der anderen Seite, wenn die Information echt ist und den Absender nicht erwähnt, verbessert sie seine Relation zu ihm."""}
	],
	['text', {'title':'AKTIONPRIORITAET', 'space':400, 
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Wenn es eine ungerade Runde ist (außer die erste), forscht einen VERDÄCHTIGEN Spieler nach.
	3/4- Zuerst wählt einen FEINDSELIGEN X Spielen. Dann wählt zwei Spieler, Y und Z, die X VERTRAUT finden.
	3- Falls Y WÜTEND mit Z ist, erzählt Y, dass X mit Z kooperieren wird.
	4- Falls Y VERTRAUEND/FREUNDLICH mit ihr und Z ist, erzählt Y, dass X Z attackieren wird.
	5- Falls sie die erste oder zweite in der Einfluss-Reihenfolge ist, reduziert ihre Einfluss.
	6- Falls sie die letzte in der Einfluss-Reihenfolge ist, erhöht ihre Einfluss.
	7- Attackiert einen FEINDSELIGEN Spieler.
	8- Forscht einen VERDÄCHTIGEN Spieler nach.
	9- Forscht einen FEINDSELIGEN Spieler nach.
	10- Forscht einen VERTRAUTEN Spieler nach.
	"""}
	]],
	# Thoren
	[['text', {'title':'THOREN', 'space':180,
	'text':"""Ein großartiger Verbündeter und ein ängstlicher Gegner. Thoren Thoren greatly values loyalty above all else.
	Rasse: Zwerg"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':210, 
	'text':"""-FEINDLICH gegenüber Salem.
	-WÜTEND mit Grolk.
	-MISSTRAUISCH von Kallysta.
	-Vertrauend von Edraele."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':480, 
	'text':"""Thoren glaubt immer an seine Freunde und zweifelt an seinen Feinden. Er versucht es, verdächtige Information nachzuforschen, aber ignoriert die, wenn er das nicht machen kann.
	Außerdem hasst er Spieler, die seine Freunde attackieren, und freundet sich mit Spielern, die seine Freunde auch gemöcht werden. Wenn sich jedoch jemand mit seinen ärgerlichen Feinden anfreundet, wird er feindlich gegen den.
	Thoren reagiert angemessen auf Information, an die er glaubt, indem er Spieler, die ihn attackieren, attackiert, und Frieden mit denen zu schließen, die dasselbe tun. Er hasst es, verraten zu werden."""}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH von FEINDSELIGEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'VASALL', 'space':170, 'color':Color.bisque,
	'text':"""Seine Relation mit dem Spieler, der den höchsten Einfluss hat, wird um 1 erhöht, sofern der diese Position behält."""}
	],
	['text', {'title':'INTUITION', 'space':360, 'color':Color.gold,
	'text':"""Wenn er forscht den SPIELERCHARAKTER nach, betrachtet seine Relation mit anderen Spielern auf Grund ihren letzen Matchs. 
	Falls eine Massaker auf irgendeiner Seite es gab: WÜTEND
	Falls es Kämpf gab: FEINDLICH 
	Falls es Kooperation gab: VERTRAUEND 
	Falls es kein Match gab (Runde 1): MISSTRAUISCH"""}
	],
	['text', {'title':'BRUDERSCHAFT', 'space':310, 'color':Color.darkblue,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler einen VERTRAUTEN/BEFREUNDETEN Spielern angreifen wird, oder wenn er herausfindet, dass dieser Spieler FEINDLICH/WÜTEND gegen einen VERTRAUTEN/BEFREUNDETEN Spielern ist."""}
	],
	['text', {'title':'ALLIANZ', 'space':300, 'color':Color.blue,
	'text':"""Wird VERTRAUEND (sofern wenn schon WÜTEND oder FREUNDLICH) eines Spielers, entweder wenn er herausfindet, dass dieser Spieler mit einem VERTRAUTEN/BEFREUNDETEN Spieler kooperieren wird, oder wenn er herausfindet, dass ein VERTRAUTER/BEFREUNDETER Spieler diesen Spieler als VERTRAUT/BEFREUNDET betrachtet."""}
	],
	['text', {'title':'LOYALITAETEN', 'space':220, 'color':Color.orange,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler mit einen ÄRGERLICHEN Spieler kooperieren wird, oder wenn er herausfindet, dass dieser Spieler VERTRAUEND/FREUNDLICH mit einem ÄRGERLICHEN Spieler ist."""}
	],
	['text', {'title':'GENERAL', 'space':180, 'color':Color.cyan,
	'text':"""Seine Relation verbessert, wenn man ihm Information gibt, die er herausfindet, dass die wahr ist. Das Gegenteil passiert mit Information, die er herausfindet, dass die falsch ist."""}
	],
	['text', {'title':'TAKTISCH', 'space':400, 'color':Color.lightgreen,
	'text':"""Glaubt immer an Information von VERTRAUTEN/BEFREUDETEN Spielern. Glaubt an das Gegenteil davon, was ein FEINDLICHER/ÄRGERLICHER Spieler ihn über anderen Spielern erzählt hat, und ignoriert was der sagt, wenn der sich selbst erwähnt. 
	Forscht Info von VERDÄCHTIGEN Spieler nach, oder ignoriert die, falls er das nicht machen kann. Trotzdem erinnert er sich für zwei Runde davon, was sie eigentlich gesagt haben (für General)."""}
	],
	['text', {'title':'AKTIONPRIORITAET', 'space':400, 
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein ÄRGERLICHER Spieler diesen Spieler attackieren wird.
	3- Attackiert einen FEINDSELIGEN Spieler.
	4- Teilt Information mit einem VERTRAUTEN/BEFREUNDETEN Spieler über einen eingehenden Angriff gegen dem.
	5- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein FEINDSELIGER Spieler diesen Spieler attackieren wird.
	6- Forscht den Agenten eines Briefes nach, den er von einem VERDÄCHTIGEN Spieler erhalten hat.
	7- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein anderer BEFREUNDETER Spieler mit diesem Spieler kooperieren wird.
	8- Forscht einen VERDÄCHTIGEN Spieler nach.
	9- Falls er der erster oder zweiter in der Reihenfolge, reduziert seinen Einfluss. 
	10- Forscht einen VERTRAUTEN Spieler nach."""}
	]],
	# Edraele
	[['text', {'title':'EDRAELE', 'space':180,
	'text':"""Manipulative. Acts friendly but may backstab. Dinamically adapts to the player.
	Race: Elf"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':210, 
	'text':"""-SUSPICIOUS of Salem.
	-HOSTILE to Grolk.
	-SUSPICIOUS of Kallysta.
	-TRUSTFUL of Thoren."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':560, 
	'text':"""Edraele ändert ihres Verhalten auf Grund ihrer Relation mit dem Spielercharakter. Wenn sie Information erhaltet, vergleicht sie die mit früheren Daten und bestimmt es, was echt oder falsch ist.
	Sie reagiert entsprechend zu Information, an die sie glaubt, indem 
	Edraele changes her behavior based on how she views the Player Character. When receiving information, she cross-references it to previous data and determines what is true and what is not.
	She reacts appropriately to information she believes, attacking enemies who attack her and making peace with those that do the same. She also imitates the feelings of her opponents, if possible.
	She gets Enraged with players that betray her and Hostile to players that she just betrayed. Finally, she dislikes players that ally with her enemies and likes players that attack them instead."""}
	],
	['text', {'title':'AGENDA', 'space':180, 'color':Color.pink,
	'text':"""Am Anfang jeder Runde verändert ihre Aktionpriorität auf Grund ihrer Relation mit dem SPIELERCHARAKTER."""}
	],
		['text', {'title':'VERRAT', 'space':180, 'color':Color.darkred,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die von ihr massakriert werden (Passiv vs Agressiv)."""}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH von FEINDLICHEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'EIFERSUCHT', 'space':180, 'color':Color.purple,
	'text':"""Wird WÜTEND gegen Spielern, von denen sie entdeckt, dass sie mehr Punkte haben als sie selbst. Wenn sie entdeckt, dass das nicht mehr der Fall ist, wird FEINDLICH stattdessen."""}
	],
	['text', {'title':'DEDUKTION', 'space':310, 'color':Color.yellow,
	'text':"""Kann die Relationen des SPIELERCHARAKTERS mit anderen Spielern an die Relationen der anderen Spieler mit ihm herleiten. Zum Beispiel, wenn sie entdeckt, dass ein Spieler WÜTEND mit dem SPIELERCHARAKTER ist, leitet sie her, dass der SPIELERCHARAKTER WÜTEND mit diesem Spieler ist."""}
	],
	['text', {'title':'LOYALITAETEN', 'space':220, 'color':Color.orange,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler mit einen ÄRGERLICHEN Spieler kooperieren wird, oder wenn er herausfindet, dass dieser Spieler VERTRAUEND/FREUNDLICH mit einem ÄRGERLICHEN Spieler ist."""}
	],
	['text', {'title':'KOENIGIN', 'space':180, 'color':Color.darkgoldenrod,
	'text':"""Wird VERTRAUEND (sofern wenn nicht schon FREUNDLICH ist) to a player when she discovers that this player will attack an ENRAGING player."""}
	],
	['text', {'title':'FASSADE', 'space':140, 'color':Color.black,
	'text':"""Wenn nicht WÜTEND mit einem Spieler ist, imitiert seine Relation, nachdem sie ihn nachgeforscht hat."""}
	],
	['text', {'title':'INTRIGE', 'space':610, 'color':Color.darkcyan,
	'text':"""Wenn sie Briefe erhaltet, vergleicht sie die Information mit früheren Daten. Wenn es einen Widerspruch zwischen Nachricht und Daten gibt, glaubt sie an die Daten. Wenn der Widerspruch zwischen Briefe ist, gibt sie den Vorrang dem Brief des vertrauenswürdiger Absenders.
	Falls es keinen Widerspruch gibt und der Brief von einem Verdächtigen Spieler kommt, forscht sie die Gültigkeit dieser Information nach, wenn möglich. Wenn nicht, lehnt sie ab.
	Auf jeden Fall wird sie WÜTEND, wenn sie entdeckt, dass die Information falsch ist. Auf der anderen Seite, wenn die Information echt ist und den Absender nicht erwähnt, verbessert sie seine Relation zu ihm."""}
	],
	['text', {'title':'AKTIONPRIORITAET (FREUNDLICH/VERTRAUEND)', 'space':800, 
	'text':"""1- Falls es Runde 6 ist, attackiert jeden Spieler.
	2- Falls es Runde 3 ist, forscht einen FEINDSELIGEN Spieler nach.
	3- Attackiert einen ÄRGERLICHEN Spieler.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Falls es Runde 2 oder früher ist, teilt Information mit einem FEINDSELIGEN Spieler über einen eingehenden Angriff gegen den.
	6- Forscht den Akteur von einer Nachricht, die sie von einem VERDÄCHTIGEN/FEINDSELIGEN Spieler erhalten hat, nach.
	7- Teilt Information mit einem BEFREUNDETEN/VERTRAUTEN Spieler über einen eingehenden Angriff gegen den.
	8- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler, dass ein VERDÄCHTIGER/FEINDSELIGER/ÄRGERLICHER Spieler sie attackieren wird.
	9- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler, dass ein VERTRAUTER Spieler sie attackieren wird.
	10- Wenn sie der Erste in der Reihenfolge nicht ist, erhöht ihren Einfluss."""}
	],
	['text', {'title':'AKTIONPRIORITAET (MISSTRAUISCH)', 'space':680, 'color':Color.black,
	'text':"""1- Falls es Runde 6 ist, attackiert jeden Spieler.
	2- Falls es Runde 3 ist, forscht einen FEINDSELIGEN Spieler nach.
	3- Attackiert einen ÄRGERLICHEN Spieler.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Falls es Runde 2 oder früher ist, teilt Information mit einem FEINDSELIGEN Spieler über einen eingehenden Angriff gegen den.
	6- Forscht den Akteur von einer Nachricht, die sie von einem VERDÄCHTIGEN Spieler erhalten hat, nach.
	7- Forscht einen VERDÄCHTIGEN Spieler nach.
	8- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler, dass ein FEINDSELIGEN Spieler sie attackieren wird.
	9- Wenn sie der Erste in der Reihenfolge nicht ist, erhöht ihren Einfluss.
	10- Attackiert einen VERDÄCHTIGEN Spieler."""}
	],
	['text', {'title':'AKTIONPRIORITAET (FEINDLICH/WÜTEND)', 'space':280, 'color':Color.black,
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Erzählt einem BEFREUNDETEN/VERTRAUTEN Spieler dass ein ÄRGERLICHER Spieler, den in (1) erwähnt wurde, sie attackieren wird.
	3- Tell the ENRAGING player mentioned in (2) that the TRUSTED/BEFRIENDED player mentioned in (2) will ally with them.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler, dass ein FEINDSELIGEN Spieler sie attackieren wird.
	6- Teilt Information mit einem FEINDSELIGEN Spieler über einen eingehenden Angriff gegen den.
	7- Forscht einen VERDÄCHTIGEN Spieler nach, den in (2) erwähnt wurde."""}
	]]
	]

func open_pages():
	var current_y = 10
	var page = pages[current_page]
	
	var id = 0
	for paragraph in page:
		var instance
		if paragraph[0] == 'text':
			instance = paragrapher.instance()
			var color = Color.black if !paragraph[1].has('color') else paragraph[1]['color']
			instance.setup(paragraph[1]['title'], paragraph[1]['text'], id, color)
			instance.connect("spoiler_pressed", self, "set_text_revealed")
				
		elif paragraph[0] == 'image':
			instance = imager.instance()
			instance.texture = paragraph[1]['image']
		
		id += 1
		add_child(instance)
		instances.append(instance)
		instance.set_position(Vector2(90, current_y))
		current_y += 14 + paragraph[1]['space']

# ------------ SETTING STUFF -------------------------

func reveal_all_instances(revealed):
	for i in range(instances.size()):
		set_text_revealed(revealed, i)

func set_text_revealed(revealed, id):
	if !instances[id].has_method('set_revealed'):
		return
		
	if instances[id].get_revealed() == revealed:
		return
	
	var page = pages[current_page]
	instances[id].set_revealed(revealed)
	
	# sobe (negativo) se escondendo
	var minus = -1 if revealed == false else 1
	
	for i in range(id+1, instances.size()):
		var instance = instances[i]
		instance.set_position(instance.get_position() + Vector2(0, minus*(page[id][1]['space']-40)))
	pass
	
# -------------------- INPUT --------------------

# scrolling
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			# zoom in
			if event.button_index == BUTTON_WHEEL_UP and instances[0].get_position().y <= 14:
				scroll(scroll_speed)
			# zoom out
			if event.button_index == BUTTON_WHEEL_DOWN:
				scroll(-scroll_speed)
					
func scroll(scroll_amount):
	for instance in instances:
		instance.set_position(instance.get_position() + Vector2(0, scroll_amount))

func _on_CloseButton_button_up():
	emit_signal("closed_manual")
	close()


func update_page():
	for instance in instances:
		instance.queue_free()
	instances.clear()
	
	open_pages()

func _on_BackButton_button_up():
	if current_page == 0:
		current_page = pages.size()-1
	else:
		current_page -= 1
	update_page()

func _on_NextButton_button_up():
	if current_page == pages.size()-1:
		current_page = 0
	else:
		current_page += 1
	update_page()

func _on_EyeButton_button_up():
	reveal_all_instances(true)

func _on_ClosedEyeButton_button_up():
	reveal_all_instances(false)


func _on_Background_scrolling(scroll_amount, speed):
	scroll(scroll_amount)
