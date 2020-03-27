extends Control

signal spoiler_pressed

export(Texture) var side_arrow
export(Texture) var down_arrow

var revealed = true
var id

func setup(title, text, id, color):
	$Title.text = title
	$Title.add_color_override("font_color", color)
	$Texto.text = text
	self.id = id

func set_revealed(_new):
	#print('revealed: ' + str(revealed) + ', id: ' + str(id))
	revealed = _new
	$Texto.visible = true if revealed else false
	$SpoilerButton.icon = down_arrow if revealed else side_arrow
	
func get_revealed():
	return revealed

func _on_SpoilerButton_button_up():
	#revealed = !revealed
	Audio.play_sound(Audio.paper_flip, 3)
	emit_signal("spoiler_pressed", !revealed, id)
