extends "res://Mini Scenes/Scenes/Tutorial.gd"


export var these_players = [['Grolk', Texture], 
							['Thoren', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Salem', 'Thoren', 'Grolk']

# ------------------ SETUP ------------------------

# setup
func _ready():
	game_setup(these_players, this_turn_order)
	ai_node('Grolk').set_relations(player_character, 1)
	ai_node('Thoren').set_relations(player_character, 0)
	$SalemAI.set_portrait_visibility("Thoren", false)
	
	setup_texts()
	advance_popup(true)
	Audio.play_music(Audio.fury_theme)
	
func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[('With ferocity and hatred, the green armies of Grolk, the Orc, destroyed and slaughtered the feeble forces ' + 
			'of Daint Stoneshield, old Prince of the Mountain.')],
			['News of his death soon spread like wildfire, and not very long after came Thoren, his cousin, in search of revenge.'],
			['Thoren:\nHuman! I am Thoren Stoneshield, son of Thrarg, cousin of Daint and hero of Varlenda.'],
			[('Thoren:\nI came in search of justice. I don\'t trust you nor your race, but I assure you: if you stay '+
			'out of my way, we won\'t have problems.')],
			[('Meanwhile, tall, strange messengers with long hair and fair skin emerged with lies over old Grolk\'s ears. '+ 
			'A brotherhood turned hostile...')],
			['Grolk:\nSo it was you who killed Bugrash of the Hill?! How did I ever take you as a brother? Go away, smooth-skinned!'],
			['Try to win the game. Now, you won\'t have any help.']]
		1:
			texts = [[''],
			['Com ferocidade e ódio, os exércitos verdes de Grolk destruíram e massacraram as forças caducas do antigo Princípe da Montanha, Daint Escudo-de-Pedra.'],
			['As notícias de sua morte se espalharam como um incêndio, e não demorou muito para Thoren, seu primo, aparecer em busca de vingança.'],
			['Thoren:\nHumano! Eu sou Thoren Escudo-de-Pedra, filho de Thrarg, primo de Daint e herói de Varlenda.'],
			['Thoren:\nEu vim em busca de justiça. Não confio em você e sua raça, mas eu garanto: se ficarem fora de meu caminho, não teremos problemas.'],
			['Enquanto isso, estranhos mensageiros altos e de cabelos longos vieram com mentiras sobre os ouvidos de Grolk, o Orc. Uma irmandade acabou se tornando hostil...'],
			['Grolk:\nEntão foi você quem matou Bugrash da Colina?! Como tomei você como irmão? Saia daqui, pele-lisa!'],
			['Tente vencer o jogo. Agora, você não terá mais ajuda.']]
		2:
			texts = [[''],
			['Mit Bösartigkeit und Hass massakrierten die grüne Armeen von Grolk alle die schwache Truppen des alten Prinzen des Berges, Daint Steinschild.'],
			['Die Nachricht von seinem Tod verbreitete sich wie Lauffeuer. Es dauert nicht lang bis Thoren, sein Cousin, tauchte auf der Suche nach Rache auf.'],
			['Thoren:\nMensch! Ich bin Thoren Steinschild, Sohn von Thrarg, Cousin von Daint und Held von Varlenda.'],
			['Thoren:\nIch komme auf der Suche nach Gerechtigkeit. Ich vertraue weder Ihnen noch ihrer Rasse, aber ich garantiere Ihnen: wenn Sie mir aus dem Weg gehen, werden wir keine Probleme haben.'],
			['Unterdessen seltsame und große Boten mit langen Haaren und helle Haut kamen mit Lügen für Grolk. Eine Bruderschaft wurde feindlich...'],
			['Grolk:\nAlso warst du derjenige, der Bugrash des Hügels ermodet?! Wie habe ich dich als einen Bruder betrachtet? Verdufte, Glatthäutiger!'],
			['Versuche, das Spiel zu gewinnen. Jetzt wirst du keine Hilfe mehr haben.']]


# ------------- SIGNAL STUFF -------------------------------


func advance_turn(_char):
	_advance_turn(_char)

func gain_influence(character_name):
	_gain_influence(character_name)
	
func lose_influence(character_name):
	_lose_influence(character_name)


func _on_Tutorial2_advanced_popup():
	if current_text == 3:
		$SalemAI.set_portrait_visibility("Thoren", true)
