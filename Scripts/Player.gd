extends "res://Scripts/Competitor.gd"

signal changed_stance
signal pressed_info
signal closed_manual
signal pressed_opponent

export var intelligences = []

export(PackedScene) var profile
export(PackedScene) var panel
export(PackedScene) var manual
export(PackedScene) var letters_panel
var current_panel

export(PackedScene) var mail_viewer
export(PackedScene) var report_viewer

var turn_order_text = 'Turn Order'
var points_text = 'Points'
var round_text = 'Round'
var message_text = 'Message from'

var _delta_influence = 0

# ------------------ SETUP --------------------------

# other players-dependant setup
func _on_SalemAI_done_setup():
	for i in range(len(players)):
		if players[i][0] != character_name:
			# profile creation
			var _new = profile.instance()
			add_child(_new)
			move_child(_new, get_child_count()-1)
			
			# profile setup
			_new.rect_position = Vector2(45+(244*i),136)
			_new.connect("portrait_click", self, "_portrait_pressed")
			_new.connect("stance_change", self, "_stance_pressed")
			_new.name = players[i][0]
			_new.add_to_group("Profiles")
			_new.setup(players[i])
		
	language(Global.get_language())
	
func language(language):
	turn_order_text = Global.mains[language]['Turn Order']
	$AdvanceTurn.text = Global.mains[language]['Advance']
	points_text = Global.mains[language]['Points']
	$Points.text = Global.mains[language]['Points'] + ': 0'
	round_text = Global.mains[language]['Round']
	message_text = Global.mains[language]['Message']
	
	# Each Passive/Agressive Button
	for profile in get_tree().get_nodes_in_group("Profiles"):
		if profile.name != character_name:
			profile.language(language)

func _ready():
	character_name = 'Salem'
	traits_list = ["Player Character", "Seer", "Charismatic"]
	
	relations = {'Grolk':0,'Kallysta':0,'Obrulena':0,'Thoren':0,'Edraele':0,'Salem':-2, 'Daint': 0}
	_info_til_round = {'Grolk':0,'Kallysta':0,'Obrulena':0,'Thoren':0,'Edraele':0, 'Daint': 0}

# -------------------- SIGNAL HANDLING -----------------

func start_turn():
	print_turn()
	pass
	
# process turn order info
func receive_turn_order_info(turn_message):
	var _new = turn_order_text + ':\n'
	for i in range(turn_message.size()-1):
		_new = _new + turn_message[i]  + '-'
		if i == 2:
			_new = _new + '\n'
		
	_new = _new + turn_message[turn_message.size()-1]
	
	$TurnOrder.text = _new


# process report info
func receive_report_info(report):
	var viewer = report_viewer.instance()
	viewer.report_setup(character_name, get_players(), report)
	add_child(viewer)
	move_child(viewer, get_child_count()-1)
	
	for reporting in report.values():
		if reporting[0] == 0 and reporting[1] == 1:
			Audio.play_sound(Audio.backstab, 2)
			return


# request points info
func reveal_points():
	emit_signal('point_info_request', self, current_panel.get_enemy_name())

# process points info
func receive_points_info(info):
	current_panel.reveal_points(info)


# request matchtable info
func update_matchtable():
	emit_signal('matchtable_info_request', self, current_panel.get_enemy_name(), current_panel.get_opponent()[0])

# process matchtable info
func receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
	current_panel.update_matchtable(en_stances, op_stances)


# request relation info
func update_relation():
	emit_signal('relation_info_request', self, current_panel.get_enemy_name(), current_panel.get_opponent()[0])
	
# process relation info
func receive_relation_info(relation, enemy_requested_name, opponent_requested_name):
	current_panel.update_relation(relation)


# receive message
func receive_message(sender, roun, message):
	.receive_message(sender, roun, message)
	
	var mail_v = mail_viewer.instance()
	add_child(mail_v)
	move_child(mail_v, get_child_count()-1)
	mail_v.set_text(message_text + ': ' + sender + '\n\n' + message[0] + 
			' ' + get_dip_phrase(message[1]) + ' ' + message[2])


func set_profile_visible(_name, _new):
	Global.find_in_group(self, "Profiles", _name).visible = _new

# ------------------ PRESSING STUFF ---------------------

# request to open panel
func _portrait_pressed(enemy):
	current_panel = panel.instance()
	add_child(current_panel)
	move_child(current_panel, get_child_count()-1)
	current_panel.connect('info_pressed', self, '_info_pressed')
	current_panel.connect('letters_pressed', self, '_letters_pressed')
	current_panel.connect('opponent_pressed', self, '_opponent_pressed')
	current_panel.connect('update_matchtable', self, 'update_matchtable')
	current_panel.connect('send_message', self, '_send_message')
	
	current_panel.setup_panel(enemy, manual, get_info_til_round(enemy[0]), 
					get_players(), get_dip_phrases())
	
	if enemy[0] == 'Grolk':
		current_panel.connect("closed_manual", self, "closed_manual")
	
	update_matchtable()
	update_relation()
	reveal_points()


func closed_manual():
	emit_signal("closed_manual")

# pressed info button
func _info_pressed():
	if get_actions() > 0 and get_info_til_round(current_panel.get_enemy_name()) != get_current_round():
		print('info_pressed')
		spend_action()
		set_info_til_round(current_panel.get_enemy_name(), get_current_round())
		
		update_matchtable()
		update_relation()
		reveal_points()
		emit_signal("pressed_info", current_panel.get_enemy_name())


# pressed letters button
func _letters_pressed(enemy_name):
	var _new = letters_panel.instance()
	add_child(_new)
	move_child(_new, get_child_count()-1)
	
	_new.setup_panel(letter_list, enemy_name, get_dip_phrases())
	_new.connect("send_letter", self, "send_letter")
	pass


# pressed change other opponent button
func _opponent_pressed():
	update_matchtable()
	update_relation()
	emit_signal("pressed_opponent")

# pressed send button
func _send_message(name1, message_id, name2):
	send_message(name1, message_id, name2, current_panel.get_enemy_name())

# pressed stance button
func _stance_pressed(_target, _stance):
	if get_actions() > 0 || get_stance(_target[0], get_current_round()) == 1:
		change_stance(_target[0], get_current_round(), _stance)
		Global.find_in_group(self, "Profiles", _target[0]).new_stance(_stance)
		
		emit_signal('changed_stance')


# pressed advance button
func _on_AdvanceTurn_button_up():
	if _delta_influence < 0:
		for i in range(-_delta_influence):
			emit_signal('gain_influence', character_name)
	elif _delta_influence > 0:
		for i in range(_delta_influence):
			emit_signal('lose_influence', character_name)
	_delta_influence = 0
	
	emit_signal('advance_turn', character_name)
	
# pressed restart button
func _on_Restart_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/Main.tscn")
	
# pressed back button
func _on_Back_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/MainMenu.tscn")

# pressed more influence button
func _on_MoreInfluence_button_up():
	gain_influence()

# pressed less influence button
func _on_LessInfluence_button_up():
	lose_influence()

# pressed any button
func button_down():
	Audio.play_sound(Audio.button_press, 1)

# pressed info button
func _on_Info_button_up():
	var manual_panel = manual.instance()
	manual_panel.manual_setup(0)
	add_child(manual_panel)
	move_child(manual_panel, get_child_count()-1)

# ----------------- ALTER TEXT -----------------------------

# alter action UI when action count changes
func _on_SalemAI_alter_actions(_new):
	$Actions.text = str(_new)


# alter points UI when point count changes
func _on_SalemAI_alter_points(_new):
	$Points.text = str(points_text + ": " + str(_new))


func _on_SalemAI_alter_round(_round):
	$CurrentRound.text = round_text + ":" + str(_round)


# ------------- MISC ---------------------------

func gain_influence():
	if _delta_influence > 0:
		gain_action()
		_delta_influence -= 1
	elif get_actions() > 0 and get_influence() + _delta_influence != 0:
		spend_action()
		_delta_influence -= 1


func lose_influence():
	if _delta_influence < 0:
		gain_action()
		_delta_influence += 1
	elif get_actions() > 0 and get_influence() + _delta_influence != len(turn_order)-1:
		spend_action()
		_delta_influence += 1

