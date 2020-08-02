extends 'res://Scripts/popup.gd'

var portraits = ['FirstPort', 'SecondPort', 'ThirdPort', 'FourthPort']
var opponents

func _ready():
	_sizer = Vector2(12, 4)
	_target_sizer = Vector2(601, 335)
	_position = Vector2(520, 302)
	_target_position = Vector2(184, 120)
	_speed = 2
	setup()
	
func language(language):
	var dictionary = ['Results', 'Resultados']
	$Title.text = dictionary[language]
	
func report_setup(player, _opponents, reports):
	self.opponents = _opponents
	
	language(Global.get_language())
	
	# exception - tutorial has 2 players
	var begin_with = 0
	if opponents.size() == 2:
		begin_with = 1
	
	for i in range(opponents.size()):
		# setup portraits
		var delay = 0
		if opponents[i][0] == player:
			delay = 1
			continue
		find_node(portraits[begin_with+i-delay]).readdy(opponents[i])
		
		# setup reports
		for report in reports.keys():
			if report == opponents[i][0]:
				find_node('Report' + str(i+1)).ready()
				find_node('Report' + str(i+1)).activate(0, reports[report][0], reports[report][1])
				if reports[report][2] > 0:
					find_node('Points' + str(i+1)).text = '+' + str(reports[report][2])
				else:
					find_node('Points' + str(i+1)).text = str(reports[report][2])
				break


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	processing(delta)

func set_text(text):
	$Label.text = text

func _on_CloseButton_button_up():
	close()


func _on_ReportViewer_popup_revealed():
	# hide the rest
	for i in range(portraits.size()-1, opponents.size()-2, -1):
		find_node(portraits[i]).set_visible(false)
		find_node('Report' + str(i+1)).set_visible(false)
		find_node('Points' + str(i+1)).set_visible(false)
