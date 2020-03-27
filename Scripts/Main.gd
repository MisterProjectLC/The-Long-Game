extends "res://Scripts/Game.gd"

export var these_players = [['Grolk', Texture], 
			  ['Kallysta', Texture], 
			  ['Thoren', Texture], 
			  ['Edraele', Texture], 
			  ['Salem', Texture]]

var this_turn_order = ['Edraele', 'Salem', 'Thoren', 'Kallysta', 'Grolk']


# ------------------ MAIN STUFF, TURN ------------------------

# setup
func _ready():
	game_setup(these_players, this_turn_order)

func advance_turn(_char):
	_advance_turn(_char)

func gain_influence(character_name):
	_gain_influence(character_name)
	
func lose_influence(character_name):
	_lose_influence(character_name)
