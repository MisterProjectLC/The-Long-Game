extends Node

signal point_info_request
signal matchtable_info_request
signal relation_info_request

signal alter_actions
signal alter_points
signal alter_round

signal send_message
signal advance_turn

signal improve_relations
signal worsen_relations
signal set_relations

signal gain_influence
signal lose_influence

signal gain_rep
signal lose_rep
signal set_rep

signal decree
signal vote

var character_name = ''
var traits_list = []
var _points = 0
var _actions = 3
var stances = [{}, {}, {}, {}, {}, {}]
var relations = {}
var _current_round = 1
var _info_til_round = {}
var _current_vote = null

var player_character = ''
var players = []
var turn_order = []
var dip_phrases = []

# {[info]:round}

# {player:["","",...]}
var opponent_trait_list = {}

# [[sender, actor, action, receiver]]
# lists all letters received
var letter_list = []

# {[info]]:roun}
# lists all pieces of info competitor believes in
var info_list = {}

# lists relations between players they obtained in investigations
var relation_list = []

# {['', x]:['','']} a list of (names associated w/ a list of names)
# the lists therein say who knows about the names associated with such lists
var ann_dict = {}

# lists all pieces of info (messages) competitor wants to share
var snitch_list = []

# {[info]:[round, sender]}
# lists all pieces of info (messages) competitor remembers
var memory_list = {}
var memory_time

# ------------------------- SETUP ------------------------

func _ready():
	signal_setup()


func signal_setup():
	# signal setup
	connect("advance_turn", get_parent(), "advance_turn")
	connect("gain_influence", get_parent(), "gain_influence")
	connect("lose_influence", get_parent(), "lose_influence")
	connect("point_info_request", get_parent(), "pass_point_info")
	connect("matchtable_info_request", get_parent(), "pass_matchtable_info")
	connect("relation_info_request", get_parent(), "pass_relation_info")
	connect("send_message", get_parent(), "send_message")
	connect("vote", get_parent(), "receive_vote")


func setup(_player_character, _players, _turn_order, _dip_phrases, _opponent_trait_list):
	self.player_character = _player_character
	self.players = _players
	self.turn_order = _turn_order
	self.dip_phrases = _dip_phrases
	self.opponent_trait_list = _opponent_trait_list
	
	for player in relations.keys():
		_info_til_round[player] = 1
		
	for player in relations.keys():
		ann_dict[[player, 0]] = []
		ann_dict[[player, 1]] = []



# ---------------------- ACTIONS -----------------------

func _investigate(_target):
	if get_actions() <= 0 || _target == character_name:
		return
		
	spend_action()
	set_info_til_round(_target, get_current_round())
	print_invest(_target)
	
	# look for their relation/history with all others
	for opponent in turn_order:
		if opponent != _target:
			if _target != get_player_character():
				emit_signal('relation_info_request', self, _target, opponent)
			emit_signal('matchtable_info_request', self, _target, opponent)
	return true


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


func say_to_list(_target_relation_list, _order, _informed_relation_list, type, only_once = false):
	# look for players that fit the target relation
	for target in turn_order:
		if _target_relation_list.has(relations[target]) and target != character_name:
			# look for players that don't know about my relation with this person
			for sally in turn_order:
				if _informed_relation_list.has(relations[sally]) and sally != character_name and sally != target and target != character_name:
					match(type):
						'warn':
							warn(target, _order, sally)
						'tell':
							tell(target, _order, sally)
						'threat':
							threat(target, _order, sally)
					if only_once:
						return

func tell(_target, _order, _recipient):
	if manage_ann(_target, _order, _recipient):
		return send_message(_target, _order, character_name, _recipient)
	return false

func warn(_target, _order, _recipient):
	if manage_ann(_target, _order, _recipient):
		return send_message(_target, _order, _recipient, _recipient)
	return false

func threat(_target, _order, _recipient):
	if manage_ann(_target, _order, _recipient):
		return send_message(character_name, _order, _target, _recipient)
	return false

func denounce(_target, _order, _object, _recipient):
	if manage_ann(_target, _order, _recipient):
		return send_message(_target, _order, _object, _recipient)
	return false

func send(_order, _recipient, _actor, _receiver):
	return send_message(_actor, _order, _receiver, _recipient)


func snitch(_snitch_list, recipient_relation_list):
	var already_snitched = []
	# Snitching
	for info in _snitch_list:
		if recipient_relation_list.has(relations[info[2]]) and !already_snitched.has(info[2]):
			warn(info[0], info[1], info[2])
			already_snitched.append(info[2])
			_snitch_list.erase(info)


func send_letter(sender, name1, message, name2, recipient):
	if name1 == name2 || get_actions() <= 0 || recipient == sender || name1 == recipient:
		return false
	
	spend_action()
	var package = [name1, message, name2]
	
	# sender, message, recipient
	emit_signal('send_message', sender, package, recipient)
	return true


func manage_ann(_target, _order, _recipient):
	if !ann_dict[[_target, _order]].has(_recipient):
		# give info about ann to sally
		ann_dict[[_target, _order]].append(_recipient)
		if ann_dict[[_target, stance_inverse(_order)]].has(_recipient):
			ann_dict[[_target, stance_inverse(_order)]].erase(_recipient)
		return true
	return false


func gain_influence():
	if get_actions() > 0 and turn_order.front() != character_name:
		spend_action()
		emit_signal('gain_influence', character_name)

func lose_influence():
	if get_actions() > 0 and turn_order.back() != character_name:
		spend_action()
		emit_signal('lose_influence', character_name)


func forge_letter(letter, index, change_count):
	if letter[1] == letter[3] || get_actions() < change_count:
		return false
	
	for _i in range(change_count):
		spend_action()
	
	letter_list[index] = letter
	return true


func ask_decree():
	pass


func receive_proposal(leader, action, object, vote = null):
	_current_vote = vote
	emit_signal("vote", character_name, vote)

func receive_vote(voter, vote):
	pass

func receive_decree(action, object):
	pass

# ----------------------------- TRAITS -------------------------------------------------
# --- TRAITS: DIRECT INTERACTION (REPORT) REACTIONS --------------------

func trait_hatred(report, player_name):
	match (relations[player_name]):
		-2: # Warm
			if report[0] == 0 and report[1] == 1: # Hatred: backstab -> furious
				set_relations(player_name, 2)
		-1: # Trusting
			if report[0] == 0 and report[1] == 1: # Hatred: backstab -> furious
				set_relations(player_name, 2)
		0: # Suspicious
			if report[0] == 0 and report[1] == 1: # Hatred: backstab -> hostile
				set_relations(player_name, 1)


func trait_justice(report, player_name):
	if report[1] == 1 and report[0] == 0: # Justice: backstab -> furious
		emit_signal('set_relations', player_name, 2)
		return true
	return false


func trait_reactive(info, _relations):
	# Reactive - becoming suspicious
	if _relations[info[0]] > 0 and info[1] == 0 and info[2] == character_name:
		emit_signal('set_relations', info[0], 0)
	# Reactive - becoming hostile
	elif info[1] == 1 and info[2] == character_name:
		emit_signal('set_relations', info[0], 1)


func trait_paranoid(info):
	# Paranoid
	if info[2] == character_name and info[1] == 1: # negative interaction
		emit_signal('set_relations', info[0], 2)

# --- TRAITS: INDIRECT INTERACTION REACTIONS --------------

func trait_alliance(info, _relations):
	# Alliance - someone coops with my friend or my friend coops with someone
	if _relations[info[2]] < 0 and info[1] == 0 and _relations[info[0]] != 2 and _relations[info[0]] != -2:
		emit_signal('set_relations', info[0], -1)
	elif _relations[info[0]] < 0 and info[1] == 0 and _relations[info[2]] != 2 and _relations[info[2]] != -2:
		emit_signal('set_relations', info[2], -1)


func trait_brotherhood(info, _relations):
	# Brotherhood - someone hates my friend
	if _relations[info[0]] != 2 and info[1] == 1 and _relations[info[2]] < 0:
		emit_signal('set_relations', info[0], 1)


func trait_allegiances(info, _relations):
	if info[1] == 0: # positive interaction
		# Allegiances
		if _relations[info[2]] == 2 and _relations[info[0]] != 2:
			emit_signal('set_relations', info[0], 1)
		elif _relations[info[0]] == 2 and _relations[info[2]] != 2 and info[2] != character_name: 
			emit_signal('set_relations', info[2], 1)

# --- TRAITS: RELATIONSHIP REACTIONS --------------

func trait_paranoid_relation(relation, enemy_name, opponent_name):
	if relation > 0 and opponent_name == character_name:
		relations[enemy_name] = 2


func trait_alliance_relation(relation, enemy_name, opponent_name):
	if relations[enemy_name] < 0 and relation < 0 and relations[opponent_name] != 2: # a friend likes this person
		set_relations(opponent_name, -1)


func trait_brotherhood_relation(relation, enemy_name, opponent_name):
	if relations[enemy_name] != 2 and relation > 0 and relations[opponent_name] < 0:
		set_relations(enemy_name, 1)


func trait_allegiances_relation(relation, enemy_name, opponent_name):
	if relations[enemy_name] != 2 and relation < 0 and relations[opponent_name] == 2:
		set_relations(enemy_name, 1)


func trait_reactive_relations(enemy_name, relation, opponent_name):
	# Reactive pt. 2
	if relation > 0 and opponent_name == character_name and relations[enemy_name] < 2:
		relations[enemy_name] = 1


func trait_vassal(turn_message):
	if turn_order.size() > 0 and turn_order[0] != turn_message[0]:
		worsen_relations(turn_order[0])
		improve_relations(turn_message[0])


# --- TRAITS: DEDUCE PLAYER ---------------------

func trait_intuition(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
	var _relation
	# Intuition
	if enemy_requested_name == get_player_character():
		var _previous_round = get_current_round()-1
		if _previous_round == 0:
			_relation = 0
		elif (en_stances[_previous_round-1] == 1 and op_stances[_previous_round-1] == 0) or (en_stances[_previous_round-1] == 0 and op_stances[_previous_round-1] == 1):
			_relation = 2
		elif en_stances[_previous_round-1] == 1 and op_stances[_previous_round-1] == 1:
			_relation = 1
		else:
			_relation = -1
		receive_relation_info(_relation, enemy_requested_name, opponent_requested_name)


# -- TRAITS: INFORMATION REACTION -----------------------

func trait_simpleminded_check(sender):
	if relations[sender] >= 0: # ignores suspicious or worse people
		return false
	return true


func trait_general(_memory_list, roun, info):
	# General
	for memory in _memory_list.keys(): 
#		print('general ' + str(memory_list.keys().size()))
#		print('Info: ' + str(info[0]) + ' ' + str(info[1]) + ' ' + str(info[2]) + ' ' + str(roun))
#		print('Mem: ' + str(memory[0]) + ' ' + str(memory[1]) + ' ' + str(memory[2]) + ' ' + str(memory_list[memory][0]))
		# memory is true
		if info == memory and roun == _memory_list[memory][0] and relations[_memory_list[memory][1]] > -2:
			emit_signal('improve_relations', _memory_list[memory][1])
			_memory_list.erase(memory)
		# memory is false
		elif info[0] == memory[0] and info[2] == memory[2] and info[1] != memory[1] and roun == _memory_list[memory][0] and relations[_memory_list[memory][1]] < 2:
			emit_signal('worsen_relations', _memory_list[memory][1])
			_memory_list.erase(memory)


func trait_intrigue_check(sender, roun, message, me):
	# check with facts
	for info in info_list:
		if info[0] == message[0] and info[1] != message[1] and info[2] == message[2] and info_list[info] == roun:
			emit_signal('set_relations', sender, 2)
			return false

	# check with testimony
	for memory in memory_list:
		# contradiction?
		if (memory[0] == message[0] and memory[2] == message[0] and memory[1] != message[1] and 
			memory_list[memory][0] == roun):
				# testimony contest
				if relations[memory_list[memory][1]] > relations[sender]:
					emit_signal('set_relations', sender, 2)
					return false
				elif relations[memory_list[memory][1]] < relations[sender]:
					emit_signal('set_relations', memory_list[memory][1], 2)
					break
	
	# check with myself
	if relations[sender] == 0:
		me.tactical_list[message] = [roun, sender]
		return false
	return true

# -- TRAITS: DIPLOMACY/VOTING -------------------------

func trait_ignorant_diplomatic(leader, vote):
	if vote == 1:
		improve_relations(leader)
	else:
		worsen_relations(leader)


# ---------------- BASE FUNCTIONS ----------------------------

func receive_message(sender, _roun, message):
	print_mail(sender, message)
	add_to_letter_list(sender, message)


func receive_fact(roun, fact): # fact = [enemy_requested_name, stance, opponent_requested_name]
	# since facts are always true, look for and override previous false info
	for info in info_list.keys():
		if info[0] == fact[0] and info[2] == fact[2] and info[1] != fact[1] and info_list[info] == roun:
			info_list.erase(info)
	
	receive_information(roun, fact)


func receive_information(roun, info):
	# add to info list
	info_list[info] = roun


func receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
	# Download entire matchtable as info
	for i in range(en_stances.size()):
		receive_fact(i, [enemy_requested_name, en_stances[i], opponent_requested_name])
		receive_fact(i, [opponent_requested_name, op_stances[i], enemy_requested_name])


func receive_relation_info(relation, enemy_requested_name, opponent_requested_name):
	receive_relation(relation, enemy_requested_name, opponent_requested_name)


func receive_relation(relation, enemy_name, opponent_name):
	for this_relation in relation_list:
		if this_relation[0] == enemy_name and this_relation[1] != relation and this_relation[2] == opponent_name:
			relation_list.erase(this_relation)
	relation_list.append([enemy_name, relation, opponent_name])


func send_message(name1, message, name2, recipient):
	return send_letter(character_name, name1, message, name2, recipient)


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
		print_attack(_character)
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
	if relations[_character] > -2:
		relations[_character] -= 1

func worsen_relations(_character):
	if relations[_character] < 2:
		relations[_character] += 1

func set_relations(_character, _new):
	relations[_character] = _new

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
			return i+1
	
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

func get_traits_list():
	return traits_list

# --------------- DEBUG -------------

func print_turn():
	if Global.get_debug_enabled():
		print(character_name.to_upper() + ' TURN')

func print_mail(sender, message):
	if Global.get_debug_enabled():
		print(character_name + " mail. Sender: "+ sender + ", Message: " + 
			message[0] + ' ' + get_dip_phrase(message[1]) + ' ' + message[2])

func print_attack(_target):
	if Global.get_debug_enabled():
		print(character_name + ' attacking ' + _target)

func print_invest(_target):
	if Global.get_debug_enabled():
		print(character_name + ' investigating ' + _target)
