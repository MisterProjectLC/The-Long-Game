extends "res://Scripts/Competitor.gd"

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
	var _relation
	# Intuition
	if enemy_requested_name == get_player_character():
		_relation = trait_intuition(en_stances, op_stances)
		receive_relation_info(_relation, enemy_requested_name, opponent_requested_name)
		
	# Download entire matchtable as info
	for i in range(en_stances.size()):
		receive_fact(i, [enemy_requested_name, en_stances[i], opponent_requested_name])
		receive_fact(i, [opponent_requested_name, op_stances[i], enemy_requested_name])

func receive_relation_info(relation, enemy_requested_name, opponent_requested_name):
	receive_relation(relation, enemy_requested_name, opponent_requested_name)
# --------------------------------------

# process message
func receive_message(sender, roun, message):
	print("Thoren mail. Sender: "+ sender + ", Message: " + 
	message[0] + ' ' + get_dip_phrase(message[1]) + ' ' + message[2])
	
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
		
	trait_brotherhood(info, relations)
		
	if info[1] == 0: # positive interaction
		# Allegiances
		if relations[info[2]] == 2 and relations[info[0]] != 2: 
			set_relations(info[0], 1)
		elif relations[info[0]] == 2 and relations[info[2]] != 2 and info[2] != character_name: 
			set_relations(info[2], 1)
		
		# from an enemy
		elif relations[info[0]] > 0:
			# Reactive
			if info[2] == character_name:
				set_relations(info[0], 0)

		# from a friend
		elif relations[info[0]] < 0 and relations[info[2]] >= 0:
			set_relations(info[2], -1)
			
	elif info[1] == 1 and relations[info[2]] != 2: # someone attacking friend or himself -> get hostile
		# Reactive
		if info[2] == character_name:
			set_relations(info[0], 1)

		# Snitching
		elif relations[info[2]] <= -1:
			snitch_list.append(info)

	receive_information(roun, info)

# process fact
func receive_fact(roun, fact):
	# General
	trait_general(memory_list, roun, fact)
	
	# since facts are always true, look for and override previous false info
	for info in info_list.keys():
		if info[0] == fact[0] and info[2] == fact[2] and info[1] != fact[1] and info_list[info] == roun:
			info_list.erase(info)
	
	receive_information(roun, fact)

# process information
func receive_information(roun, info):
	# add to info list
	info_list[info] = roun

# process relation
func receive_relation(relation, enemy_name, opponent_name):
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
		# Alliance
		elif relations[enemy_name] < 0 and relations[opponent_name] != 2: # from a friend?
			 set_relations(enemy_name, -1)

# ----------------- HELPER REACTIONS -----------------

func alliance_making(friend, candidate):
	if relations[candidate] != 2: # Welcome to my court.
		if friend != '':
			ann_dict[[candidate, 0]].append(friend)
			if ann_dict[[candidate, 1]].has(friend):
				ann_dict[[candidate, 1]].erase(friend)
		set_relations(candidate, -1)
	elif relations[friend] != 2: # YOU ARE IN CAHOOTS WITH THE ENEMY?!
		set_relations(friend, 1)

