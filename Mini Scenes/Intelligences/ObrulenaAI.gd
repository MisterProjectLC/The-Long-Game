extends "res://Mini Scenes/Intelligences/Competitor.gd"

# {player: [[round, victim]]}
# lists all attacks someone made
var violence_list = {}

var sent_letter = null

# Called when the node enters the scene tree for the first time.
func _ready():
	character_name = 'Obrulena'
	memory_time = 2
	traits_list = ["Serene", "Pacifist", "Alliance", "Intuition", "Simple-Minded", "Vassal"]

	relations = {'Grolk':0,'Zardri':0, 'Kallysta':-1, 'Horlin':-1, 'Obrulena':-2, 
	'Thoren':-1, 'Salem':0, 'Edraele':0}

# -------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	sent_letter = null
	
	.start_turn()


# process turn order info
func receive_turn_order_info(turn_message):
	# Vassal
	trait_vassal(turn_message)
	
	.receive_turn_order_info(turn_message)

# process report info
func receive_report_info(reports): #report = {'player':[stance1, stance2, points]}
	for player_name in reports.keys():
		var report = reports[player_name]

		trait_pacifist(get_current_round(), player_name, report[1], character_name, report[0])
		receive_fact(get_current_round(), [player_name, report[1], character_name])

	forget_info()


# process voting info
func receive_proposal(leader, action, object, vote = 0):
	if action == 1:
		if get_relation(leader) == -2 and get_relation(object) > 0 and object != character_name:
			vote = 1
		else:
			vote = -1
	else:
		if get_relation(leader) > 0 and get_relation(object) > 0:
			vote = -1
		else:
			vote = 1
	
	.receive_proposal(leader,action, object, vote)
	trait_ignorant_diplomatic(leader)

# Diplomatic
func receive_vote(voter, vote):
	trait_ignorant_diplomatic(voter, vote)

func choose_proposal():
	for player in turn_order:
		if get_relation(player) < 0 and player != character_name:
			return [0, player]
	
	return [0, character_name]


# process investigation -------------
func receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
	# Intuition
	trait_intuition(en_stances, op_stances, enemy_requested_name, opponent_requested_name)

	for i in range(en_stances.size()):
		trait_pacifist(i, enemy_requested_name, en_stances[i], opponent_requested_name, op_stances[i])
		
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
	
	# Simple-Minded
	if !trait_simpleminded_check(sender):
		return
	
	# Info processing
	# Alliance
	trait_alliance(message, relations)

	receive_information(roun, message)

# process fact
func receive_fact(roun, fact): # fact = [enemy_requested_name, stance, opponent_requested_name]
	.receive_fact(roun, fact)


func trait_pacifist(roun, player1, stance1, player2, stance2):
	# Pacifist
	var agressor
	var victim
	if stance1 == 0 and stance2 == 1: # attack <
		agressor = player2
		victim = player1
	elif stance1  == 1 and stance2 == 0: # attack >
		agressor = player1
		victim = player2
	else:
		return
	
	if !violence_list.has(agressor) or !violence_list[agressor].has([roun, victim]):
		print("pacifism " + agressor + " " + str(roun))
		worsen_relations(agressor)
		worsen_relations(agressor)
		violence_list[agressor] = [roun, victim]
	

# process information
func receive_information(roun, info):
	.receive_information(roun, info)

# process relation
func receive_relation(relation, enemy_name, opponent_name):
	.receive_relation(relation, enemy_name, opponent_name)
	
	trait_alliance_relation(relation, enemy_name, opponent_name)

# ----------------- ACTIONS -----------------

func execute_action():
	match (priority_lister):
#		1: # send letter that says X will ally with Y's friend
#			if sent_letter == null:
#				for letter in letter_list:
#					for relation in relation_list:
#						if letter[3] == relation[2] and relation[1] > 0 and letter[1] != relation[0]:
#							send_letter(letter[0], letter[1], letter[2], letter[3], relation[0])
#							sent_letter = [letter[0], letter[1], letter[2], letter[3], relation[0]]
#							break
		
		1: # tell friends about other friends
			if sent_letter == null:
				for player in turn_order:
					if relations[player] < 0:
						for player2 in turn_order:
							if (relations[player2] < 0 and player != player2 and (relation_list.has([player, 0, player2]) 
								or relation_list.has([player, 1, player2]) or relation_list.has([player,2, player2])) and
								( (opponent_trait_list[player2].has("Alliance") and !opponent_trait_list[player2].has("Allegiances") 
								and tell(player, 0, player2)) or warn(player, 0, player2) )):
									sent_letter = [character_name, player, 0, player2, player2] # sender, message, recipient
									emit_signal('improve_relations', player2) # Serene
									priority_lister += 1
									return

		2: # make sure the alliance goes through
			if sent_letter != null:
				if (opponent_trait_list[sent_letter[1]].has("Alliance") and 
					!opponent_trait_list[sent_letter[1]].has("Allegiances")):
					tell(sent_letter[4], 0, sent_letter[1])
					emit_signal('improve_relations', sent_letter[1]) # Serene
					print("Match made!!!!")
					sent_letter = null
				else:
					warn(sent_letter[4], 0, sent_letter[1])
					emit_signal('improve_relations', sent_letter[1]) # Serene
					print("Match made!!!!")
					sent_letter = null

		3: # make friends with suspected/trusted
			for player in turn_order:
				if (relations[player] == 0 or relations[player] == -1) and !opponent_trait_list[player].has("Intrigue"):
					if warn(character_name, 0, player):
						emit_signal('improve_relations', player) # Serene
						return

		4: # attack furious
			attack(2)

		5: # attack hostile
			attack(1)

		6: # warn hostilized
			for player in turn_order:
				if relations[player] == 1:
					if warn(character_name, 1, player):
						emit_signal('improve_relations', player) # Serene

		7: # increase influence
			if get_influence() > 1:
				gain_influence()
		
		8: # investigate suspicious player
			for enemy in players:
				if relations[enemy[0]] == 0:
					_investigate(enemy[0])
		
		9: # investigate non-suspicious player
			for enemy in players:
				if relations[enemy[0]] != 0:
					_investigate(enemy[0])

		10: # do nothing
			spend_action()
			return
	priority_lister += 1
