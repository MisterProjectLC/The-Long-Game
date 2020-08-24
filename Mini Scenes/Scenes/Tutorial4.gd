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
			[("EDRAELE, THE ELVEN QUEEN has arrived with her armies, claiming to have come to support Thoren's " +
			"campaign. You suspect, however, that she's here for power and influence.")],
			[("Now, you'll have to play a match against these three. Here's a summary of each opponent:")],
			[("Obrulena is a pacifist monk, and as such only enters combat when there's no other option. Additionally, " +
			"she frequently tries to mediate hostilities, ending them via diplomacy.")],
			[("Kallysta is suspicious of powerful figures and always tries to undermine strong alliances. If you have " +
			"many allies, be wary of her.")],
			[("Finally, Edraele is a cunning and intelligent leader, piting players against each other " +
			"and adjusting her behavior according to her opinion of the player character.")],
			[("Good luck.")],
			]


# ------------- SIGNAL STUFF -------------------------------


func advance_turn(_char):
	_advance_turn(_char)

func gain_influence(character_name):
	_gain_influence(character_name)
	
func lose_influence(character_name):
	_lose_influence(character_name)
