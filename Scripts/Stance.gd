extends Control

signal stance_change

func language(language):
	$Agressive/Label.text = Global.stances[language]['Agressive']
	$Passive/Label.text = Global.stances[language]['Passive']

func _on_Passive_button_up():
	emit_signal("stance_change", 1)

func _on_Agressive_button_up():
	emit_signal("stance_change", 0)

func set_visible(_stance):
	if _stance == 0:
		$Passive.set_visible(true)
		$Agressive.set_visible(false)
	else:
		$Agressive.set_visible(true)
		$Passive.set_visible(false)


func button_down():
	Audio.play_sound(Audio.button_press, 1)
