extends Label

onready var patrons = [$Patron, $Patron2, $Patron3, $Patron4, $Patron5,]
var this_player = ""
var player_index = 0
var base_influence = 0

var patron_list = []
var index = 0
var patron_count = 0
var players

signal change_influence

func setup(_index, _base_influence):
	index = _index
	base_influence = _base_influence


func set_influence(_influence):
	self.text = str(_influence)
	
	if _influence > base_influence:
		self.set_self_modulate(Color.darkgreen)
	elif _influence < base_influence:
		self.set_self_modulate(Color.darkred)
	else:
		self.set_self_modulate(Color.black)


func setup_player(player_name, _players):
	this_player = player_name
	$Portrait.readdy(get_player_sheet(player_name, _players))


func setup_patron_list(_patron_list, _players):
#  {enemy:1, enemy2:-2...}
	patron_list = _patron_list
	players = _players
	
	for patron in patron_list.keys():
		new_patron(patron)


func add_patron(patron, change):
	set_influence(int(text)+change)
	
	if patron in patron_list.keys():
		patron_list[patron] += change
		var patron_object = patrons[player_index]
		set_patron_text(patron, patron_object)
	
	else:
		patron_list[patron] = change
		player_index = patron_count
		new_patron(patron)


func new_patron(patron):
	var patron_object = patrons[patron_count]
	set_patron_text(patron, patron_object)
	patron_count += 1


func set_patron_text(patron, patron_object):
	# Setup profile
	patron_object.get_children()[0].readdy(get_player_sheet(patron, players))
	patron_object.visible = true
	
	# Setup text
	patron_object.text = str(patron_list[patron])
	if patron_list[patron] > 0:
		patron_object.set_self_modulate(Color.darkgreen)
	elif patron_list[patron] < 0:
		patron_object.set_self_modulate(Color.darkred)
	else:
		patron_object.set_self_modulate(Color.black)


func _on_MoreInfluence_button_up():
	emit_signal("change_influence", this_player, 1, index)

func _on_LessInfluence_button_up():
	emit_signal("change_influence", this_player, -1, index)


func get_player_sheet(player_name, players):
	var player_sheet = []
	for player in players:
		if player[0] == player_name:
			player_sheet = player
	return player_sheet
