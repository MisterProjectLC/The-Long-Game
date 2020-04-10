extends "res://Scripts/Competitor.gd"

var priority_lister = 1

# Called when the node enters the scene tree for the first time.
#'Edraele':1,'Thoren':1,'Salem':1
func _ready():
	character_name = 'Grolk'
	memory_time = 1
	
	relations = {'Grolk':-2,'Kallysta':0,'Thoren':2, 'Salem':1, 'Edraele':1, 'Daint': 0}

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
		
		match (relations[player_name]):
			-2: # Warm (Bitter)
				if report[0] == 0 and report[1] == 1: # Hatred: backstab -> furious
					set_rep(player_name, 2)
			-1: # Trusting
				if report[0] == 0 and report[1] == 1: # Hatred: backstab -> furious
					set_rep(player_name, 2)
			0: # Suspicious
				if report[0] == 0 and report[1] == 1: # Hatred: backstab -> hostile
					set_rep(player_name, 1)
				elif report[0] == 1 and report[1] == 0: # Warlord: slaughter -> hostile
					set_rep(player_name, 1)
		
		# General # sender/message_list
		trait_general(memory_list, get_current_round(), [player_name, report[1], character_name])
	forget_info()

# receive message
func receive_message(sender, roun, message):
	print_mail(sender, message)
	
	# add info to a list in ann_dict and to memory_list
	ann_dict[[message[0], message[1]]].append(sender)
	
	memory_list[message] = [roun, sender]
	
	# Simple-Minded
	if relations[sender] >= 0: # ignores suspicious or worse people
		return
	info_list[message] = roun
	
	trait_brotherhood(message, relations)
	
	if message[1] == 1:
		snitch_list.append(message)


# ----------------- HELPER REACTIONS -----------------


# Bitter
func set_rep(player_name, _new):
	if relations[player_name] != 2:
		relations[player_name] = _new

func gain_rep(player_name):
	if relations[player_name] != 2 and relations[player_name] != -2:
		relations[player_name] -= 1
		
func lose_rep(player_name):
	if relations[player_name] != 2:
		relations[player_name] += 1

# ----------------- ACTIONS -----------------

func execute_action():
	match (priority_lister):
		1: # attack furious
			attack(2)
		2: # attack hostile
			attack(1)
			
		3: # tell friends about furious or other trustfuls
			say_to_list(1, [-2, -1], [2], 'threat')
			
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
	
