extends "res://Scripts/Game.gd"

export(PackedScene) var popupbox

export var these_players = [['Grolk', Texture], 
							['Daint', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Salem', 'Daint', 'Grolk']

var texts = []
var current_text = 0
var stance_changes = 0

# ------------------ SETUP ------------------------

# setup
func _ready():
	game_setup(these_players, this_turn_order)
	ai_node('Grolk').set_rep(player_character, -1)
	
	setup_texts()
	next_popup(false)
	
func setup_texts():
	match(Global.get_language()):
		0:
			texts = [['The Long Game is a diplomacy/intrigue game. Its main mechanic revolves around the Prisoner\'s Dilemma - a game theory-related thought experiment.', true],
			['At every turn, every player chooses a Stance (Passive/Agressive) towards another player. To change Stances, click on the button below a player\'s portrait.', true],
			['Good. In general, the Passive Stance is better diplomatically and is beneficial for both players, but it exposes the player to getting betrayed.', false],
			['On the other hand, the Agressive Stance is better for the individual, though it costs an Action and creates resentment between players.', true],
			['The game lasts 6 rounds, and each player has 3 Actions per round. Aside from Attack, Actions can also be spent on INVESTIGATION and DIPLOMACY.', true],
			['Investigations are great for obtaining crucial information on other players. To investigate someone, click on their portrait and then on INFO.', true],
			['Investigate GROLK, THE ORC.', true],
			['Grolk trusts you, but it is possible to know his opinion towards all other players as well. Click on the portrait on the right side of the panel to change the other character.', false],
			['Good. So, Grolk trusts you, but doesn\'t trust Daint. That could be used as a weapon... We\'ll see how to do that up ahead.', false],
			['Each NPC has a distinct personality, which can be examined by clicking on the button to the right of INFO. Pay extra attention to the sections BROTHERHOOD and SIMPLE-MINDED.', true],
			['Grolk always trusts his allies, and becomes Hostile to anyone that attacks them. With these traits, it is possible to influence him to attack another person.', false],
			['The message that we want to give is that another person is attacking us. To do that, we\'ll use Diplomacy to send a letter to Grolk.', true],
			['Select the appropriate options on Grolk\'s Diplomacy Area and click Send.', true],
			['Grolk:\nMiserable traitorous dwarf! Brother, do not worry. My men will kill, cut and skin every little one they can find!', false],
			['Good! Now, advance your turn.', true]]
		1:
			texts = [['The Long Game é um jogo de diplomacia e intriga. Sua principal mecânica gira em torno do Dilema do Prisioneiro - um experimento mental sobre teoria de jogos.', true],
			['A todo turno, cada jogador escolhe uma Postura (Passiva/Agressiva) em relação a outro jogador. Para trocar de Postura, clique no botão abaixo do perfil de um jogador.', true],
			['Muito bem. No geral, a postura Passiva é mais diplomática e melhor para o grupo, mas abre o jogador à possibilidade de ser traído.', false],
			['Por outro lado, a postura Agressiva é melhor para o indíviduo, porém custa uma Ação e cria resentimento entre jogadores.', true],
			['O jogo dura 6 rounds, e cada jogador tem 3 Ações por round. Além de Ataque, Ações também podem ser gastas com INVESTIGAÇÃO e DIPLOMACIA.', true],
			['Investigações são úteis para obter informação crucial sobre outros jogadores. Para investigar alguém, clique em seu retrato e depois em INFO.', true],
			['Investigue GROLK, O ORC.', true],
			['Grolk confia em você, mas é possível saber sua opinião em relação à outros jogadores também. Clique no retrato no lado direito do painel para mudar o outro jogador.', false],
			['Muito bem. Então, Grolk confia em você, mas não confia em Daint. Isso pode ser usado como arma... Veremos como fazer isso a seguir.', false],
			['Cada NPC tem uma personalidade distinta, que pode ser examinada clicando no botão ao lado direito de INFO. Preste atenção especial nas seções IRMANDADE e IMBECIL.', true],
			['Grolk sempre confia em seus aliados, e fica Hostil a qualquer um que atacá-los. Com essas características, é possível influenciá-lo a atacar outra pessoa.', false],
			['A mensagem que queremos passar é de que outra pessoa está nos atacando. Para isso, utilizaremos a mecânica de Diplomacia, enviando uma carta para Grolk.', true],
			['Para fazer isso, selecione as opções desejadas na Área de Diplomacia de Grolk e clique Enviar.', true],
			['Grolk:\nAnão traidor miserável! Irmão, não se preocupe. Meus homens vão matar, cortar e desfiar todo pequeno que verem pela frente!', false],
			['Muito bem! Agora, avance o turno.', true]]

# --------------- ACTUALLY OPENING --------------------------------

func next_popup(override):
	if current_text < texts.size() and (texts[current_text][1] || override):
		open_popupbox(Vector2(825, 184), Vector2(102.578, 412), 1.6, texts[current_text][0])
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
func _on_SalemAI_pressed_info(enemy_name):
	if enemy_name == 'Grolk':
		current_text = 7
		next_popup(true)


func point_info_request(requester, enemy_requested_name):
	pass_point_info(requester, enemy_requested_name)

# answering relation info requests
func relation_info_request(requester, enemy_requested_name, opponent_requested_name):
	pass_relation_info(requester, enemy_requested_name, opponent_requested_name)

func matchtable_info_request(requester, enemy_requested_name, opponent_requested_name):
	pass_matchtable_info(requester, enemy_requested_name, opponent_requested_name)


func closed_manual():
	print('closed manual ' + str(current_text))
	if current_text == 10:
		next_popup(true)


func _on_SalemAI_pressed_opponent():
	if current_text == 8:
		next_popup(true)


func _on_SalemAI_send_message(character_name, package, recipient):
	if package == ['Daint',1,'Salem'] and recipient == 'Grolk':
		next_popup(true)


func _on_SalemAI_advance_turn(character_name):
	print(str(current_text))
	if current_text == 15:
		get_tree().change_scene("res://Mini Scenes/Tutorial_2.tscn")
