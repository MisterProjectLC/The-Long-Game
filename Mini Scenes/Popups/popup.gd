extends Control

# initial animation
var _visibler = false
var invisible_list = []

var _margin_top = 412
var _margin_left = 240
var _speed = 4
var t = 0

signal popup_revealed

# ---------------- INITIAL ANIMATION ------------------
func setup(left, top):
	Audio.play_sound(Audio.paper_flip, 3)
	_margin_top = top
	_margin_left = left
	$Background.margin_bottom = 1


func processing(delta):
	# growing phase
	if t != 1:
		if t < 1:
			t += 2*_speed*delta
		else:
			t = 1
		
		$Background.margin_top = (1-t) - t*_margin_top
		$Background.margin_left = (1-t) - t*_margin_left
		$Background.margin_bottom = (1-t) + t*_margin_top
		$Background.margin_right = (1-t) + t*_margin_left
	
	# reveal phase
	elif _visibler == false:
		for child in get_children():
			if not child in invisible_list:
				child.visible = true
		_visibler = true
		
		emit_signal("popup_revealed")


func close():
	Audio.play_sound(Audio.paper_flip, 2)
	queue_free()

# --------------- MISC -------------------

func _vector2_lerp(vector1, vector2, _t):
	var x = vector1.x + (vector2.x - vector1.x)*_t
	var y = vector1.y + (vector2.y - vector1.y)*_t
	return Vector2(x, y)
