extends "res://Mini Scenes/Scenes/Game.gd"

export(PackedScene) var popupbox

var texts = []
var current_text = 0
var stance_changes = 0

signal advanced_popup

# --------------- ACTUALLY OPENING --------------------------------

func advance_popup(override):
	if current_text >= texts.size()-1:
		return
	
	var open_next = (texts[current_text].size() == 1 || override)
	$ObjectiveArea.visible = !open_next
	
	if open_next:
		current_text += 1
		open_popupbox(Vector2(415, 95), texts[current_text][0])
		emit_signal("advanced_popup")
	
	else:
		$ObjectiveArea/Background/Label.text = texts[current_text][1]


func open_popupbox(_new_sizer,  _new_text):
	var popup = popupbox.instance()
	add_child(popup)
	move_child(popup, get_child_count()-1)
	popup.connect('closed_box', self, 'advance_popup')
	
	popup.tutorial_setup(_new_sizer, _new_text)


# ------------- SIGNAL STUFF -------------------------------

func point_info_request(requester, enemy_requested_name):
	pass_point_info(requester, enemy_requested_name)

# answering relation info requests
func relation_info_request(requester, enemy_requested_name, opponent_requested_name):
	pass_relation_info(requester, enemy_requested_name, opponent_requested_name)

func matchtable_info_request(requester, enemy_requested_name, opponent_requested_name):
	pass_matchtable_info(requester, enemy_requested_name, opponent_requested_name)
