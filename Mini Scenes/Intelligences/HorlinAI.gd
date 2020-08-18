extends "res://Mini Scenes/Intelligences/Competitor.gd"

var priority_lister = 1

# [[requester, message, last_turn_tried]]
# lists all requests Horlin has
var request_list = []
var current_request = []
var request_done = false

# Called when the node enters the scene tree for the first time.
func _ready():
	character_name = 'Horlin'
	memory_time = 2
	traits_list = ["Vassal", "Reactive","Justice", "Deduction", "Writer", "Archivist",]

	relations = {'Grolk':0,'Zardri':0, 'Kallysta':0, 'Horlin':-2, 'Obrulena':-2, 
	'Thoren':-1, 'Salem':0, 'Edraele':-1}

# -------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	
	priority_lister = 1
	while get_actions() > 0:
		execute_action()
	
	snitch_list.clear()
	emit_signal("advance_turn", character_name)


# process turn order info
func receive_turn_order_info(turn_message):
	# Vassal
	trait_vassal(turn_message)
	
	.receive_turn_order_info(turn_message)


# process report info
func receive_report_info(reports): #report = {'player':[stance1, stance2, points]}
	for player_name in reports.keys():
		var report = reports[player_name]
		
		# Justice
		trait_justice(report, player_name)
		receive_fact(get_current_round(), [player_name, report[1], character_name])
		
	forget_info()


# process voting info
func receive_proposal(leader, action, object, vote = null):
	
	if object == character_name and action == 1:
		vote = -1
	elif ((get_relation(leader) == -2) or 
	(object == character_name and action == 0)):
		vote = 1
	
	if vote != null:
		trait_ignorant_diplomatic(leader, vote)
	else:
		vote = -1
	
	.receive_proposal(leader,action, object, vote)

func receive_vote(voter, vote):
	trait_ignorant_diplomatic(voter, vote)


# process investigation -------------
func receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
	.receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name)


func receive_relation_info(relation, enemy_requested_name, opponent_requested_name):
	.receive_relation_info(relation, enemy_requested_name, opponent_requested_name)

# --------------------------------------

# process message
func receive_message(sender, roun, message):
	.receive_message(sender, roun, message)
	
	if sender != message[0]:
		# Writer & Archivist
		if get_relation(sender) <= 0 and message[0] != character_name and message[2] != character_name:
			request_list.append([sender, message, -1])
			order_requests()
			update_current()
	
	else:
		var info = message
		trait_reactive(info, relations)
		receive_information(roun, info)


# process fact
func receive_fact(roun, fact):
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
	
	# Reactive
	trait_reactive_relations(enemy_name, relation, opponent_name)
	
	# Archivist
	update_current()


# ------------- MISC FUNCTIONS ------------

func order_requests():
	# Archivist - ordering
	for i in range(len(request_list)):
		for j in range(len(request_list)-i):
			if get_relation(request_list[i][0]) < get_relation(request_list[j][0]) and request_list[j][2] != _current_round:
				var helper = request_list[i].duplicate()
				request_list[i] = request_list[j].duplicate()
				request_list[j] = helper


func update_current():
	if request_list.size() > 0 and (current_request.size() == 0 or 
	(current_request.size() > 0 and get_relation(current_request[0]) > 0)) and request_list[0][2] !=_current_round:
		current_request = request_list.pop_front()


# ----------------- ACTIONS -----------------

func execute_action():
	match (priority_lister):
		1: # Writer
			# If there's a request currently...
			if current_request.size() != 0:
				var requested_letter = current_request[1]
				var letter_to_change = -1
				var best_match = 0
				
				# Search through letter list to find a suitable letter to modify
				for i in range(len(letter_list)):
					var letter = letter_list[i]
					if letter[0] == requested_letter[0]:
						var this_match =  (int(letter[1] == requested_letter[0]) + int(letter[2] == requested_letter[1]) + 
											int(letter[3] == requested_letter[2]))
						if best_match < this_match:
							best_match = this_match
							letter_to_change = i
				
				# If found a suitable letter, forge it
				if letter_to_change != -1:
					forge_letter([requested_letter[0], requested_letter[0], requested_letter[1], requested_letter[2]], 
								letter_to_change, 3-best_match)
					request_done = true
				
				# If there's no letter, move request to the end
				elif current_request[2] != _current_round:
					current_request[2] = _current_round
					request_list.append(current_request)
					current_request = []
					update_current()
					priority_lister -= 1

		2: # send finished letter (Archivist)
			if request_done:
				var letter = current_request[1]
				send_letter(letter[0], letter[0], letter[1], letter[2], current_request[0])
				improve_relations(current_request[0])
				current_request.clear()
				update_current()
				request_done = false

		3: # investigate suspicious/hostile player
			for enemy in players:
				if relations[enemy[0]] == 0 or relations[enemy[0]] == 1:
					_investigate(enemy[0])

		4: # attack furious
			attack(2)

		5: # investigate trustful player
			for enemy in players:
				if relations[enemy[0]] == -1:
					_investigate(enemy[0])

		6: # increase influence
			if get_influence() > 2:
				gain_influence()

		7: # attack hostile
			attack(1)

		8: # do nothing
			spend_action()
			return
	priority_lister += 1
