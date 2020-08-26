extends Node

var turn = 0
var roun = 1
var round_count = 6

var winner
export(PackedScene) var victory_panel
export var address = ""

var player_character = 'Salem'

var turn_order = []
var influences = {} # {player:[base, {enemy:1, enemy2:-2...}, total]}
var influence_deltas = {} # {player:{enemy:1, enemy2:-2...}}
var players

var voters = {}
var vote_count = [0, 0, 0]
# [action, object]
var decree = []

var dip_phrases

# ----------------- SETUP ---------------

func language(language):
	dip_phrases = Global.phrases[language]
	ai_node(player_character).language(language)

# ------------------ MAIN STUFF, TURN ------------------------

# setup
func game_setup(_new_players, _turn_order):
	# language
	language(Global.get_language())
	Audio.play_music(Audio.game_theme)
	
	# player setup
	turn_order = _turn_order
	players = _new_players
	
	var opponent_trait_list = {}
	for player in players:
		var base_influence = ai_node(player[0]).get_base_influence()
		influences[player[0]] = [base_influence, {}, base_influence]
		influence_deltas[player[0]] = {}
		opponent_trait_list[player[0]] = ai_node(player[0]).get_traits_list()
		
	opponent_trait_list = opponent_trait_list.duplicate(true)
	
	for player in players:
		ai_node(player[0]).setup(player_character, players, turn_order, 
								dip_phrases, opponent_trait_list)
	
	# Charismatic
	randomize()
	var opponent_count = players.size()-1
	var a = randi() % opponent_count
	for i in range(players.size()):
		if i != a:
			continue
	
		if players[i][0] != player_character:
			ai_node(players[i][0]).improve_relations(player_character)
	
	# start game
	start_round()


# at beginning of round
func start_round():
	# reset council
	vote_count = [0, 0, 0]
	decree = ['', 0]
	voters = {}
	
	# prepare to send
	var turn_message = []
	for order in turn_order:
		turn_message.append(order)

	# for each player... reset stances, turn order and current turn
	for player in players:
		# advance their round
		ai_node(player[0]).set_action(3)
		ai_node(player[0]).set_current_round(roun)
		if ai_node(player[0]).has_method('receive_turn_order_info'):
			ai_node(player[0]).receive_turn_order_info(turn_message)
			ai_node(player[0]).receive_influence_changes(influences, influence_deltas)
		
		# reset stances
		for player2 in players:
			if player[0] != player2[0]:
				ai_node(player[0]).set_stance(player2[0], roun, 0)
				if player[0] == 'Salem':
					find_node(player2[0], true, false).new_stance(0)
	
	# start turn
	if ai_node(turn_order[0]).has_method('start_turn'):
		ai_node(turn_order[0]).start_turn()


# advance turn for a player
func _advance_turn(_char):
	if _char == turn_order[turn]:
		turn += 1
		
		# next round
		if turn >= turn_order.size():
			turn = 0
			print('round_advanced')
			advance_round()
		# next player
		else:
			var _next = turn_order[turn]
			if ai_node(_next).has_method('start_turn'):
				ai_node(_next).start_turn()


# advance whole round
func advance_round():
	# advance round
	roun += 1
	
	# new turn order
	sort_turn_order()
	for delta in influence_deltas.values():
		delta.clear()
	
	# for each player... prisoner's dilemma
	for player in players:
		var current_round = ai_node(player[0]).get_current_round()
		var report = {}
		# handle prisoners dilemma
		for player2 in players:
			if player[0] == player2[0]:
				continue
			var stance1 = ai_node(player[0]).get_stance(player2[0], current_round)
			var stance2 = ai_node(player2[0]).get_stance(player[0], current_round)
			var points = prisoner_dilemma(stance1, stance2)
			ai_node(player[0]).add_points(points)
			report[player2[0]] = [stance1, stance2, points]
		
		# send decree
		send_decree(player[0])
	
		# send report
		if ai_node(player[0]).has_method('receive_report_info') and roun < round_count+1:
			ai_node(player[0]).receive_report_info(report)
	
	# end game
	if roun > round_count:
		endgame()
		return
	
	# prepare to send
	start_round()


class MyCustomSorter:
	static func sort(a, b):
		if a[1] > b[1]:
			return true
		return false


# end the game
func endgame():
	var point_list = []
	
	for player in players:
		point_list.append([player, ai_node(player[0]).get_points()])
	
	point_list.sort_custom(MyCustomSorter, "sort")
	
	var instance = victory_panel.instance()
	$SalemAI.add_child(instance)
	$SalemAI.move_child(instance, $SalemAI.get_child_count()-1)
	instance.victory_setup(point_list)
	
	if point_list[0][0][0] == player_character:
		Audio.play_music(Audio.victory_theme)
	else:
		Audio.play_music(Audio.defeat_theme)


# -------------------- SIGNAL HANDLING -----------------

# answering point info requests
func pass_point_info(requester, enemy_requested_name):
	if requester.get_info_til_round(enemy_requested_name) == roun:
		requester.receive_points_info(ai_node(enemy_requested_name).get_points())


# answering matchtable info requests
func pass_matchtable_info(requester, enemy_requested_name, opponent_requested_name):
	# get variables
	var revealed_roun = requester.get_info_til_round(enemy_requested_name)
	
	# get stances
	var en_stances = ai_node(enemy_requested_name).get_stances_against(opponent_requested_name, roun-1)
	var op_stances = ai_node(opponent_requested_name).get_stances_against(enemy_requested_name, roun-1)
	
	# obscure them
	if revealed_roun < roun and roun != 1:
		for i in range(max(1, revealed_roun), roun):
			en_stances[i-1] = 2
			op_stances[i-1] = 2
	
	# send
	requester.receive_matchtable_info(en_stances, op_stances, enemy_requested_name, opponent_requested_name)


# answering relation info requests
func pass_relation_info(requester, enemy_requested_name, opponent_requested_name):
	if requester.get_info_til_round(enemy_requested_name) == roun:
		requester.receive_relation_info(ai_node(enemy_requested_name).get_relation(opponent_requested_name), enemy_requested_name, opponent_requested_name)


# passing messages along
func send_message(sender, package, recipient):
	if ai_node(recipient).has_method('receive_message'):
		ai_node(recipient).receive_message(sender, roun, package)


func change_influence(change, character_name, target = ''):
	if target == '':
		target = character_name
	
	if influence_deltas[target].has(character_name):
		influence_deltas[target][character_name] += change
	else:
		influence_deltas[target][character_name] = change
	
	influences[target][2] += change
	if influences[target][1].has(character_name):
		influences[target][1][character_name] += change
	else:
		influences[target][1][character_name] = change


func receive_proposal(leader, action, object):
	decree = [action, object]
	
	for i in range(1, turn_order.size()):
		ai_node(turn_order[i]).receive_proposal(leader, action, object)


func receive_vote(voter, vote):
	# register vote
	if turn_order[1] == voter: # double vote
		vote_count[vote+1] += 1
	vote_count[vote+1] += 1
	
	voters[voter] = vote


func send_decree(player):
	ai_node(player).receive_decree(decree[0], decree[1], voters, vote_count.duplicate())

# --------------- MISC ------------------------

func prisoner_dilemma(_my_stance, _enemy_stance):
	if _my_stance == 0:
		if _enemy_stance == 0:
			return 2
		else:
			return -2
	else:
		if _enemy_stance == 0:
			return 3
		else:
			return 1


func ai_node(namer):
	return find_node(namer + 'AI')


func get_address():
	return address


func sort_turn_order():
	var organizer = 1
	var scout = 1
	var size = len(turn_order)
	
	while scout < size:
		while (organizer > 0 and 
		influences[turn_order[organizer]][2] > influences[turn_order[organizer-1]][2]):
			var helper = turn_order[organizer]
			turn_order[organizer] = turn_order[organizer-1]
			turn_order[organizer-1] = helper
			organizer -= 1
		
		scout += 1
		organizer = scout
