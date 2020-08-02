extends 'res://Scripts/popup.gd'

signal closed_box

func tutorial_setup(_new_sizer, _new_position, _new_speed, _new_text):
	setup(_new_sizer.x, _new_sizer.y)
	_position = _new_position + (_new_sizer/2)
	_target_position = _new_position
	_speed = _new_speed
	
	$Label.text = _new_text
	$Label.set_position(_new_position + Vector2(15, 10))
	$CloseButton.set_position($CloseButton.get_position() + _new_position - $Background.get_position())

func position_sizer(_new_sizer, _new_position, _new_speed):
	setup(_new_sizer.x, _new_sizer.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)


func _on_CloseButton_button_up():
	emit_signal('closed_box', false)
	close()


func _receive_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		_on_CloseButton_button_up()
