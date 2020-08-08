extends "res://Mini Scenes/Scenes/Game.gd"

export var these_players = [['Grolk', Texture], 
						['Zardri', Texture], 
						['Kallysta', Texture], 
						['Obrulena', Texture],
						['Thoren', Texture], 
						['Edraele', Texture], 
						['Salem', Texture]]

var this_turn_order = ['Edraele', 'Salem', 'Obrulena', 
'Thoren', 'Kallysta', 'Grolk', 'Zardri']


# ------------------ MAIN STUFF, TURN ------------------------

# setup
func _ready():
	randomize()
	
	# Get one lesser-character
	var i = (randi() % 2)
	delete_char(i)
	
	# Get two mid-characters
	i = (randi() % 3)+1
	delete_char(i)
	
	game_setup(these_players, this_turn_order)


func delete_char(i):
	var removed_char = these_players[i][0]
	these_players.erase(these_players[i])
	this_turn_order.erase(removed_char)


func advance_turn(_char):
	_advance_turn(_char)


func gain_influence(character_name):
	_gain_influence(character_name)


func lose_influence(character_name):
	_lose_influence(character_name)
