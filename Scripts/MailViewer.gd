extends 'res://Scripts/popup.gd'

# Called when the node enters the scene tree for the first time.
func _ready():
	_sizer = Vector2(12, 4)
	_target_sizer = Vector2(517, 335)
	_position = Vector2(520, 302)
	_target_position = Vector2(236, 120)
	_speed = 2
	setup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)

func set_text(text):
	$Label.text = text

func _on_CloseButton_button_up():
	close()
