extends 'res://Scripts/popup.gd'

# Called when the node enters the scene tree for the first time.
func _ready():
	setup(258, 167)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)

func set_text(text):
	$Label.text = text

func _on_CloseButton_button_up():
	close()
