extends Node

signal point_info_request
signal matchtable_info_request
signal relation_info_request

signal alter_actions
signal alter_points
signal alter_round

signal send_message
signal advance_turn

signal gain_rep
signal lose_rep
signal set_rep

signal done_setup

signal gain_influence
signal lose_influence

var character_name = ''
var _points = 0
var _actions = 3
var stances = [{}, {}, {}, {}, {}, {}]
var relations = {}
var _current_round = 1
var _info_til_round = {}

var player_character = ''
var players = []
var turn_order = []
var dip_phrases = []

# {[info]:round}

# lists all letters received
var letter_list = []

# lists all pieces of info competitor believes in
var info_list = {}

# {['', x]:['','']} a list of (names associated w/ a list of names)
# the lists therein say who knows about the names associated with such lists
var ann_dict = {}

# lists all pieces of info (messages) competitor wants to share
var snitch_list = []

# {[info]:[round, sender]}
# lists all pieces of info (messages) competitor remembers
var memory_list = {}
var memory_time

func _ready():
	pass # Replace with function body.

# ------------------------- SETUP ------------------------

func setup(player_character, players, turn_order, dip_phrases):
	self.player_character = player_character
	self.players = players
	self.turn_order = turn_order
	self.dip_phrases = dip_phrases
	
	for player in players:
		_info_til_round[player] = 1
		
	for player in relations.keys():
		ann_dict[[player, 0]] = []
		ann_dict[[player, 1]] = []
		
	emit_signal('done_setup')


# ---------------------- ACTIONS -----------------------

func forget_info():
	for memory in memory_list:
		if memory_list[memory][0] <= get_current_round() - memory_time:
			memory_list.erase(memory)

func attack(_target_relation):
	var return_list = []
	for target_order in turn_order:
		if relations[target_order] == _target_relation:
			change_stance(target_order, get_current_round(), 1)
			return_list.append(target_order)
	return return_list

func say_to_list(_order, _informed_relation_list, _target_relation_list, type):
	# look for players that fit the target relation
	for target in turn_order:
		if _target_relation_list.has(relations[target]) and target != character_name:
			# look for players that don't know about my relation with this person
			for sally in turn_order:
				if _informed_relation_list.has(relations[sally]) and sally != character_name and sally != target and target != character_name:
					match(type):
						'warn':
							warn(_order, sally, target)
						'tell':
							tell(_order, sally, target)
						'threat':
							threat(_order, sally, target)

func tell(_order, _recipient, _target):
	if manage_ann(_order, _recipient, _target):
		send_message(_target, _order, character_name, _recipient)
		
func warn(_order, _recipient, _target):
	if manage_ann(_order, _recipient, _target):
		send_message(_target, _order, _recipient, _recipient)
		
func threat(_order, _recipient, _target):
	if manage_ann(_order, _recipient, _target):
		send_message(character_name, _order, _target, _recipient)
		
func send(_order, _recipient, _actor, _receiver):
	send_message(_actor, _order, _receiver, _recipient)

func snitch(snitch_list, recipient_relation_list):
	var already_snitched = []
	# Snitching
	for info in snitch_list:
		if recipient_relation_list.has(relations[info[2]]) and !already_snitched.has(info[2]):
			warn(info[1], info[2], info[0])
			already_snitched.append(info[2])
			snitch_list.erase(info)
			
func manage_ann(_order, _recipient, _target):
	if !ann_dict[[_target, _order]].has(_recipient):
		# give info about ann to sally
		ann_dict[[_target, _order]].append(_recipient)
		if ann_dict[[_target, stance_inverse(_order)]].has(_recipient):
			ann_dict[[_target, stance_inverse(_order)]].erase(_recipient)
		return true
	return false

func gain_influence():
	if get_actions() > 0:
		spend_action()
		emit_signal('gain_influence', character_name)

func lose_influence():
	if get_actions() > 0:
		spend_action()
		emit_signal('lose_influence', character_name)


# ------------------- TRAITS ---------------------------

func trait_general(memory_list, roun, info):
	# General
	for memory in memory_list.keys(): 
#		print('general ' + str(memory_list.keys().size()))
#		print('Info: ' + str(info[0]) + ' ' + str(info[1]) + ' ' + str(info[2]) + ' ' + str(roun))
#		print('Mem: ' + str(memory[0]) + ' ' + str(memory[1]) + ' ' + str(memory[2]) + ' ' + str(memory_list[memory][0]))
		# memory is true
		if info == memory and roun == memory_list[memory][0] and relations[memory_list[memory][1]] > -2:
			emit_signal('gain_rep', memory_list[memory][1])
			memory_list.erase(memory)
		# memory is false
		elif info[0] == memory[0] and info[2] == memory[2] and info[1] != memory[1] and roun == memory_list[memory][0] and relations[memory_list[memory][1]] < 2:
			emit_signal('lose_rep', memory_list[memory][1])
			memory_list.erase(memory)

func trait_intuition(en_stances, op_stances):
	var _previous_round = get_current_round()-1
	
	if _previous_round == 0:
		return 0
	if (en_stances[_previous_round-1] == 1 and op_stances[_previous_round-1] == 0) or (en_stances[_previous_round-1] == 0 and op_stances[_previous_round-1] == 1):
		return 2
	elif en_stances[_previous_round-1] == 1 and op_stances[_previous_round-1] == 1:
		return 1
	else:
		return -1

func trait_justice(report, player_name):
	if report[1] == 1 and report[0] == 0: # Justice: backstab -> furious
		emit_signal('set_rep', player_name, 2)
		return true
	return false

func trait_brotherhood(info, relations):
	# Alliance - my friend likes someone
	if relations[info[0]] < 0 and info[1] == 0 and relations[info[2]] != 2 and relations[info[2]] != -2:
		emit_signal('set_rep', info[2], -1)
	
	# Brotherhood - someone hates my friend
	elif relations[info[0]] != 2 and info[1] == 1 and relations[info[2]] < 0:
		emit_signal('set_rep', info[0], 1)

func trait_allegiances(info, relations):
	if info[1] == 0: # positive interaction
		# Allegiances
		if relations[info[2]] == 2 and relations[info[0]] != 2:
			emit_signal('set_rep', info[0], 1)
		elif relations[info[0]] == 2 and relations[info[2]] != 2 and info[2] != character_name: 
			emit_signal('set_rep', info[2], 1)

func trait_reactive(info, relations):
	# Reactive - becoming suspicious
	if relations[info[0]] > 0 and info[1] == 0 and info[2] == character_name:
		emit_signal('set_rep', info[0], 0)
	# Reactive - becoming hostile
	elif info[1] == 1 and info[2] == character_name:
		emit_signal('set_rep', info[0], 1)

func trait_reactive_relations(enemy_name, relation, opponent_name):
	# Reactive pt. 2
	if relation > 0 and opponent_name == character_name and relations[enemy_name] < 2:
		relations[enemy_name] = 1

# ---------------- SEND MESSAGE ----------------------------

func send_message(name1, message, name2, recipient):
	send_letter(character_name, name1, message, name2, recipient)
	
func send_letter(sender, name1, message, name2, recipient):
	if name1 == name2 || get_actions() <= 0 || recipient == sender || name1 == recipient:
		return
	
	spend_action()
	var package = [name1, message, name2]
	
	# sender, message, recipient
	emit_signal('send_message', sender, package, recipient)

# ----------------- HELPER FUNCTIONS -------------------

func stance_inverse(_stance):
	if _stance == 1:
		return 0
	else:
		return 1

# ------------------- GETTER / SETTER --------------------

func change_stance(_character, _round, stance):
	if stance == 0:
		gain_action()
		set_stance(_character, _round, stance)
		return true
	elif get_actions() > 0:
		spend_action()
		set_stance(_character, _round, stance)
		return true
	return false

func set_stance(_character, _round, stance):
	stances[_round-1][_character] = stance

func get_stance(_character, _round):
	return stances[_round-1][_character]
	
func get_stances_against(_character, _round):
	if _round == 0:
		return []
	
	var stances_vs = []
	for i in range(0, _round):
		stances_vs.append(stances[i][_character])
	return stances_vs

func improve_relations(_character):
	relations[_character] += 1

func worsen_relations(_character):
	relations[_character] -= 1
	
func get_relation(_character):
	return relations[_character]

func get_actions():
	return _actions
	
func set_action(_new):
	_actions = _new
	emit_signal("alter_actions", _actions)
	
func spend_action():
	_actions -= 1
	emit_signal("alter_actions", _actions)

func gain_action():
	_actions += 1
	emit_signal("alter_actions", _actions)
	
func get_points():
	return _points
	
func add_points(_new):
	_points += _new
	emit_signal("alter_points", _points)

func receive_turn_order_info(turn_message):
	turn_order = turn_message.duplicate(true)

func get_influence():
	for i in range(turn_order.size()):
		if turn_order[i] == character_name:
			return i
	
func get_info_til_round(_character):
	return _info_til_round[_character]
	
func set_info_til_round(_character, _new):
	_info_til_round[_character] = _new
	
func get_current_round():
	return _current_round
	
func set_current_round(_new):
	_current_round = _new
	emit_signal("alter_round", _new)
	
func add_to_letter_list(author, letter):
	letter_list.append([author, letter[0], letter[1], letter[2]])
	
func get_player_character():
	return player_character
	
func get_character_name():
	return character_name

func get_players():
	return players
	
func get_dip_phrases():
	return dip_phrases
	
func get_dip_phrase(i):
	return dip_phrases[i]
	
# --------------- DEBUG -------------

func print_turn():
	if Global.get_debug_enabled():
		print(character_name.to_upper() + ' TURN')
		
func print_mail(sender, message):
	if Global.get_debug_enabled():
		print(character_name + " mail. Sender: "+ sender + ", Message: " + 
			message[0] + ' ' + get_dip_phrase(message[1]) + ' ' + message[2])
			
func print_invest(_target):
	if Global.get_debug_enabled():
		print(character_name + ' investigating ' + _target)
