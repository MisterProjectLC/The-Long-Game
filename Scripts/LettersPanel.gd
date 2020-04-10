extends 'res://Scripts/popup.gd'

var enemy_name = ''
var letter_list = []
var dip_phrases
var selected_letter = ['Teste', '', 0, '']
var recipient
var messagefrom

export(PackedScene) var letter_title

signal send_letter

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
	$SendButton.text = Global.panels[language]['Send']
	recipient = Global.panels[language]['Recipient']
	messagefrom = Global.mains[language]['Message']

# panel setup/initialization
func setup_panel(letter_list, enemy_name, dip_phrases):
	language(Global.get_language())
	
	# variables setup
	self.enemy_name = enemy_name
	self.letter_list = letter_list
	self.dip_phrases = dip_phrases
	
	# setup letter list
	var letters_amount = {}
	var total_amount = 0
	for letter in letter_list:
		var _new = letter_title.instance()
		$LetterButtons.add_child(_new)
		move_child(_new, get_child_count()-1)
		_new.rect_position = Vector2(187, 106 + 36*total_amount)
		_new.connect("letter_button_up", self, "_on_LetterButton_button_up")
		_new.set_index(total_amount)
		
		if letters_amount.keys().has(letter[0]):
			letters_amount[letter[0]] += 1
		else:
			letters_amount[letter[0]] = 1
			
		_new.text = letter[0] + " #" + str(letters_amount[letter[0]])
		total_amount += 1


func update_matchtable(my_stances, en_stances):
	for i in range(my_stances.size()):
		$MatchTable.activate(i, my_stances[i], en_stances[i])


# ------------------- PRESSING STUFF -----------------

# pressed the close button
func _on_CloseButton_button_up():
	close()


# pressed the Send button
func _on_SendButton_button_up():
	if selected_letter[0] == 'Teste':
		return
	
	#Audio.play_sound(Audio.button_press, 1)
	Audio.play_sound(Audio.bird, 3)
	
	emit_signal("send_letter", selected_letter[0], selected_letter[1], 
				selected_letter[2], selected_letter[3], enemy_name)


# pressed the Letter button
func _on_LetterButton_button_up(index):
	print(index)
	var letter = letter_list[index]
	
	selected_letter = letter
	$LetterText.text = messagefrom + ": " + letter[0] + "\n\n" + letter[1] + " " + dip_phrases[letter[2]] + "\n" + letter[3]
	$Recipient.text = recipient + ": " + enemy_name
	

# --------------- MISC -------------------

func _vector2_lerp(vector1, vector2, t):
	var x = vector1.x + (vector2.x - vector1.x)*t
	var y = vector1.y + (vector2.y - vector1.y)*t
	return Vector2(x, y)
	
# --------- GETTER / SETTER ------------
func get_enemy_name():
	return enemy_name
