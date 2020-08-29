extends "res://Mini Scenes/Intelligences/Competitor.gd"

var target = ''
var target_inform = ''
var just_invest = ''

# {[info]:[round, sender]}
# lists all pieces of info (messages) competitor wants to investigate
var tactical_list = {}

# lists friends
var popularity_list = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	character_name = 'Kallysta'
	memory_time = 6
	base_influence = 2
	traits_list = ["Paranoid", "Justice", "Deduction", "Chain-Breaker", "Cynic", "Intrigue", "Diplomatic"]
	
	relations = {'Grolk':0, 'Zardri':0,'Kallysta':-2, 'Horlin':0, 'Obrulena':0,
	'Thoren':0,'Salem':0,'Edraele':0, 'Drakoth':0}
	
	for player_name in relations.keys():
		popularity_list[player_name] = []

#-------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	
	target = ''
	target_inform = ''
	.start_turn()


# process report info
func receive_report_info(reports): #report = {'player':[stance1, stance2, points]}
	for player_name in reports.keys():
		var report = reports[player_name]
		
		# Justice
		trait_justice(report, player_name)
		receive_fact(get_current_round(), [player_name, report[1], character_name])
		
	forget_info()


# process voting info
func receive_proposal(leader, action, object, vote = 0):
	if object == character_name and action == 1:
		vote = -1
	elif ((get_relation(object) > 0 and action == 1) or 
	(object == character_name and action == 0)):
		vote = 1
	elif get_relation(leader) > 0:
		vote = -1
	
	.receive_proposal(leader, action, object, vote)
	trait_ignorant_diplomatic(leader)

# Diplomatic
func receive_vote(voter, vote):
	trait_ignorant_diplomatic(voter, vote)


func choose_proposal():
	for player in turn_order:
		if get_relation(player) == 2:
			return [1, player]
	
	return [0, character_name]


func receive_influence_changes(_influence_list, _influence_changes):
	trait_attentive(_influence_changes)


# process investigation -------------
func receive_points_info(info):
	# Jealousy
	if info > get_points():
		relations[just_invest] = 2
	elif relations[just_invest] == 2:
		relations[just_invest] = 1

func receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
		.receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name)

func receive_relation_info(relation, enemy_requested_name, opponent_requested_name):
	.receive_relation_info(relation, enemy_requested_name, opponent_requested_name)

# --------------------------------------

# process message
func receive_message(sender, roun, message):
	.receive_message(sender, roun, message)
	
	# add info to a list in ann_dict and to memory_list
	ann_dict[[message[0], message[1]]].append(sender)
	
	if sender != character_name:
		memory_list[message] = [roun, sender]
	
	# Intrigue - wait, is this message true? --------
	if (!trait_intrigue_check(sender, roun, message, self)):
		return
		
	# -----------------
	# Info processing

	# Intrigue - Well, thanks for the info
	if message[0] != sender and message[2] != sender:
		emit_signal('improve_relations', sender)

	if message[1] == 1: # negative interaction
		trait_paranoid(message)
	
		# Snitching 
		snitch_list.append(message)
		# (if someone attacks you, logically you would fight back)
		snitch_list.append([message[2], message[1], message[0]])
		
	receive_information(roun, message)


# process fact
func receive_fact(roun, fact):
	# Intrigue - Well, thanks for the info
	for tactical in tactical_list.keys():
		#[info]:[round, sender]
		if tactical == fact and roun == tactical_list[tactical][0]:
			emit_signal('improve_relations', tactical_list[tactical][1])
			tactical_list.erase(tactical)
	
	# Intrigue - wait, this memory is false
	for memory in memory_list.keys(): 
		if fact[0] == memory[0] and fact[1] != memory[1] and fact[2] == memory[2] and roun == memory_list[memory][0] and relations[memory_list[memory][1]] < 2:
			emit_signal('set_relations', memory_list[memory][1], 2)
			memory_list.erase(memory)
	
	.receive_fact(roun, fact)


# process information
func receive_information(roun, info):
	.receive_information(roun, info)


# process relation
func receive_relation(relation, enemy_name, opponent_name):
	.receive_relation(relation, enemy_name, opponent_name)
	
	# Deduction
	if opponent_name == get_player_character():
		receive_relation(relation, opponent_name, enemy_name)
		
	# Paranoid pt. 2
	trait_paranoid_relation(relation, enemy_name, opponent_name)
		
	# Chainbreaker
	if relation < 0 and !popularity_list[opponent_name].has(enemy_name) and enemy_name != character_name:
		popularity_list[opponent_name].append(enemy_name)
		if popularity_list[opponent_name].size() >= 2 and opponent_name != character_name:
			relations[opponent_name] = 1
	
	elif relation >= 0 and popularity_list[opponent_name].has(enemy_name):
		popularity_list[opponent_name].erase(enemy_name)


# ----------------- ACTIONS -----------------


func execute_action():
	match (priority_lister):
		1: # attack rageful
			attack(2)

		2: # investigate suspicious
			if get_current_round() % 2 == 1 and get_current_round() != 1:
				for enemy_name in turn_order:
					if relations[enemy_name] == 0:
						_investigate(enemy_name)
		
		3: # make hostile look bad
			for player_x in turn_order:
				if get_relation(player_x) == 1:
					for player_y in turn_order:
						if relation_list.has([player_y, 0, player_x]):
							for letter in letter_list:
								print("letter: " + letter[0])
								for info in info_list.keys(): #info_list[info] >= get_current_round()-1 and 
									if letter[0] == player_x and letter[1] == info[0] and letter[2] != info[1] and letter[3] == info[2]:
										send_letter(letter[0], letter[1], letter[2], letter[3], player_y)
										print("Kallysta making hostile look bad")
		
		4: # break alliance
			# first, choose a hostile X player. Then, choose Y and Z, friends of X.
			for player_x in turn_order:
				if relations[player_x] == 1:
					for player_y in popularity_list[player_x]:
						for player_z in popularity_list[player_x]:
							if player_y != player_z:
								for relation in relation_list:
									if relation[0] == player_y and relation[2] == player_z:
										# If Y is furious with Z, tell Y that X allies w/ Z.
										if ( (relation[1] == 2 and denounce(player_x, 0, player_z, player_y)) or  
										# If Y is friends with both kallysta and Z, tell Y that X attacks Z.
										(relation[1] < 0 and relations[player_y] < 0 and denounce(player_x, 1, player_z, player_y)) ):
											priority_lister += 1
											return

		5: # attack hostile
			attack(1)
		
		6: # reduce leader influence
			if get_relation(turn_order[0]) > 0:
				change_influence(-1, turn_order[0])
		
		7: # make allies
			for player in turn_order:
				if relations[player] == 0:
					warn(character_name, 0, player)

		8: # investigate hostile
			for enemy_name in turn_order:
				if relations[enemy_name] == 1:
					_investigate(enemy_name)

		9: # investigate trustable
			for enemy_name in turn_order:
				if relations[enemy_name] == -1:
					_investigate(enemy_name)

		10: # do nothing
			spend_action()
			return
	priority_lister += 1


# ----------------- HELPER ACTIONS --------------------

func _investigate(_target):
	if get_actions() <= 0 || _target == character_name:
		return false
		
	spend_action()
	set_info_til_round(_target, get_current_round())
	print_invest(_target)
	# look for their relation/historic with all others
	
	just_invest = _target
	emit_signal('point_info_request', self, _target)
	
	for opponent in turn_order:
		if opponent != _target:
			if _target != get_player_character():
				emit_signal('relation_info_request', self, _target, opponent)
			emit_signal('matchtable_info_request', self, _target, opponent)
	return true


func _set_target(_new):
	if _new == null:
		target = ''
	else:
		target = _new


func _set_target_inform(_new):
	if _new == null:
		target_inform = ''
	else:
		target_inform = _new



