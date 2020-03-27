extends 'res://Scripts/popup.gd'

signal closed_box

func tutorial_setup(_new_sizer, _new_position, _new_speed, _new_text):
	_sizer = Vector2(12, 4)
	_target_sizer = _new_sizer
	_position = _new_position + (_new_sizer/2)
	_target_position = _new_position
	_speed = _new_speed
	
	$Label.text = _new_text
	$Label.set_position(_new_position + Vector2(15, 10))
	$CloseButton.set_position($CloseButton.get_position() + _new_position - $Background.get_position())
	setup()

func position_sizer(_new_sizer, _new_position, _new_speed):
	_sizer = Vector2(12, 4)
	_target_sizer = _new_sizer
	_position = Vector2(520, 302)
	_target_position = _new_position
	_speed = _new_speed
	setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)


func _on_CloseButton_button_up():
	emit_signal('closed_box', false)
	close()
