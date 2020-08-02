extends Control

# initial animation
var _visibler = false
var _sizer = Vector2(12, 4)
var _target_sizer = Vector2(824, 479)
var _position = Vector2(520, 302)
var _target_position = Vector2(93, 61)
var _speed = 4
var t = 0

signal popup_revealed

# ---------------- INITIAL ANIMATION ------------------
func setup():
	Audio.play_sound(Audio.paper_flip, 3)
	$Background.set_position(_position)
	$Background.set_size(_sizer)
	
func processing(delta):
	# growing phase
	if $Background.get_size().x < _target_sizer.x:
		# lerp
		t += _speed*delta
		_position = _vector2_lerp(_position, _target_position, t)
		_sizer = _vector2_lerp(_sizer, _target_sizer, t)
		$Background.set_position(_position)
		$Background.set_size(_sizer)
		#$BlackBack.modulate.a = 0 + (46 - 0)*t
		
	# reveal phase
	elif _visibler == false:
		for child in get_children():
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
