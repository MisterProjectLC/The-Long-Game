extends Control

export(PackedScene) var letter_button

# panel setup/initialization
func setup(letter_list):
	
	# setup letter list
	var letters_amount = {}
	var total_amount = 0
	
	
	for letter in letter_list:
		var _new = letter_button.instance()
		add_child(_new)
		move_child(_new, get_child_count()-1)
		_new.rect_position = Vector2($LetterContainer.rect_position.x, 
						$LetterContainer.rect_position.y + 36*total_amount)
		_new.connect("letter_button_up", self, "_on_LetterButton_button_up")
		_new.set_index(total_amount)
		
		if letters_amount.keys().has(letter[0]):
			letters_amount[letter[0]] += 1
		else:
			letters_amount[letter[0]] = 1
			
		_new.text = letter[0] + " #" + str(letters_amount[letter[0]])
		total_amount += 1


func _on_LetterButton_button_up(id):
	get_parent()._on_LetterButton_button_up(id)
