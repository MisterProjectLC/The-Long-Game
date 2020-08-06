extends 'res://Mini Scenes/Popups/popup.gd'

var portraits = ['Winner', 'FirstLoser', 'SecondLoser', 'ThirdLoser', 'FourthLoser']
var point_nodes = ['PointsWinner', 'Points1', 'Points2', 'Points3', 'Points4']

func _ready():
	_speed = 2
	setup(350, 210)
	
func language(language):
	var dictionary = ['End of Match', 'Fim da Partida', 'Spiel-Ende']
	$Title.text = dictionary[language]
	
func victory_setup(point_list):
	language(Global.get_language())
	
	for i in range(point_list.size()):
		find_node(portraits[i]).readdy(point_list[i][0])
		find_node(point_nodes[i]).text = str(point_list[i][1])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)

func set_text(text):
	$Label.text = text

func _on_BackButton_button_up():
	get_tree().change_scene("res://Mini Scenes/Scenes/MainMenu.tscn")


func _on_RestartButton_button_up():
	get_tree().change_scene(get_parent().get_address())


func _on_VictoryViewer_popup_revealed():
	for i in range(point_nodes.size()):
		if find_node(point_nodes[i]).text == '+2':
			find_node(point_nodes[i]).visible = false
			find_node(portraits[i]).visible = false
