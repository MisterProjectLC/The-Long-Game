extends "res://Mini Scenes/Intelligences/Competitor.gd"

var priority_lister = 1

# {[info]:[round, sender]}
# lists all pieces of info (messages) competitor wants to investigate
var tactical_list = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	character_name = 'Daint'
	memory_time = 2

	relations = {'Grolk':0,'Daint':-2, 'Salem':0}

# -------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print('DAINT TURN')

	emit_signal("advance_turn", character_name)

# process report info
func receive_report_info(reports): #report = {'player':[stance1, stance2, points]}
	for player_name in reports.keys():
		var report = reports[player_name]
		
		# Justice
		trait_justice(report, player_name)
		
		receive_fact(get_current_round(), [player_name, report[1], character_name])
		
	forget_info()

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
	
	var info
	
	# Tactical
	if relations[sender] == 0: # will investigate info of suspicious player
		tactical_list[message] = [roun, sender]
		return
	elif relations[sender] >= 1: # believes in the opposite of what enemies say about others
		if message[0] != sender and message[2] != sender:
			info = [message[0], stance_inverse(message[1]), message[2]]
		else:
			return
	else:
		info = message
	
	# Info processing
	trait_alliance(info, relations)
	trait_brotherhood(info, relations)
	trait_allegiances(info, relations)
	trait_reactive(info, relations)
	
	if info[1] == 0: # positive interaction
		# from an enemy
		if relations[info[0]] > 0:
			# Reactive
			if info[2] == character_name:
				set_relations(info[0], 0)

		# from a friend
		elif relations[info[0]] < 0 and relations[info[2]] >= 0:
			set_relations(info[2], -1)
			
	elif info[1] == 1: # someone attacking friend or himself -> snitch
		# Snitching
		if relations[info[2]] <= -1:
			snitch_list.append(info)

	receive_information(roun, info)

# process fact
func receive_fact(roun, fact):
	# General
	trait_general(memory_list, roun, fact)
	
	.receive_fact(roun, fact)

# process information
func receive_information(roun, info):
	.receive_information(roun, info)

# process relation
func receive_relation(relation, enemy_name, opponent_name):
	.receive_relation(relation, enemy_name, opponent_name)
	
	# Reactive
	trait_reactive_relations(enemy_name, relation, opponent_name)
	
	if relation > 0: # negative relation
		# Brotherhood
		if relations[enemy_name] != 2 and relations[opponent_name] < 0: # with a friend?
			set_relations(enemy_name, 1)
			# Snitching
			snitch_list.append([enemy_name, 1, opponent_name])
	
	elif relation < 0: # positive relation
		# Allegiance
		if relations[enemy_name] != 2 and relations[opponent_name] == 2: # with a nemesis?
			 set_relations(enemy_name, 1)
		
	trait_alliance_relation(relation, enemy_name, opponent_name)

# ----------------- HELPER REACTIONS -----------------
#
#func alliance_making(friend, candidate):
#	if relations[candidate] != 2: # Welcome to my court.
#		if friend != '':
#			ann_dict[[candidate, 0]].append(friend)
#			if ann_dict[[candidate, 1]].has(friend):
#				ann_dict[[candidate, 1]].erase(friend)
#		set_relations(candidate, -1)
#	elif relations[friend] != 2: # YOU ARE IN CAHOOTS WITH THE ENEMY?!
#		set_relations(friend, 1)

# ----------------- ACTIONS -----------------

func execute_action():
	match (priority_lister):
		1: # attack furious
			attack(2)
			
		2: # tell friends about furious
			say_to_list([2], 1, [-2, -1], 'tell')
		
		3: # attack hostile
			attack(1)
			
		4: # Snitching - snitch stuff to friends
			if !snitch_list.empty():
				snitch(snitch_list, [-2, -1])
		
		5: # tell friends about hostile
			say_to_list([1], 1, [-2, -1], 'tell')
		
		6: # investigate suspicious info
			for tactical in tactical_list:
				_investigate(tactical[0])
				tactical_list.erase(tactical)
			
		7: # tell friends about other friends
			say_to_list([-1, -2], 0, [-2, -1], 'tell')
			
		8: # investigate suspicious player
			for enemy in players:
				if relations[enemy[0]] == 0:
					_investigate(enemy[0])
		
		9: # change turn order
			if get_influence() > 1:
				gain_influence()
		
		10: # investigate trusting player
			for enemy in players:
				if relations[enemy[0]] == -1:
					_investigate(enemy[0])

		11: # do nothing
			spend_action()
			return
	priority_lister += 1
	
# ----------------- HELPER ACTIONS --------------------

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
