extends "res://Mini Scenes/Scenes/Tutorial.gd"


export var these_players = [['Zardri', Texture], 
							['Thoren', Texture], 
							['Horlin', Texture], 
							['Drakoth', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Drakoth', 'Horlin','Salem', 'Thoren', 'Zardri',]

# ------------------ SETUP ------------------------

# setup
func _ready():
	Global.set_advanced_enabled(false)
	game_setup(these_players, this_turn_order)
	ai_node('Zardri').set_relations(player_character, -1)
	ai_node('Thoren').set_relations(player_character, 0)
	ai_node('Horlin').set_relations(player_character, 0)
	ai_node('Drakoth').set_relations(player_character, 1)
	
	setup_texts()
	advance_popup(true)
	Audio.play_music(Audio.fury_theme)
	
func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[("'An Emperor's son, when cast from grace, rises above, rises again.'\nThat was the song to which bards played " +
			"when Drakoth's allies came to his side.")],
			[("Horlin and Thoren, two imperial loyalists, arrived to help Drakoth in his toil. As nobles and warriors alike " +
			"declared their support for Drakoth publicly, his Influence rose again.")],
			[("While you already know Thoren, Horlin is still a stranger to you. He's the mayor of Glittergold, a medium-sized " +
			"village of gnomes.")],
			[("Although their military is small and weak, Horlin thrives in his falsification abilities and influence " +
			"manipulation.")],
			[("Horlin: Morning, kid. Yeah, sorry about the whole Drakoth-is-my-king thing, but it just goes with the times. Hey, " +
			"if you need any, uh, writing services, call me anytime.")],
			[("With four players on the board, this is your last test. Good luck.")],
			]
		1:
			texts = [[''],
			[("'O filho do Imperador, após desgraça e falha, levanta novamente, levanta para a batalha.'\nEsta foi " +
			"a canção que bardos cantaram quando os aliados de Drakoth vieram.")],
			[("Horlin e Thoren, dois legalistas do império, chegaram para ajudar Drakoth em seu infortúnio. Com ambos nobres e " +
			"guerreiros declarando suporte a Drakoth, sua Influência ergueu-se novamente.")],
			[("Apesar de você já conhecer Thoren, Horlin ainda é um estranho para você. Ele é o prefeito de Brilha-ouro, uma " +
			"vila mediana de gnomos.")],
			[("Apesar de seu exército ser pequeno e fraco, Horlin é nato em falsificação e manipulação de Influências.")],
			[("Horlin: Opa, bom dia, jovem. É, desculpa aí pelos 'Drakoth é meu rei', mas eu não tenho muita escolha. Aí, se " +
			"você precisar de qualquer, hã, serviços de escrivão, é só me chamar.")],
			[("Com quatro jogadores no tabuleiro, este é seu último teste. Boa sorte.")],
			]
		2:
			texts = [[''],
			[("'Der Sohn des Kaisers, nach Schande und Verlust, steht wieder auf, und dreht sich um.'\nThat was the song to which bards played " +
			"when Drakoth's allies came to his side.")],
			[("Horlin and Thoren, two imperial loyalists, arrived to help Drakoth in his toil. As nobles and warriors alike " +
			"declared their support for Drakoth publicly, his Influence rose again.")],
			[("While you already know Thoren, Horlin is still a stranger to you. He's the mayor of Glittergold, a medium-sized " +
			"village of gnomes.")],
			[("Although their military is small and weak, Horlin thrives in his falsification abilities and influence " +
			"manipulation.")],
			[("Horlin: Morning, kid. Yeah, sorry about the whole Drakoth-is-my-king thing, but it just goes with the times. Hey, " +
			"if you need any, uh, writing services, call me anytime.")],
			[("With four players on the board, this is your last test. Good luck.")],
			]


# ------------- SIGNAL STUFF -------------------------------


func advance_turn(_char):
	_advance_turn(_char)
