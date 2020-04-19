extends "res://Scripts/Game.gd"

export var these_players = [['Grolk', Texture], 
						['Kallysta', Texture], 
						['Obrulena', Texture],
						['Thoren', Texture], 
						['Edraele', Texture], 
						['Salem', Texture]]

var this_turn_order = ['Edraele', 'Salem', 'Obrulena', 
'Thoren', 'Kallysta', 'Grolk']


# ------------------ MAIN STUFF, TURN ------------------------

# setup
func _ready():
	randomize()
	var i = (randi() % 3)+1
	var removed_char = these_players[i][0]
	these_players.erase(these_players[i])
	this_turn_order.erase(removed_char)
	
	game_setup(these_players, this_turn_order)

func advance_turn(_char):
	_advance_turn(_char)

func gain_influence(character_name):
	_gain_influence(character_name)
	
func lose_influence(character_name):
	_lose_influence(character_name)

