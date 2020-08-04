extends Button

var index
signal letter_button_up

func set_index(_index):
	self.index = _index

func _on_LetterButton_button_up():
	emit_signal("letter_button_up", index)
