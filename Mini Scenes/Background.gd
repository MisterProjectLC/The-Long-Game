extends NinePatchRect

signal scrolling

func _gui_input(event):
	if event is InputEventScreenDrag:
		emit_signal("scrolling", (event.get_relative().y), event.speed)
