extends "res://Scripts/Competitor.gd"

var priority_lister = 1
var agenda = 0

var target = ''
var target_inform = ''
var just_invest = ''

# {[info]:[round, sender]}
# lists all pieces of info (messages) competitor wants to investigate
var tactical_list = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	character_name = 'Edraele'
	memory_time = 4
	
	relations = {'Grolk':1,'Kallysta':0,'Thoren':-1,'Salem':0,'Edraele':-2}

#-------------- REACTIONS AND SETUP --------------------

# start turn
func start_turn():
	print_turn()
	
	# Agenda
	if relations[get_player_character()] < 0:
		agenda = 0
	elif relations[get_player_character()] == 0:
		agenda = 1
	else:
		agenda = 2
	
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
		var just = trait_justice(report, player_name)
		
		# Treachery
		if !just and report[0] == 1 and report[1] == 0:
			emit_signal('set_relations', player_name, 1)
			
		
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
	
	trait_allegiances(message, relations)
	trait_reactive(message, relations)

	if message[1] == 1: # negative interaction
		# Queen - trust people that punch her enemies
		if relations[message[2]] == 2 and relations[message[0]] != -2: 
			set_relations(message[0], -1)
			
		# Snitching
		else:
			snitch_list.append(message)
			# (if someone attacks you, logically you would fight back)
			snitch_list.append([message[2], message[1], message[0]])
		
	receive_information(roun, message)

# process fact
func receive_fact(roun, fact):
	# Intrigue - Well, thanks for the info
	for tactical in tactical_list.keys():
		#[info]:[round, sender]
		if tactical == fact and roun == tactical_list[tactical][0]-1:
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
	# Reactive
	trait_reactive_relations(enemy_name, relation, opponent_name)
	
	# Deduction
	if opponent_name == get_player_character():
		receive_relation(relation, opponent_name, enemy_name)
	
	# Facade
	if relations[enemy_name] != 2 and opponent_name == get_character_name():
		relations[enemy_name] = relation

	if relation > 0 and relations[enemy_name] != -2 and relations[opponent_name] == 2:
		# Snitching
		snitch_list.append([enemy_name, 1, opponent_name])
		snitch_list.append([opponent_name, 1, enemy_name])

# ----------------- HELPER REACTIONS -----------------


# ----------------- ACTIONS -----------------

func execute_action():
	if agenda == 0:
		trust_action()
	elif agenda == 1:
		susp_action()
	else:
		host_action()


func trust_action():
	match (priority_lister):
		1: # murder if turn 5
			if get_current_round() == 6:
				_murder()
		2: # invest hostile
			if get_current_round() == 3:
				for enemy_name in relations.keys():
					if relations[enemy_name] == -1:
						_investigate(enemy_name)
			
		3: # attack enraged
			var attacked_list = attack(2)
			for victim_name in attacked_list:
				snitch_list.append([character_name, 1, victim_name])
		
		4: # attack hostile
			var attacked_list = attack(1)
			for victim_name in attacked_list:
				snitch_list.append([character_name, 1, victim_name])
		
		5: # Snitching - snitch stuff to enemy
			if get_current_round() <= 2:
				if !snitch_list.empty():
					snitch(snitch_list, [1])
		
		6: # investigate suspicious info
			for tactical in tactical_list:
				_investigate(tactical[0])
				tactical_list.erase(tactical)
		
		7: # Snitching - snitch stuff to friend
			if !snitch_list.empty():
				snitch(snitch_list, [-2, -1])
		
		8: # tell friends about enemies
			say_to_list(1, [-2, -1], [2, 1, 0], 'warn')
		
		9: # tell friends about friends
			say_to_list(1, [-2, -1], [-1], 'warn')
		
		10: # change turn order
			if get_influence() > 1:
				gain_influence()
		
		11: # do nothing
			spend_action()
			return
	priority_lister += 1

func susp_action():
	match (priority_lister):
		1: # murder if turn 5
			if get_current_round() == 6:
				_murder()
		
		2: # invest hostile
			if get_current_round() == 3:
				for enemy_name in relations.keys():
					if relations[enemy_name] == 1:
						_investigate(enemy_name)
			
		3: # attack enraged
			var attacked_list = attack(2)
			for victim_name in attacked_list:
				snitch_list.append([character_name, 1, victim_name])
		
		4: # attack hostile
			var attacked_list = attack(1)
			for victim_name in attacked_list:
				snitch_list.append([character_name, 1, victim_name])
		
		5: # Snitching - snitch stuff to hostile
			if !snitch_list.empty():
				snitch(snitch_list, [1])

		6: # investigate suspicious info
			for tactical in tactical_list:
				_investigate(tactical[0])
				tactical_list.erase(tactical)
		
		7: # invest suspicious
			for target in turn_order:
				if relations[target] == 0:
					_investigate(target)

		8: # tell friends about suspect
			say_to_list(1, [-2, -1], [0], 'tell')

		9:  # attack suspect
			attack(0)
			
		10: # change turn order
			if get_influence() > 1:
				gain_influence()
			
		11: # do nothing
			spend_action()
			return
	priority_lister += 1

func host_action():
	match (priority_lister):
		1: # attack enraged
			var targett = attack(2)
			if targett.size() > 0:
				_set_target(targett[0])
		2: # tell friends about enraged
			if target != '':
				_set_target_inform(_targeted_tell(1, -2, target))
				if target_inform == '':
					_set_target_inform(_targeted_tell(1, -1, target))
		3: # tell target about goonies
			if target != '' and target_inform != '':
				tell(0, target_inform, target)
				tell(0, target_inform, target)
		4: # attack hostile
			attack(1)
		5: # tell friends about hostile
			say_to_list(1, [-2, -1], [1], 'tell')
		6: # Snitching - snitch stuff to hostile
			if !snitch_list.empty():
				snitch(snitch_list, [1])
		7: # invest target
			if target != '':
				_investigate(target)
		8: # do nothing
			spend_action()
			return
			
	priority_lister += 1
	
# ----------------- HELPER ACTIONS --------------------

func _murder():
	for target_name in relations.keys():
		change_stance(target_name, get_current_round(), 1)

func _targeted_attack(_target_relation):
	for target in turn_order:
		if relations[target] == _target_relation:
			change_stance(target, get_current_round(), 1)
			return target
			
func _targeted_tell(_order, _informed_relation, _target):
	# look for players that don't know about my relation with this person
	for sally in turn_order:
		if relations[sally] == _informed_relation and sally != character_name:
			tell(_order, sally, _target)
			return target_inform

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



