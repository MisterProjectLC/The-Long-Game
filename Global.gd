extends Node

var language = 2
var music_volume = 1
var sounds_volume = 1

var debug_enabled = false
var advanced_enabled = true

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
				'Round':'Round', 'Message':'Message from', 'Forgery':'Forgery', 'Influence':'Influence'}
var br_main = {'Turn Order':'Ordem do Trono', 'Advance':'Avancar', 'Points':'Pontos',
				'Round':'Round', 'Message':'Mensagem de', 'Forgery':'Falsific.', 'Influence':'Influencia'}
var de_main = {'Turn Order':'Reihenfolge', 'Advance':'Beenden', 'Points':'Punktzahl',
				'Round':'Runde', 'Message':'Brief von', 'Forgery':'Faelschung', 'Influence':'Einfluss'}
var mains = [en_main, br_main, de_main]

var en_relations = {-2:'Friendly',-1:'Trusting', 0:'Suspicious', 1:'Hostile', 2:'Rageful'}
var br_relations = {-2:'Amigavel',-1:'Confiante', 0:'Suspeito', 1:'Hostil', 2:'Revoltado', 100:'Suspeita', 102:'Revoltada'}
var de_relations = {-2:'Freundlich',-1:'Vertrauend', 0:'Msstrauisch', 1:'Feindlich', 2:'Wuetend'}

var en_panel = {'Close':'Close','Finish':'Finish', 'Info':'Info', 'Points':'Points', 'Relations':en_relations,
	'R':'','Relation':'\'s relation\ntowards', 'Send':'Send', 'Diplomacy':'Diplomacy Area', 
	'Unknown':'Unknown', 'Recipient':'Recipient', 
	'Subject':'Agent', 'Action':'Stance', 'Object':'Target', 'Author':'Author'}
var br_panel = {'Close':'Fechar','Finish':'Finalizar', 'Info':'Info', 'Points':'Pontos', 'Relations':br_relations,
	'R':'Relacao de \n','Relation':' com', 'Send':'Enviar', 'Diplomacy':'Area de Diplomacia', 
	'Unknown':'???', 'Recipient':'Destinatario', 
	'Subject':'Agente', 'Action':'Postura', 'Object':'Target', 'Author':'Autor'}
var de_panel = {'Close':'Schlss.','Finish':'Abschliessen', 'Info':'Info', 'Points':'Punktzahl', 'Relations':de_relations,
	'R':'','Relation':'s Relation\nmit', 'Send':'Senden', 'Diplomacy':'Diplomatiebereich', 
	'Unknown':'Unbekannt', 'Recipient':'Recipient', 
	'Subject':'Agent', 'Action':'Haltung', 'Object':'Ziel', 'Author':'Autor'}
var panels = [en_panel, br_panel, de_panel]

var en_council = {'Current':'Current Decree','Approved':'Decree Approved',
				'Rejected':'Decree Rejected', 'Attack':'Attack', 'Co-op':'Co-op with',
				'Next':'Next Decree Proposal', 'Proposal':'Decree Proposal', 
				'Aye':'Aye', 'Null':'Null', 'Nay':'Nay', 'Propose':'Propose', 'Vote':'Vote',}
var br_council = {'Current':'Decreto Atual', 'Approved':'Decreto Aprovado',
				'Rejected':'Decreto Rejeitado', 'Attack':'Atacar', 'Co-op':'Paz com',
				'Next':'Proxima Proposta',  'Proposal':'Proposta de Decreto', 
				'Aye':'Sim', 'Null':'Nulo', 'Nay':'Nao', 'Propose':'Propor', 'Vote':'Votar',}
var de_council = {'Current':'Aktuelles Dekret', 'Approved':'Genehmigtes Dekret',
				'Rejected':'Verwerftes Dekret', 'Attack':'Attackiere', 'Co-op':'Friede mit',
				'Next':'Naechster Dekretvorschlag', 'Proposal':'Dekretvorschlag', 
				'Aye':'Ja','Null':'Null','Nay':'Nein', 'Propose':'Vorschlagen', 'Vote':'Stimmen',}
var council = [en_council, br_council, de_council]

var en_phrases = ['will co-op with', 'will attack']
var br_phrases = ['vai cooperar com', 'vai atacar']
var de_phrases = ['kooperiert mit', 'attackiert']
var phrases = [en_phrases, br_phrases, de_phrases]

var en_stances = {'Agressive':'Agressive', 'Passive':'Passive'}
var br_stances = {'Agressive':'Agressiva', 'Passive':'Passiva'}
var de_stances = {'Agressive':'Agressiv', 'Passive':'Passiv'}
var stances = [en_stances, br_stances, de_stances]

var en_tutorials = {'Part1':"Part #1: An Orc's Axe", 'Part2':"Part #2: A Monk's Letter", 'Part3':"Part #3: A Dragon's Decree"}
var br_tutorials = {'Part1':'Parte #1: O Machado', 'Part2':'Parte #2: A Carta', 'Part3':"Parte #3: O Decreto"}
var de_tutorials = {'Part1':'T1: Die Axt des Orks', 'Part2':'T2: Die Brief der Monchin', 'Part3':"T3: Das Dekret des Drachens"}
var tutorials = [en_tutorials, br_tutorials, de_tutorials]

var results = ['Results', 'Resultados', 'Ergebnis']

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

func get_advanced_enabled():
	return advanced_enabled
	
func set_advanced_enabled(_new):
	advanced_enabled = _new

func find_in_group(requester, group, target_name):
	for node in requester.get_tree().get_nodes_in_group(group):
		if target_name == node.name:
			return node
