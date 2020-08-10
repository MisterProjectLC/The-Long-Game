extends "res://Mini Scenes/Intelligences/Competitor.gd"

var priority_lister = 1

# Called when the node enters the scene tree for the first time.
#'Edraele':1,'Thoren':1,'Salem':1
func _ready():
	character_name = 'Grolk'
	memory_time = 1
	traits_list = ["Warlord", "Hatred", "Brotherhood", "Alliance", "General", "Simple-Minded", "Bitter"]
	
	relations = {'Grolk':-2, 'Zardri':-1, 'Kallysta':0, 'Horlin':0, 'Obrulena':0,
	'Thoren':1, 'Salem':1, 'Edraele':1, 'Daint': 0}

# -------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	
	priority_lister = 1
	while get_actions() > 0:
		execute_action()
	
	emit_signal("advance_turn", character_name)


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
		
		6: # do nothing
			spend_action()
			return
	priority_lister += 1

func _send_message(name1, message, name2, recipient):
	send_message(name1, message, name2, recipient)
	
