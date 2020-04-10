extends Node

var language = 0
var music_volume = 1
var sounds_volume = 1

var debug_enabled = false

# Dictionary
var en_menu = {'Play':'Play', 'Manual':'Manual',
				'Options':'Options','Quit':'Quit'}
var br_menu = {'Play':'Jogar', 'Manual':'Manual',
				'Options':'Opcoes','Quit':'Sair'}
var de_menu = {'Play':'Spielen', 'Manual':'Anleitung',
				'Options':'Optionen','Quit':'Verlassen'}
var menus = [en_menu, br_menu, de_menu]

var en_options = {'Options':'Options', 'Volume':'Volume', 'Music':'Music',
				'Sounds':'Sounds','Language':'Language'}
var br_options = {'Options':'Opcoes', 'Volume':'Volume', 'Music':'Musica',
				'Sounds':'Sons','Language':'Linguas'}
var de_options = {'Options':'Optionen', 'Volume':'Lautstaerke', 'Music':'Musik',
				'Sounds':'Geraeusch','Language':'Sprachen'}
var options = [en_options, br_options, de_options]

var en_main = {'Turn Order':'Throne Order', 'Advance':'Advance', 'Points':'Points',
				'Round':'Round', 'Message':'Message from'}
var br_main = {'Turn Order':'Ordem do Trono', 'Advance':'Avancar', 'Points':'Pontos',
				'Round':'Round', 'Message':'Mensagem de'}
var de_main = {'Turn Order':'Reihenfolge', 'Advance':'Vordringen', 'Points':'Punktzahl',
				'Round':'Runde', 'Message':'Brief von'}
var mains = [en_main, br_main, de_main]

var en_relations = {-2:'Friendly',-1:'Trusting', 0:'Suspicious', 1:'Hostile', 2:'Rageful'}
var br_relations = {-2:'Amigavel',-1:'Confiante', 0:'Suspeito', 1:'Hostil', 2:'Revoltado', 100:'Suspeita', 102:'Revoltada'}
var de_relations = {-2:'Freundlich',-1:'Vertrauend', 0:'Msstrauisch', 1:'Feindlich', 2:'Wütend'}

var en_panel = {'Close':'Close', 'Info':'Info', 'Points':'Points', 'Relations':en_relations,
	'R':'','Relation':'\'s relation\ntowards', 'Send':'Send', 'Diplomacy':'Diplomacy Area', 
	'Unknown':'Unknown', 'Recipient':'Recipient'}
var br_panel = {'Close':'Fechar', 'Info':'Info', 'Points':'Pontos', 'Relations':br_relations,
	'R':'Relacao de \n','Relation':' com', 'Send':'Enviar', 'Diplomacy':'Area de Diplomacia', 
	'Unknown':'???', 'Recipient':'Destinatario'}
var de_panel = {'Close':'Schlss.', 'Info':'Info', 'Points':'Punktzahl', 'Relations':de_relations,
	'R':'','Relation':'s Relation\nmit', 'Send':'Senden', 'Diplomacy':'Diplomatiebereich', 
	'Unknown':'Unbekannt', 'Recipient':'Recipient'}
var panels = [en_panel, br_panel, de_panel]

var en_phrases = ['will co-op with', 'will attack']
var br_phrases = ['vai cooperar com', 'vai atacar']
var de_phrases = ['kooperiert mit', 'attackiert']
var phrases = [en_phrases, br_phrases, de_phrases]

var en_stances = {'Agressive':'Agressive', 'Passive':'Passive'}
var br_stances = {'Agressive':'Agressiva', 'Passive':'Passiva'}
var de_stances = {'Agressive':'Agressiv', 'Passive':'Passiv'}
var stances = [en_stances, br_stances, de_stances]

func get_language():
	return language

func set_language(_new):
	language = _new
	
func get_music_volume():
	return music_volume

func set_music_volume(_new):
	_new = _new/100 + 0.001
	music_volume = _new
	Audio.volume_db = linear2db(_new)

func get_sounds_volume():
	return sounds_volume

func set_sounds_volume(_new):
	_new = _new/100 + 0.001
	sounds_volume = _new
	
func get_debug_enabled():
	return debug_enabled
	
func set_debug_enabled(_new):
	debug_enabled = _new
