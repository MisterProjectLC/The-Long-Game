extends 'res://Scripts/popup.gd'

var letter_list = []
var dip_phrases
var selected_letter = ['Teste', '', 0, '']

export(PackedScene) var letter_title


# ---------------- INITIAL ANIMATION ------------------

func _process(delta):
	processing(delta)

# ------------------ SETUP/INIT --------------------

# panel setup/initialization
func _setup_list(_letter_list, _enemy_name, _dip_phrases):
	# setup letter list
	var letters_amount = {}
	var total_amount = 0
	for letter in _letter_list:
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


# ------------------- PRESSING STUFF -----------------

# pressed the close button
func _on_CloseButton_button_up():
	close()


# pressed the Letter button
func _on_LetterButton_button_up(_index):
	pass


# --------------- MISC -------------------

func _vector2_lerp(vector1, vector2, t):
	var x = vector1.x + (vector2.x - vector1.x)*t
	var y = vector1.y + (vector2.y - vector1.y)*t
	return Vector2(x, y)
