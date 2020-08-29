extends "res://Mini Scenes/Intelligences/Competitor.gd"

# Called when the node enters the scene tree for the first time.
#'Edraele':1,'Thoren':1,'Salem':1
func _ready():
	character_name = 'Grolk'
	memory_time = 1
	base_influence = 1
	traits_list = ["Warlord", "Hatred", "Brotherhood", "Alliance", "General", "Simple-Minded", "Bitter", "Ignorant"]
	
	relations = {'Grolk':-2, 'Zardri':-1, 'Kallysta':0, 'Horlin':0, 'Obrulena':0,
	'Thoren':1, 'Salem':1, 'Edraele':0, 'Drakoth':1, 'Daint': 0}

# -------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	.start_turn()


# process report info
func receive_report_info(reports): #report = {'player':[stance1, stance2, points]}
	for player_name in reports.keys():
		var report = reports[player_name]
		
		info_list[[player_name, report[1], character_name]] = get_current_round()
		
		trait_hatred(report, player_name)
		
		if relations[player_name] == 0 and report[0] == 1 and report[1] == 0: # Warlord: slaughter -> hostile
			set_relations(player_name, 1)
		
		# General # sender/message_list
		trait_general(memory_list, get_current_round(), [player_name, report[1], character_name])
	forget_info()


# receive message
func receive_message(sender, roun, message):
	.receive_message(sender, roun, message)
	
	# add info to a list in ann_dict and to memory_list
	ann_dict[[message[0], message[1]]].append(sender)
	memory_list[message] = [roun, sender]
	
	# Simple-Minded
	if !trait_simpleminded_check(sender):
		return
	
	trait_alliance(message, relations)
	trait_brotherhood(message, relations)
	
	if message[1] == 1:
		snitch_list.append(message)
		
	.receive_information(roun, message)


func receive_proposal(leader, action, object, vote = 0):

	if get_relation(object) > 0 and action == 1:
		vote = 1
	if (((object == character_name or get_relation(object) == -2) and action == 1) or 
			(get_relation(object) == 2 and action == 0)):
		vote = -1
	elif get_relation(leader) == -2:
		vote = 1
	elif ((get_relation(object) == -1 and action == 1) or 
			(get_relation(object) == 1 and action == 0)):
		vote = -1
	elif get_relation(leader) == -1:
		vote = 1
	elif get_relation(leader) > 0:
		vote = -1
	
	.receive_proposal(leader,action, object, vote)
	trait_ignorant_diplomatic(leader)


func choose_proposal():
	for player in turn_order:
		if get_relation(player) == 2:
			return [1, player]
	
	for player in turn_order:
		if get_relation(player) == 1:
			return [1, player]
	
	for player in turn_order:
		if get_relation(player) == 0:
			return [1, player]
	
	return [0, character_name]

# ----------------- HELPER REACTIONS -----------------

# Bitter
func set_relations(player_name, _new):
	if relations[player_name] != 2:
		relations[player_name] = _new

func improve_relations(player_name):
	if relations[player_name] != 2 and relations[player_name] != -2:
		relations[player_name] -= 1

# ----------------- ACTIONS -----------------

func execute_action():
	match (priority_lister):
		1: # attack furious
			attack(2)
		2: # attack hostile
			attack(1)
			
		3: # tell friends about furious or other trustfuls
			say_to_list([1, 2], 1, [-2, -1], 'threat')
			say_to_list([-1, -2], 0, [-2, -1], 'threat')
			
		4: # pass info to warm friend
			if !snitch_list.empty():
				snitch(snitch_list, [-2])
			
		5: # attack suspicious
			attack(0)
		
		6: # increase his influence
			if get_influence() > 1:
				change_influence(1)
		
		7: # do nothing
			spend_action()
			return
	priority_lister += 1

func _send_message(name1, message, name2, recipient):
	send_message(name1, message, name2, recipient)
	
