extends 'res://Mini Scenes/Popups/popup.gd'

signal closed_manual

export(PackedScene) var paragrapher
export(PackedScene) var imager

var scroll_speed = 80
var min_height = 40
var offset = 40

var current_page = 0

var en_pages = []
var br_pages = []
var de_pages = []

var player_pages = ['Grolk', 'Zardri','Kallysta','Horlin', 'Obrulena', 'Thoren','Edraele', 'Drakoth']
var pages = []
export var images = []

var instances = []

# ----------------- ANIMATION -----------------

func _ready():
	_speed = 12
	setup(-80, 0)
	
func _process(delta):
	processing(delta)
	
# --------------- SETUP -----------------------------

func language(language):
	var dictionary = [en_pages, br_pages, de_pages]
	pages = dictionary[language]


func manual_setup(_new):
	current_page = _new
	en_pages = ManualEnglish.pages_setup(images)
	br_pages = ManualBr.pages_setup(images)
	de_pages = ManualDeutsch.pages_setup(images)
	language(Global.language)


func open_pages():
	var current_y = 10
	var page = pages[current_page]
	
	var id = 0
	for paragraph in page:
		var instance
		if paragraph[0] == 'text':
			instance = paragrapher.instance()
			var color = Color.black if !paragraph[1].has('color') else paragraph[1]['color']
			instance.setup(paragraph[1]['title'], paragraph[1]['text'], id, color)
			instance.connect("spoiler_pressed", self, "set_text_revealed")
		
		elif paragraph[0] == 'image':
			instance = imager.instance()
			instance.texture = paragraph[1]['image']
		
		id += 1
		$Background.add_child(instance)
		instances.append(instance)
		#instance.set_position(Vector2(90, current_y))
		instance.rect_position = $Background.rect_position + Vector2(-70, current_y)
		
		current_y += 14 + offset + instance.get_size()

# ------------ SETTING STUFF -------------------------

func reveal_all_instances(revealed):
	for i in range(instances.size()):
		set_text_revealed(revealed, i)


func set_text_revealed(revealed, id):
	if !instances[id].has_method('set_revealed'):
		return
	
	if instances[id].get_revealed() == revealed:
		return
	
	var _page = pages[current_page]
	instances[id].set_revealed(revealed)
	
	# sobe (negativo) se escondendo
	var minus = -1 if revealed == false else 1
	
	for i in range(id+1, instances.size()):
		var instance = instances[i]
		instance.set_position(instance.get_position() + Vector2( 0, minus*(instances[id].get_size()) ))


func get_player_page(player):
	return 3+player_pages.find(player)

# -------------------- INPUT --------------------

# scrolling
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			# zoom in
			if event.button_index == BUTTON_WHEEL_UP and instances[0].get_position().y <= 14:
				scroll(scroll_speed)
			# zoom out
			if event.button_index == BUTTON_WHEEL_DOWN:
				scroll(-scroll_speed)


func scroll(scroll_amount):
	for instance in instances:
		instance.rect_position = (instance.rect_position + Vector2(0, scroll_amount))


func _on_CloseButton_button_up():
	emit_signal("closed_manual")
	close()


func update_page():
	for instance in instances:
		instance.queue_free()
	instances.clear()
	
	open_pages()


func _on_BackButton_button_up():
	if current_page == 0:
		current_page = pages.size()-1
	else:
		current_page -= 1
	update_page()


func _on_NextButton_button_up():
	if current_page == pages.size()-1:
		current_page = 0
	else:
		current_page += 1
	update_page()


func _on_EyeButton_button_up():
	reveal_all_instances(true)

func _on_ClosedEyeButton_button_up():
	reveal_all_instances(false)


func _on_Background_scrolling(scroll_amount, _speed):
	scroll(scroll_amount)
