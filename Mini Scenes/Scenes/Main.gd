extends "res://Mini Scenes/Scenes/Game.gd"

export var these_players = [['Grolk', Texture], 
						['Zardri', Texture], 
						['Kallysta', Texture], 
						['Horlin', Texture], 
						['Obrulena', Texture],
						['Thoren', Texture], 
						['Edraele', Texture], 
						['Drakoth', Texture],
						['Salem', Texture]]

var this_turn_order = ['Drakoth','Edraele', 'Obrulena', 'Horlin', 
'Salem', 'Thoren', 'Kallysta', 'Grolk', 'Zardri']


# ------------------ MAIN STUFF, TURN ------------------------

# setup
func _ready():
	randomize()
	Global.set_advanced_enabled(true)
	
	# Get one lesser-character
	var i = (randi() % 2)
	delete_char(i)
	
	# Get two mid-characters
	i = (randi() % 4)+1
	delete_char(i)
	i = (randi() % 3)+1
	delete_char(i)
	
	# Get one nemesis-character
	i = (randi() % 2)+3
	delete_char(i)
	
	game_setup(these_players, this_turn_order)


func delete_char(i):
	var removed_char = these_players[i][0]
	these_players.erase(these_players[i])
	this_turn_order.erase(removed_char)


func advance_turn(_char):
	_advance_turn(_char)
