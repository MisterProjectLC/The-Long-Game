extends 'res://Scripts/popup.gd'

signal info_pressed
signal opponent_pressed
signal letters_pressed
signal update_matchtable
signal send_message
signal closed_manual

var enemy_name = ''
var _opponent_index = 3

var players = []
var relation_dict

var points_text = ''
var relation_sub = ''
var r_sub = ''

var manual

# ---------------- INITIAL ANIMATION ------------------
func _ready():
	_sizer = Vector2(12, 4)
	_target_sizer = Vector2(824, 479)
	_position = Vector2(520, 302)
	_target_position = Vector2(93, 61)
	setup()
	
func _process(delta):
	processing(delta)

# ------------------ SETUP/INIT --------------------

func language(language):
	$CloseButton.text = Global.panels[language]['Close']
	$InfoButton.text = Global.panels[language]['Info']
	$SendButton.text = Global.panels[language]['Send']
	$DiplomacyArea.text = Global.panels[language]['Diplomacy']
	$Relation.text = Global.panels[language]['Unknown']
	r_sub = Global.panels[language]['R']
	relation_sub = Global.panels[language]['Relation']
	points_text = Global.panels[language]['Points']
	$Points.text = points_text + ":\n?"
	
	relation_dict = Global.panels[language]['Relations']

# panel setup/initialization
func setup_panel(enemy, manual, info_turn, players, dip_phrases):
	language(Global.get_language())
	
	# variables setup
	self.enemy_name = enemy[0]
	self.players = players
	self.manual = manual
	self._opponent_index = players.size()-1
	
	# portraits
	$Portrait.readdy(enemy)
	$OtherPort.readdy(players[players.size()-1])
	
	# x's stance towards...
	$RelationSub.text = r_sub + enemy_name + relation_sub
	
	# update matchtable
	# info: who am i, who my enemy is
	emit_signal('update_matchtable')
	
	# setup dropdowns
	for phrase in dip_phrases:
		$Phrase.add_item(phrase)
	
	for player in players:
		if player[0] != enemy_name:
			$Mention1.add_item(player[0])
		$Mention2.add_item(player[0])


func update_matchtable(my_stances, en_stances):
	for i in range(my_stances.size()):
		$MatchTable.activate(i, my_stances[i], en_stances[i])

# ---------------- SET TEXT ----------------------
		
func reveal_points(_points):
	$Points.text = points_text + ":\n" + str(_points)
	

func update_relation(_relation):
	if (_relation == 0 or _relation == 2) and enemy_name == 'Edraele' and Global.br_relations == relation_dict:
		_relation += 100
	
	$Relation.text = relation_dict[_relation]

# ------------------- PRESSING STUFF -----------------

# pressed the close button
func _on_CloseButton_button_up():
	close()


# pressed the info button
func _on_InfoButton_button_up():
	Audio.play_sound(Audio.investigation, 3)
	emit_signal("info_pressed")


# pressed the other port button 
func _on_OtherPortButton_button_up():
	_opponent_index += 1
	if _opponent_index >= players.size():
		_opponent_index = 0
	
	if players[_opponent_index][0] == enemy_name:
		_opponent_index += 1
	
	$OtherPort.readdy(players[_opponent_index])
	emit_signal("opponent_pressed")
	

# pressed the Send button
func _on_SendButton_button_up():
	#Audio.play_sound(Audio.button_press, 1)
	Audio.play_sound(Audio.bird, 3)
	var name1 = $Mention1.get_item_text($Mention1.get_selected_id())
	var message_id = $Phrase.get_selected_id()
	var name2 = $Mention2.get_item_text($Mention2.get_selected_id())
	
	emit_signal('send_message', name1, message_id, name2)

func _on_LetterButton_button_up():
	emit_signal("letters_pressed", enemy_name)

func item_selected(ID):
	Audio.play_sound(Audio.writing, 2)


func _on_ManualButton_button_up():
	var player_translator = {'Grolk':3,'Kallysta':4, 'Thoren':5,'Edraele':6}
	
	var _new = manual.instance()
	_new.manual_setup(player_translator[enemy_name])
	add_child(_new)
	move_child(_new, get_child_count()-1)
	
	_new.connect("closed_manual", self, "closed_manual")
	
func closed_manual():
	emit_signal('closed_manual')

# --------------- MISC -------------------

func _vector2_lerp(vector1, vector2, t):
	var x = vector1.x + (vector2.x - vector1.x)*t
	var y = vector1.y + (vector2.y - vector1.y)*t
	return Vector2(x, y)
	
# --------- GETTER / SETTER ------------
func get_enemy_name():
	return enemy_name

func get_opponent():
	return players[_opponent_index]
