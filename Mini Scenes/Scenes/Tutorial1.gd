extends "res://Mini Scenes/Scenes/Tutorial.gd"


export var these_players = [['Grolk', Texture], 
							['Daint', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Salem', 'Daint', 'Grolk']

# ------------------ SETUP ------------------------

# setup
func _ready():
	Global.set_advanced_enabled(false)
	game_setup(these_players, this_turn_order)
	ai_node('Grolk').set_relations(player_character, -1)
	
	setup_texts()
	advance_popup(true)


func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[('The Long Game is a diplomacy/intrigue game. Its main mechanic revolves around the Prisoner\'s Dilemma - ' +
			 'a game theory-related thought experiment.')],
			[('At every turn, every player chooses a Stance (Passive/Agressive) towards another player. To change Stances, ' +
			 'click on the button below a player\'s portrait.'), ('Change Stances, ' + 
			'clicking on the button below a player\'s portrait.')],
			[('Good. In general, the Passive Stance is better diplomatically and is beneficial for both players, ' + 
			'but it exposes the player to getting betrayed.')],
			[('On the other hand, the Agressive Stance is better for the individual, though it costs an Action ' + 
			'and creates resentment between players.')],
			[('The game lasts 6 rounds, and each player has 3 Actions per round. Aside from Attack, Actions can also ' + 
			'be spent on INVESTIGATION and DIPLOMACY.')],
			[('Investigations are great for obtaining crucial information on other players. ' +
			'To investigate someone, click on their portrait and then on INFO.')],
			['Investigate GROLK, THE ORC.', 'Investigate GROLK, THE ORC, clicking on his portrait and then on INFO.'],
			[('Grolk trusts you, but it is possible to know his opinion towards all other players as well. ' + 
			'Click on the portrait on the right side of the panel to change the other character.'), ('Click on the portrait ' + 
			'on the right side of the panel to change the other character.')],
			[('Good. So, Grolk trusts you, but doesn\'t trust Daint. That could be used as a weapon... '+
			'We\'ll see how to do that up ahead.')],
			[('Each NPC has a distinct personality, which can be examined by clicking on the button to the right of INFO. '+
			'Pay extra attention to the sections BROTHERHOOD and SIMPLE-MINDED.'), ('Click on the button to the ' + 
			'right of INFO. Pay extra attention to the sections BROTHERHOOD and SIMPLE-MINDED.')],
			[('Grolk always trusts his allies, and becomes Hostile to anyone that attacks them. With these traits, '+
			'it is possible to influence him to attack another person.')],
			[('The message that we want to give is that Daint will attack us. To do that, we\'ll use Diplomacy ' + 
			'to send a letter to Grolk.')],
			['Select the appropriate options on Grolk\'s Diplomacy Area and click Send.', ('Send a message saying that ' + 
			'Daint will attack us. Select the appropriate options on Grolk\'s Diplomacy Area and click Send.')],
			[('Grolk:\nMiserable traitorous dwarf! Brother, do not worry. My men will kill, cut and skin every ' +
			'little one they can find!')],
			['Good! Now, advance your turn.', 'Advance your turn.']]
		1:
			texts = [[''],
			[('The Long Game é um jogo de diplomacia e intriga. Sua principal mecânica gira em torno do Dilema do Prisioneiro - ' +
			 'um experimento mental sobre teoria de jogos.')],
			[('A todo turno, cada jogador escolhe uma Postura (Passiva/Agressiva) em relação a outro jogador. ' +
			 'Para trocar de Postura, clique no botão abaixo do perfil de um jogador.'), ('Troque de Postura, ' + 
			'clicando no botão abaixo do perfil de um jogador.')],
			[('Muito bem. No geral, a postura Passiva é mais diplomática e melhor para o grupo, ' + 
			'mas abre o jogador à possibilidade de ser traído.')],
			[('Por outro lado, a postura Agressiva é melhor para o indíviduo, ' + 
			'porém custa uma Ação e cria resentimento entre jogadores.')],
			[('O jogo dura 6 rounds, e cada jogador tem 3 Ações por round. Além de Ataque, Ações também podem ' + 
			'ser gastas com INVESTIGAÇÃO e DIPLOMACIA.')],
			[('Investigações são úteis para obter informação crucial sobre outros jogadores. ' +
			'Para investigar alguém, clique em seu retrato e depois em INFO.')],
			['Investigue GROLK, O ORC.', 'Investigue GROLK, O ORC, clicando em seu retrato e depois em INFO.'],
			[('Grolk confia em você, mas é possível saber sua opinião em relação à outros jogadores também. ' + 
			'Clique no retrato no lado direito do painel para mudar o outro jogador.'), ('Clique no retrato ' + 
			'no lado direito do painel para mudar o outro jogador.')],
			[('Muito bem. Então, Grolk confia em você, mas não confia em Daint. Isso pode ser usado como arma... '+
			'Veremos como fazer isso a seguir.')],
			[('Cada NPC tem uma personalidade distinta, que pode ser examinada clicando no botão ao lado direito de INFO. '+
			'Preste atenção especial nas seções IRMANDADE e SIMPLES.'), ('Clique no botão ao lado ' + 
			'direito de INFO. Preste atenção especial nas seções IRMANDADE e SIMPLES.')],
			[('Grolk sempre confia em seus aliados, e fica Hostil a qualquer um que atacá-los. Com essas características, '+
			'é possível influenciá-lo a atacar outra pessoa.')],
			[('A mensagem que queremos passar é de Daint irá nos atacar. Para isso, utilizaremos ' + 
			'a mecânica de Diplomacia, enviando uma carta para Grolk.')],
			['Para fazer isso, selecione as opções desejadas na Área de Diplomacia de Grolk e clique Enviar.', 
			('Envie uma mensagem dizendo que Daint irá nos atacar. Selecione as opções desejadas na Área de Diplomacia '+
			' de Grolk e clique Enviar.')],
			[('Grolk:\nAnão traidor miserável! Irmão, não se preocupe. Meus homens vão matar, cortar ' +
			'e desfiar todo pequeno que verem pela frente!')],
			['Muito bem! Agora, avance o turno.', 'Avance o turno.']]
		2:
			texts = [[''],
			[('The Long Game ist ein Spiel über Diplomatie und Intrigue. Seine Hauptmechanik dreht sich um den Gefangendilemma - ' +
			 'ein Gedankenexperiment mit Bezug zur Spieltheorie.')],
			[('In jeder Runde wählt jeder Spieler eine Position (Passiv/Aggressiv) gegenüber einem anderen Spieler. ' +
			'Um eine Position zu ändern, klicke auf den Button unter dem Porträt eines Spielers.'), ('Ändere deine Position, ' +
			'indem den Button unter dem Porträt eines Spielers klicken.')],
			[('Gut. Allgemein ist die passive Position diplomatischer und besser für beide beteiligte Spieler, aber lässt den ' +
			'Einzelne ungeschützt, wenn der andere Spieler ihn attackiert.')],
			[('Auf der anderen Seite, ist die agressive Position besser für den Einzelne, jedoch kostet sie eine Aktion' +
			'und erzeugt Ressentiment zwischen den Spielern.')],
			[('Das Spiel dauert 6 Runde und jeder Spieler hat 3 Aktionen pro Runde. Neben Angriff können Aktionen auch' +
			'mit NACHFORSCHUNGEN und DIPLOMATIE verbracht werden.')],
			[('Nachforschungen können entscheidende Information über andere Spieler enthüllen. Um jemand nachzuforschen, ' +
			'klicke auf sein Porträt und dann auf INFO.')],
			['Forsche GROLK, DER ORC nach.', 'Forsche GROLK, DER ORC nach, indem auf sein Porträt und dann auf INFO klicken.'],
			[('Grolk vertraut dir, aber es ist möglich, seine Meinung über andere Spieler auch zu entdecken. ' +
			'Klicke auf das Porträt in der rechten Seite des Bildschirms, um den anderen Spieler zu ändern.'), 
			('Klicke auf das Porträt in der rechten Seite des Bildschirms, um den anderen Spieler zu ändern.')],
			[('Gut. Also vertraut Grolk dir, aber nicht Daint. Wir können das gebrauchen... ' +
			'Wir werden gleich sehen, wie man das tun kann.')],
			[('Jeder NPC hat eine einzigartige Persönlichkeit, die geprüft werden kann, indem den Button rechts von ' +
			'Info klicken. Pass besonders auf die BRUDERSCHAFT und SIMPEL Sektionen auf.'), ('Klicke den Button rechts von ' +
			'Info. Pass besonders auf die BRUDERSCHAFT und SIMPEL Sektionen auf.')],
			[('Grolk glaubt immer seinen Verbündete, und wird feindlich gegen jeden, der einen von ihnen attackiert. Mit ' +
			'diesen Eigenschaften kann man ihn beeinflussen, eine andere Person anzugreifen.')],
			[('Die Botschaft, die wir senden wöllen, ist, dass Daint uns attackieren wird. Dafür werden wir Diplomatie ' +
			'gebrauchen, indem eine Nachricht an Grolk senden.')],
			['Um das zu tun, wähle die angemessene Optionen im Grolks Diplomatie-Bereich und klicke Senden.', 
			('Sende eine Nachricht, die sagt, dass Daint uns attackieren wird. Wähle die angemessene Optionen im' + 
			'Grolks Diplomatie-Bereich und klicke Senden.')],
			[('Grolk:\nKümmerlicher verräterischer Zwerg! Bruder, mach dir keine Sorgen. Meine Männer werden jeden ' +
			'Kleinen töten und abschlachten, den sie finden kann!')],
			['Gut! Jetzt beende deinen Zug.', 'Beende deinen Zug.']]


# ------------- SIGNAL STUFF -------------------------------

# Clicking on stance
func _on_SalemAI_changed_stance():
	if current_text == 2:
		advance_popup(true)

# Investigating Grolk
func _on_SalemAI_pressed_info(enemy_name):
	if enemy_name == 'Grolk':
		current_text = 7
		advance_popup(true)


func _on_SalemAI_closed_manual():
	print('closed manual ' + str(current_text))
	if current_text == 10:
		advance_popup(true)


func _on_SalemAI_pressed_opponent():
	if current_text == 8:
		advance_popup(true)


func _on_SalemAI_send_message(_character_name, package, recipient):
	if package == ['Daint',1,'Salem'] and recipient == 'Grolk':
		advance_popup(true)


func _on_SalemAI_advance_turn(_character_name):
	print(str(current_text))
	if current_text == 15:
		get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial2.tscn")

func advance_turn(_char):
	pass
