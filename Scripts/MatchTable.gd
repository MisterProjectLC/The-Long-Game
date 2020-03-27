extends TextureRect

export var square_count := 5

var my_blocks = []
var en_blocks = []
export var stance_sprites = []

func ready():
	_ready()

func _ready():
	for i in range(square_count):
		my_blocks.append(get_child(square_count+i))
		
	for i in range(square_count):
		en_blocks.append(get_child(i))

func activate(_turn, _my_stance, _en_stance):
	my_blocks[_turn].visible = true
	en_blocks[_turn].visible = true
	my_blocks[_turn].texture = stance_sprites[_my_stance]
	en_blocks[_turn].texture = stance_sprites[_en_stance]
	pass
