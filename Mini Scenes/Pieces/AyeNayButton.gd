extends 'res://Scripts/Stance.gd'


func language(language):
	$Nay/Label.text = Global.council[language]['Nay']
	$Null/Label.text = Global.council[language]['Null']
	$Aye/Label.text = Global.council[language]['Aye']

func _on_Aye_button_up():
	emit_signal("stance_change", 0)


func _on_Null_button_up():
	emit_signal("stance_change", -1)


func _on_Nay_button_up():
	emit_signal("stance_change", 1)


func set_visible(_stance):
	if _stance == 1:
		$Aye.set_visible(true)
		$Null.set_visible(false)
		$Nay.set_visible(false)
	elif _stance == 0:
		$Aye.set_visible(false)
		$Null.set_visible(true)
		$Nay.set_visible(false)
	else:
		$Aye.set_visible(false)
		$Null.set_visible(false)
		$Nay.set_visible(true)
