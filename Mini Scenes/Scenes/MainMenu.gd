extends Control

export(PackedScene) var manual
export(PackedScene) var options

# Called when the node enters the scene tree for the first time.
func _ready():
	language(Global.get_language())
	Audio.play_music(Audio.menu_theme)

func language(language):
	$Play/Label.text = Global.menus[language]['Play']
	$Manual/Label.text = Global.menus[language]['Manual']
	$Options/Label.text = Global.menus[language]['Options']
	$Quit/Label.text = Global.menus[language]['Quit']

func volume():
	pass
# ------------------- PRESSING STUFF -------------------

func _on_Play_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/Main.tscn")

func _on_Manual_button_up():
	var manual_panel = manual.instance()
	manual_panel.manual_setup(0)
	add_child(manual_panel)
	move_child(manual_panel, get_child_count()-1)
	
func _on_Tutorial_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial1.tscn")

func _on_Options_button_up():
	var option_panel = options.instance()
	add_child(option_panel)
	move_child(option_panel, get_child_count()-1)
	option_panel.connect('changed_language', self, 'language')
	option_panel.connect('changed_volume', self, 'volume')

func _on_Quit_button_up():
	get_tree().quit()


func button_down():
	Audio.play_sound(Audio.button_press, 1)
	pass


func button_up():
	#Audio.lay_sound(Audio.button_release, 2)
	pass

