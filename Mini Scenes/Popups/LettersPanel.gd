extends 'res://Scripts/popup.gd'

var enemy_name = ''
var recipient
var messagefrom
var letter_list = []
var dip_phrases
var selected_letter = ['Teste', '', 0, '']

signal send_letter

# ---------------- INITIAL ANIMATION ------------------
func _ready():
	setup(374, 222)


func _process(delta):
	processing(delta)

# ------------------ SETUP/INIT --------------------

func language(language):
	$CloseButton.text = Global.panels[language]['Close']
	$SendButton.text = Global.panels[language]['Send']
	recipient = Global.panels[language]['Recipient']
	messagefrom = Global.mains[language]['Message']


# panel setup/initialization
func setup_panel(_letter_list, _enemy_name, _dip_phrases):
	language(Global.get_language())
	
	# variables setup
	self.enemy_name = _enemy_name
	self.letter_list = _letter_list
	self.dip_phrases = _dip_phrases
	
	# setup letter list
	$LetterList.setup(letter_list)


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
