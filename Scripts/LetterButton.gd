extends Button

var index
signal letter_button_up

func set_index(index):
	self.index = index

func _on_LetterButton_button_up():
	emit_signal("letter_button_up", index)
