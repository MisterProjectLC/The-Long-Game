extends 'res://Scripts/popup.gd'

func _ready():
	_speed = 2
	setup(452, 285)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)


func _on_CloseButton_button_up():
	queue_free()
