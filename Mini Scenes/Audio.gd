extends AudioStreamPlayer

export(AudioStream) var menu_theme
export(AudioStream) var game_theme
export(AudioStream) var victory_theme
export(AudioStream) var defeat_theme
export(AudioStream) var fury_theme
export var backstab = []
export var button_press = []
export var small_press = []
export var paper_flip = []
export var writing = []
export var bird = []
export var investigation = []

var sounds = ['Sound', 'Sound2', 'Sound3']

func play_music(path):
	stream = path
	playing = true
	volume_db = linear2db(Global.get_music_volume())

func play_sound(sound_list, player):
	find_node(sounds[player-1]).stream = sound_list[rand_range(0, sound_list.size())]
	find_node(sounds[player-1]).playing = true
	find_node(sounds[player-1]).volume_db = linear2db(Global.get_sounds_volume())
