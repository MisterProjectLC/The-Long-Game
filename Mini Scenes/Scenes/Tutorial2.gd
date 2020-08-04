extends "res://Scripts/Game.gd"

export(PackedScene) var popupbox

export var these_players = [['Grolk', Texture], 
							['Thoren', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Salem', 'Thoren', 'Grolk']

var texts = []
var current_text = 0
var stance_changes = 0

# ------------------ SETUP ------------------------

# setup
func _ready():
	game_setup(these_players, this_turn_order)
	ai_node('Grolk').set_rep(player_character, 1)
	ai_node('Thoren').set_rep(player_character, 0)
	
	setup_texts()
	next_popup(false)
	Audio.play_music(Audio.fury_theme)
	
func setup_texts():
	match(Global.get_language()):
		0:
			texts = [['With ferocity and hatred, the green armies of Grolk, the Orc, destroyed and slaughtered the feeble forces of Daint Stoneshield, old Prince of the Mountain.', true],
			['News of his death soon spread like wildfire, and not very long after came Thoren, his cousin, in search of revenge.', true],
			['Thoren:\nHuman! I am Thoren Stoneshield, son of Thrarg, cousin of Daint and hero of Varlenda.', true],
			['Thoren:\nI came in search of justice. I don\'t trust you nor your race, but I assure you: if you stay out of my way, we won\'t have problems.', true],
			['Meanwhile, tall, strange messengers with long hair and fair skin emerged with lies over old Grolk\'s ears. A brotherhood turned hostile...', true],
			['Grolk:\nSo it was you who killed Bugrash of the Hill?! How did I ever take you as a brother? Go away, smooth-skinned!', true],
			['Try to win the game. Now, you won\'t have any help.', true]]
		1:
			texts = [['Com ferocidade e ódio, os exércitos verdes de Grolk destruíram e massacraram as forças caducas do antigo Princípe da Montanha, Daint Escudo-de-Pedra.', true],
			['As notícias de sua morte se espalharam como um incêndio, e não demorou muito para Thoren, seu primo, aparecer em busca de vingança.', true],
			['Thoren:\nHumano! Eu sou Thoren Escudo-de-Pedra, filho de Thrarg, primo de Daint e herói de Varlenda.', true],
			['Thoren:\nEu vim em busca de justiça. Não confio em você e sua raça, mas eu garanto: se ficarem fora de meu caminho, não teremos problemas.', true],
			['Enquanto isso, estranhos mensageiros altos e de cabelos longos vieram com mentiras sobre os ouvidos de Grolk, o Orc. Uma irmandade acabou se tornando hostil...', true],
			['Grolk:\nEntão foi você quem matou Bugrash da Colina?! Como tomei você como irmão? Saia daqui, pele-lisa!', true],
			['Tente vencer o jogo. Agora, você não terá mais ajuda.', true]]

# --------------- ACTUALLY OPENING --------------------------------

func next_popup(override):
	if current_text == 2:
		$SalemAI.set_profile_visible('Thoren', true)
	
	if current_text < texts.size() and (texts[current_text][1] || override):
		open_popupbox(Vector2(825, 184), Vector2(0, 0), 1.6, texts[current_text][0])
		current_text += 1
	

func open_popupbox(_new_sizer, _new_position, _new_speed, _new_text):
	var popup = popupbox.instance()
	add_child(popup)
	move_child(add_child(popup), get_child_count()-1)
	popup.connect('closed_box', self, 'next_popup')
	
	popup.tutorial_setup(_new_sizer, _new_position, _new_speed, _new_text)


# ------------- SIGNAL STUFF -------------------------------

# Clicking on stance
func _on_SalemAI_changed_stance():
	stance_changes += 1
	if stance_changes >= 2:
		next_popup(true)

# Investigating Grolk
func _on_SalemAI_pressed_info():
	current_text = 7
	next_popup(true)


func point_info_request(requester, enemy_requested_name):
	pass_point_info(requester, enemy_requested_name)

# answering relation info requests
func relation_info_request(requester, enemy_requested_name, opponent_requested_name):
	pass_relation_info(requester, enemy_requested_name, opponent_requested_name)

func matchtable_info_request(requester, enemy_requested_name, opponent_requested_name):
	pass_matchtable_info(requester, enemy_requested_name, opponent_requested_name)


func advance_turn(_char):
	_advance_turn(_char)

func gain_influence(character_name):
	_gain_influence(character_name)
	
func lose_influence(character_name):
	_lose_influence(character_name)
