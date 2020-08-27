extends "res://Mini Scenes/Intelligences/Competitor.gd"

var influence_totals = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	character_name = 'Drakoth'
	memory_time = 2
	base_influence = 4
	traits_list = ["Strategy", "Heir", "Reactive", "Justice","Brotherhood", "Alliance", "Allegiances",
				"Insight", "Simple-Minded", "Diplomatic",]

	relations = {'Grolk':1,'Zardri':1, 'Kallysta':1, 'Horlin':-1, 'Obrulena':-1, 
	'Thoren':-1, 'Salem':0, 'Edraele':0, 'Drakoth':-2}

# -------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	.start_turn()


# process turn order info
func receive_turn_order_info(turn_message):
	.receive_turn_order_info(turn_message)


# process report info
func receive_report_info(reports): #report = {'player':[stance1, stance2, points]}
	for player_name in reports.keys():
		var report = reports[player_name]
		
		# Justice
		trait_justice(report, player_name)
		
		receive_fact(get_current_round(), [player_name, report[1], character_name])
		
	forget_info()


# Insight
func receive_decree(action, object, voters, _vote_count):
	for voter in voters.keys():
		if voter != character_name:
			trait_insight(action, object, voter, voters[voter])

# process voting info
func receive_proposal(leader, action, object, vote = 0):
	vote = -1
	
	.receive_proposal(leader,action, object, vote)
	trait_ignorant_diplomatic(leader)

# Diplomatic
func receive_vote(voter, vote):
	trait_ignorant_diplomatic(voter, vote)

func choose_proposal():
	# if enoguh votes, peace to self
	if get_relation(player_character) < 1:
		var votes = 0
		for i in range(1, len(turn_order)):
			votes += int(get_relation(turn_order[i]) < 0) * (1 + int(i == 1))
		if votes >= 3:
			return [0, character_name]
		
		# if no enemies of suspected among allies, peace to suspected
		var no_naysayer = true
		for suspected in turn_order:
			if get_relation(suspected) != 0:
				continue
			for relation in relation_list:
				if (relation[1] == 2 and relation[2] == suspected and 
						get_relation(relation[0]) < 0 and opponent_trait_list[relation[0]].has("Allegiances")):
					no_naysayer = false
			if no_naysayer:
				return [0, suspected]
		
		# if no friends of enemy among allies, war gegen enemy
		no_naysayer = true
		for enemy in turn_order:
			if get_relation(enemy) <= 0:
				continue
			for relation in relation_list:
				if relation[1] == -2 and relation[2] == enemy and get_relation(relation[0]) < 0:
					no_naysayer = false
			if no_naysayer:
				return [1, enemy]
		
		return [0, character_name]
	
	else:
		# grrr attack!!
		for player in turn_order:
			if get_relation(player) == 2:
				return [1, player]
		
		for player in turn_order:
			if get_relation(player) == 1:
				return [1, player]


func receive_influence_changes(_influence_list, _influence_changes):
	influence_totals = extract_influence_totals(_influence_list)
	
	for delta in _influence_changes:
		print(delta, " ", _influence_changes[delta])
	
	# Heir
	if turn_order[0] != character_name:
		for i in range(len(turn_order)-1, 0, -1):
			var checked_player = turn_order[i]
			
			if (
				# reduce my influence
				(_influence_changes[character_name].keys().has(checked_player) and 
				_influence_changes[character_name][checked_player] < 0) or
				# increase their influence
				(_influence_changes[turn_order[0]].keys().has(checked_player) and 
				_influence_changes[turn_order[0]][checked_player] > 0)
				):
					set_relations(checked_player, 2)
					break
	
	trait_ambitious(_influence_changes)

# process investigation -------------
func receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
	# Intuition
	trait_intuition(en_stances, op_stances, enemy_requested_name, opponent_requested_name)
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
	
	var info = message
	
	# Simple-Minded
	if !trait_simpleminded_check(sender):
		return
	
	# Info processing
	trait_alliance(info, relations)
	trait_brotherhood(info, relations)
	trait_allegiances(info, relations)
	trait_reactive(info, relations)
	
	if info[1] == 1: # someone attacking friend or himself -> snitch
		# Snitching
		if relations[info[2]] <= -1:
			snitch_list.append(info)
	
	receive_information(roun, info)


# process relation
func receive_relation(relation, enemy_name, opponent_name):
	.receive_relation(relation, enemy_name, opponent_name)
	
	# Reactive
	trait_reactive_relations(enemy_name, relation, opponent_name)
	
	trait_brotherhood_relation(relation, enemy_name, opponent_name)
	trait_alliance_relation(relation, enemy_name, opponent_name)
	trait_allegiances_relation(relation, enemy_name, opponent_name)

# ----------------- ACTIONS -----------------

func execute_action():
	match (priority_lister):
		1: # attack furious
			attack(2)

		2: # tell friends about furious
			say_to_list([2], 1, [-2, -1], 'tell', false, 'Brotherhood')

		3: # attack hostile
			attack(1)

		4: # change turn order
			var max_inf = 0
			var max_p = ''
			for total in influence_totals.keys():
				if influence_totals[total] > max_inf or (influence_totals[total] == max_inf and max_p == character_name):
					max_inf = influence_totals[total]
					max_p = total
			
			if max_p != character_name:
				change_influence(1)

		5: # tell friends about hostile
			say_to_list([1], 1, [-2, -1], 'tell', false, 'Brotherhood')

		6: # investigate suspicious player
			for enemy in turn_order:
				if get_relation(enemy) == 0:
					_investigate(enemy)

		7: # improve ally influence
			var max_inf = 0
			var max_p = ''
			for i in range(2, len(turn_order)):
				if get_relation(turn_order[i]) < 0:
					change_influence(1, turn_order[i])
			
			if max_p != character_name:
				change_influence(1)

		8: # investigate enemies
			if get_current_round() % 2 == 0:
				for enemy in turn_order:
					if get_relation(enemy) > 0:
						_investigate(enemy)

		9: # investigate friends
			if get_current_round() % 2 == 1:
				for friend in turn_order:
					if get_relation(friend) < 0:
						_investigate(friend)

		10: # do nothing
			spend_action()
			return
	priority_lister += 1
