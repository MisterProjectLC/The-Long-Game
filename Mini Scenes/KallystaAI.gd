extends "res://Scripts/Competitor.gd"

var priority_lister = 1

var target = ''
var target_inform = ''
var just_invest = ''

# {[info]:[round, sender]}
# lists all pieces of info (messages) competitor wants to investigate
var tactical_list = {}

# lists friends
var popularity_list = {'Grolk':[],'Kallysta':[],'Thoren':[],'Salem':[],'Edraele':[]}

# lists relations between players she obtained in investigations
var relation_list = []

# lists people she already told will ally with
var ally_list = []

# Called when the node enters the scene tree for the first time.
func _ready():
	character_name = 'Kallysta'
	memory_time = 6
	
	relations = {'Grolk':0,'Kallysta':-2,'Thoren':0,'Salem':0,'Edraele':0}

#-------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	
	priority_lister = 1
	target = ''
	target_inform = ''
	while get_actions() > 0:
		execute_action()
	
	snitch_list.clear()
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
func receive_points_info(info):
	# Jealousy
	if info > get_points():
		relations[just_invest] = 2
	elif relations[just_invest] == 2:
		relations[just_invest] = 1

func receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name):
	# Download entire matchtable as info
	for i in range(en_stances.size()):
		receive_fact(i, [enemy_requested_name, en_stances[i], opponent_requested_name])
		receive_fact(i, [opponent_requested_name, op_stances[i], enemy_requested_name])

func receive_relation_info(relation, enemy_requested_name, opponent_requested_name):
	receive_relation(relation, enemy_requested_name, opponent_requested_name)
# --------------------------------------

# process message
func receive_message(sender, roun, message):
	print_mail(sender, message)
	
	# add info to a list in ann_dict and to memory_list
	ann_dict[[message[0], message[1]]].append(sender)
	
	if sender != character_name:
		memory_list[message] = [roun, sender]
	
	# Intrigue - wait, is this message true? --------
	# check with facts
	for info in info_list:
		if info[0] == message[0] and info[1] != message[1] and info[2] == message[2] and info_list[info] == roun:
			emit_signal('set_relations', sender, 2)
			return

	# check with testimony
	for memory in memory_list:
		# contradiction?
		if (memory[0] == message[0] and memory[2] == message[0] and memory[1] != message[1] and 
			memory_list[memory][0] == roun):
				# testimony contest
				if relations[memory_list[memory][1]] > relations[sender]:
					emit_signal('set_relations', sender, 2)
					return
				elif relations[memory_list[memory][1]] < relations[sender]:
					emit_signal('set_relations', memory_list[memory][1], 2)
					break
	
	# check with myself
	if relations[sender] == 0:
		tactical_list[message] = [roun, sender]
		return
	# -----------------
	# Info processing

	# Intrigue - Well, thanks for the info
	if message[0] != sender and message[2] != sender:
		emit_signal('improve_relations', sender)

	if message[1] == 1: # negative interaction
		# Paranoid
		set_relations(message[2], 2)
	
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
	
	# since facts are always true, look for and override previous false info
	for info in info_list.keys():
		if info[0] == fact[0] and info[1] != fact[1] and info[2] == fact[2] and info_list[info] == roun:
			info_list.erase(info)
	
	receive_information(roun, fact)

# process information
func receive_information(roun, info):
	# add to info list
	info_list[info] = roun

# process relation
func receive_relation(relation, enemy_name, opponent_name):
	# Deduction
	if opponent_name == get_player_character():
		receive_relation(relation, opponent_name, enemy_name)
		
	# Paranoid pt. 2
	if relation > 0 and opponent_name == character_name:
		relations[enemy_name] = 2
		
	# Chainbreaker
	if relation < 0 and !popularity_list[opponent_name].has(enemy_name) and enemy_name != character_name:
		popularity_list[opponent_name].append(enemy_name)
		if popularity_list[opponent_name].size() >= 2 and opponent_name != character_name:
			relations[opponent_name] = 1
			
	elif relation >= 0 and popularity_list[opponent_name].has(enemy_name):
		popularity_list[opponent_name].erase(enemy_name)

	for this_relation in relation_list:
		if this_relation[0] == enemy_name and this_relation[1] != relation and this_relation[2] == opponent_name:
			relation_list.erase(this_relation)
	relation_list.append([enemy_name, relation, opponent_name])

# ----------------- HELPER REACTIONS -----------------


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
		
		3: # break alliance type 0
			_letter()
		
		4: # break alliance type 1
			_break('_denounce')
			
		5: # break alliance type 2
			_break('_lie')
		
		6: # increase turn order
			if get_influence() > 3:
				gain_influence()
		
		7: # attack hostile
			attack(1)
		
		8: # make allies
			for player in turn_order:
				if relations[player] == 0 and !ally_list.has(player):
					ally_list.append(player)
					_ally(player)
		
		9: # investigate suspect
			for enemy_name in turn_order:
				if relations[enemy_name] == 0:
					_investigate(enemy_name)
					
		10: # investigate hostile
			for enemy_name in turn_order:
				if relations[enemy_name] == 1:
					_investigate(enemy_name)
					
		11: # investigate trustable
			for enemy_name in turn_order:
				if relations[enemy_name] == -1:
					_investigate(enemy_name)

		12: # do nothing
			spend_action()
			return
	priority_lister += 1


# ----------------- HELPER ACTIONS --------------------

# first, choose a hostile X player. Then, choose Y and Z, friends of X.
func _break(last_check):
	for player_x in turn_order:
		if relations[player_x] == 1:
			for player_y in popularity_list[player_x]:
				for player_z in popularity_list[player_x]:
					if player_y != player_z:
						for relation in relation_list:
							if relation[0] == player_y and relation[2] == player_z:
								call(last_check, relation, player_x, player_y, player_z)

# first, choose a hostile X player. Then, choose Y, friend of X. Send a false letter from X to Y.
func _letter():
	for player_x in turn_order:
		if relations[player_x] == 1:
			for player_y in popularity_list[player_x]:
				for letter in letter_list:
					print("letter: " + letter[0])
					for info in info_list.keys(): #info_list[info] >= get_current_round()-1 and 
						if letter[0] == player_x and letter[1] == info[0] and letter[2] != info[1] and letter[3] == info[2]:
							send_letter(letter[0], letter[1], letter[2], letter[3], player_y)
							print("woop")

# If Y is furious with Z, tell Y that X allies w/ Z.
func _denounce(relation, player_x, player_y, player_z):
	if relation[1] == 2:
		send(0, player_y, player_x, player_z)
# If Y is friends with both kallysta and Z, tell Y that X attacks Z.
func _lie(relation, player_x, player_y, player_z):
	if relation[1] < 0 and relations[player_y] < 0:
		send(1, player_y, player_x, player_z)
		
# tell them that she'll ally with them
func _ally(player):
	send(0, player, character_name, player)

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



