extends 'res://Mini Scenes/Popups/popup.gd'

onready var dossiers = [$Dossier, $Dossier2, $Dossier3, $Dossier4, $Dossier5,]
var player_character = "Salem"
var influence_list = {}
var influence_deltas = {}
var players

signal change_influence

# ---------------- INITIAL ANIMATION ------------------
func _ready():
	setup(350, 270)
	for dossier in dossiers:
		dossier.connect("change_influence", self, "change_influence")

func _process(delta):
	processing(delta)

# ------------------ SETUP/INIT --------------------

func language(language):
	$CloseButton.text = Global.panels[language]['Close']
	$FinishButton.text = Global.panels[language]['Finish']


# panel setup/initialization
func setup_panel(_turn_order, _influence_list, _players, _player_character):
	# {player:[2, {enemy:1, enemy2:-2...}, total]}
	language(Global.get_language())
	player_character = _player_character
	influence_list = _influence_list.duplicate(true)
	players = _players
	
	# setup ordered by turn order
	for i in range(len(_turn_order)):
		var player = _turn_order[i]
		
		var influence = get_influence(influence_list, player)
		influence_list[player][2] = influence
		
		# setup info
		dossiers[i].setup(i, influence_list[player][0])
		dossiers[i].set_influence(influence)
		dossiers[i].setup_player(player, players)
		dossiers[i].setup_patron_list(influence_list[player][1], players, player_character)


func change_influence(target, change, index):
	if influence_deltas.keys().has(target):
		influence_deltas[target] += change
	else:
		influence_deltas[target] = change
	
	dossiers[index].add_patron(player_character, change)

# ------------------- PRESSING STUFF -----------------

# pressed the close button
func _on_CloseButton_button_up():
	close()


func _on_FinishButton_button_up():
	for target in influence_deltas.keys():
		for _i in range(abs(influence_deltas[target])):
			emit_signal("change_influence", sign(influence_deltas[target]), target)
	
	close()

# -------- MISC ----------------------------

func get_influence(_influence_list, player):
	return _influence_list[player][0] + sum(_influence_list[player][1].values())


func sum(array):
	var v = 0
	for a in array:
		v += a
	return v

