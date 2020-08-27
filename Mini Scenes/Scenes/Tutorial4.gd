extends "res://Mini Scenes/Scenes/Tutorial.gd"


export var these_players = [['Obrulena', Texture], 
							['Kallysta', Texture], 
							['Edraele', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Edraele','Salem', 'Obrulena', 'Kallysta',]

# ------------------ SETUP ------------------------

# setup
func _ready():
	Global.set_advanced_enabled(false)
	game_setup(these_players, this_turn_order)
	ai_node('Obrulena').set_relations('Kallysta', 1)
	ai_node('Kallysta').set_relations('Obrulena', 2)
	ai_node('Obrulena').set_relations(player_character, 0)
	ai_node('Kallysta').set_relations(player_character, -1)
	ai_node('Edraele').set_relations(player_character, 0)
	
	setup_texts()
	advance_popup(true)
	Audio.play_music(Audio.fury_theme)
	
func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[("EDRAELE, THE ELVEN QUEEN has arrived with her armies, claiming to have come to support Thoren's " +
			"campaign. You suspect, however, that she's here for power and influence.")],
			[("Edraele: Oh, hello there, sweetie... Here, have some of my sweet tea, made from the leaves of Varlenda... " +
			"Yes, Thoren's my champion, you know... Please, I urge you to stay out of our way.")],
			[("Now, you'll have to play a match against these three. Here's a summary of each opponent:")],
			[("Obrulena is a pacifist monk, and as such only enters combat when there's no other option. Additionally, " +
			"she frequently tries to mediate hostilities, ending them via diplomacy.")],
			[("Kallysta is suspicious of powerful figures and always tries to undermine strong alliances. If you have " +
			"many allies, be wary of her.")],
			[("Finally, Edraele is a cunning and intelligent leader, piting players against each other " +
			"and adjusting her behavior according to her opinion of the player character.")],
			[("Good luck.")],
			]
		1:
			texts = [[''],
			[("EDRAELE, A RAINHA ÉLFICA chegou com seus exércitos, anunciando que veio apoiar a campanha de Thoren." +
			"Você suspeita, porém, que ela está atrás de poder e influência.")],
			[("Edraele: Ah, olá, meu doce... Venha, beba um pouco de meu chá de folhas de Varlenda... " + 
			"Sim, Thoren é meu campeão, sabe... Por favor, peço para que fique fora de nosso caminho.")],
			[("Agora, você terá de jogar uma partida contra essas três. Aqui vem um resumo de cada oponente:")],
			[("Obrulena é uma monja pacifista, e por isso apenas entre em combate quando não há outra opção. Adicionamente, " +
			"ela frequentemente tenta mediar hostilidades, encerrando-as com diplomacia.")],
			[("Kallysta suspeita figuras poderosas e sempre tenta desestabilizar alianças fortes. Se você tiver muitos " +
			"aliados, tome cuidado com ela.")],
			[("Por último Edraele é uma líder esperta e inteligente, empurrando jogadores uns contra os outros e ajustando " +
			"sua estratégia de acordo com sua opinião do personagem do jogador.")],
			[("Boa sorte.")],
			]
		2:
			texts = [[''],
			[("EDRAELE, DIE ELFKÖNIGIN ist mit ihren Armeen angekommen. Sie behauptet, sie ist angekommen, um Thorens Kampagne " +
			"zu unterstützen. Jedoch denkst du, sie sucht nach Macht und Einfluss.")],
			[("Edraele: Ach, hallo, mein Süßchen... Hier, hab ein bisschen von meinem Tee von Varlenda..." +
			"Doch, Thoren ist mein Champion, weißt du... Bitte, ich bitte dich, aus unserem Weg zu gehen.")],
			[("Jetzt musst du ein Match gegen diesen drei spielen. Hier ist eine Übersicht jedes Gegners:")],
			[("Obrulena ist eine pazifiste Mönchin, und deswegen kämpft sie nur, wenn keine andere Option gibt. Zusätzlich " +
			"versucht sie oft, Hostilitäten zu vermitteln und sie durch Diplomatie zu enden.")],
			[("Kallysta vertraut mächtige Spieler nicht und versucht immer, stärke Allianze zu brechen. Wenn du viele " +
			"Verbündete hast, sei auf der Hut vor ihr.")],
			[("Um es abzuschließen ist Edraele eine clever und intelligente Leiter, die Spieler gegeneinander ausspielt und " +
			"ihre Verhalten entsprechend ihrer Meinung vom Spielercharakter anpasst.")],
			[("Viel Glück.")],
			]


# ------------- SIGNAL STUFF -------------------------------


func advance_turn(_char):
	_advance_turn(_char)
