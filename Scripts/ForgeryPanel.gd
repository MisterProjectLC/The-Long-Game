extends 'res://Scripts/LettersList.gd'


# ---------------- INITIAL ANIMATION ------------------
func _ready():
	setup(374, 222)

# ------------------ SETUP/INIT --------------------

func language(language):
	$CloseButton.text = Global.panels[language]['Close']
	$SendButton.text = Global.panels[language]['Send']


# panel setup/initialization
func setup_panel(letter_list, dip_phrases):
	language(Global.get_language())
	
	# variables setup
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

# pressed the Letter button
func _on_LetterButton_button_up(index):
	print(index)
	var letter = letter_list[index]
	
	selected_letter = letter


# --------------- MISC -------------------

func _vector2_lerp(vector1, vector2, t):
	var x = vector1.x + (vector2.x - vector1.x)*t
	var y = vector1.y + (vector2.y - vector1.y)*t
	return Vector2(x, y)
