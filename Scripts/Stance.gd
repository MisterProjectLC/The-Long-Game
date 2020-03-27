extends Control

signal stance_change

func language(language):
	var en_dictionary = {'Agressive':'Agressive', 'Passive':'Passive'}
	var br_dictionary = {'Agressive':'Agressiva', 'Passive':'Passiva'}
	var de_dictionary = {'Agressive':'Agressiv', 'Passive':'Passiv'}
	var dictionaries = [en_dictionary, br_dictionary, de_dictionary]
	$Agressive/Label.text = dictionaries[language]['Agressive']
	$Passive/Label.text = dictionaries[language]['Passive']

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
