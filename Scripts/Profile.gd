extends Control

signal portrait_click
signal stance_change

var enemy

func language(language):
	$PassiveAgressiveButtons.language(language)

func setup(enemy):
	self.enemy = enemy
	$Button/Portrait.readdy(enemy)

func new_stance(_stance):
	$PassiveAgressiveButtons.set_visible(_stance)


func _on_Button_button_up():
	emit_signal("portrait_click", enemy)


func _on_PassiveAgressiveButtons_stance_change(stance):
	emit_signal("stance_change", enemy, stance)
