extends 'res://Scripts/popup.gd'

func _ready():
	_sizer = Vector2(12, 4)
	_target_sizer = Vector2(905, 570)
	_position = Vector2(520, 302)
	_target_position = Vector2(59.147, 11.598)
	_speed = 2
	setup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)


func _on_CloseButton_button_up():
	queue_free()
