extends 'res://Mini Scenes/Popups/popup.gd'

signal closed_box

func tutorial_setup(_new_sizer, _new_text):
	_speed = 1.5
	setup(_new_sizer.x, _new_sizer.y)
	
	$Label.text = _new_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)


func _on_CloseButton_button_up():
	emit_signal('closed_box', false)
	close()


func _receive_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		_on_CloseButton_button_up()
