extends Control

func _ready():
	language(Global.language)


func language(language):
	$Part1/Label.text = Global.tutorials[language]['Part1']
	$Part2/Label.text = Global.tutorials[language]['Part2']


func _on_Part_1_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial1.tscn")


func _on_Part_2_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial3.tscn")


func _on_Back_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/MainMenu.tscn")
