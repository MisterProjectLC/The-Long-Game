extends "res://Mini Scenes/Scenes/Tutorial.gd"


export var these_players = [['Obrulena', Texture], 
							['Kallysta', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Salem', 'Kallysta', 'Obrulena']

var checked = false

# ------------------ SETUP ------------------------

# setup
func _ready():
	game_setup(these_players, this_turn_order)
	ai_node('Obrulena').set_relations(player_character, 0)
	ai_node('Kallysta').set_relations(player_character, -1)
	ai_node('Kallysta').set_relations("Obrulena", -1)
	$SalemAI.set_portrait_visibility("Obrulena", false)
	$SalemAI.set_portrait_visibility("Kallysta", false)
	
	setup_texts()
	advance_popup(true)


func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[("In THE LONG GAME, Diplomacy doesn't only involve writing letters: players may also resend letters " +
			"from others, too.")],
			[('After the battles in the plains between Grolk and Thoren, the conflict quickly attracted the attention ' +
			'of other leaders near the region.')],
			['OBRULENA, THE LOXODON came to try to bring peace and conciliation to the realm.'],
			[('Meanwhile, KALLYSTA, THE TIEFLING seems to be preparing herself for the arrival of someone else, ' + 
			'though the specifics remain unknown.')],
			["Despite their many differences, the two seem to trust each other. Let's change that."],
			[('For now, simply advance your turn. In the next turn, Obrulena will send you a message declaring peace.'),
			 'Advance your turn.'],
			[('So, Obrulena has sent you a message. Once you are done reading it, click the Forgery button to get started ' +
			'on our deception campaign.'), 'Click the Forgery button.'],
			[('Our objective here is to create distrust between Obrulena and Kallysta. Kallysta has the PARANOID trait, ' +
			'meaning that any sign of hostility against herself will enrage her.')],
			[("As such, we'll modify this letter to make it look like a threat against Kallysta. Select Obrulena's letter on " +
			'the left side of the screen and alter it on the right side of it.')],
			[("Each alteration costs one Action. You'll have to make two alterations to this letter - one in the second part " +
			'of the message, and one in the third part. Good luck.'), ("Modify Obrulena's letter to make it look like a " + 
			"threat against Kallysta. You'll have to modify the second and third part of it.")],
			[("Great! Now, we only need to send it. Open Kallysta's panel and click on the button to the right of Send."),
			"Open Kallysta's panel and click on the button to the right of Send."],
			[("Select Obrulena's letter on the left side of the screen and press the Send button to use your last Action " +
			"and send the forged message to Kallysta."), ("Select Obrulena's letter and press the Send button  " +
			"to send it to Kallysta.")],
			[("And... done. Now, advance your turn to see the fruits of our deception."),
			"Advance your turn."],
			[("So far, so good. Investigate one of them and click the portrait on the right to see what transpired between " +
			"the two former allies."), ("Investigate one of them and check what transpired between Obrulena and Kallysta.")],
			[("As you can see, Kallysta has attacked Obrulena, thinking that she was going to attack first.")],
			[("An advantage of forgery is that, as far as they know, you weren't even involved! If you had instead lied to " +
			"Kallysta directly, she'd get Enraged at you for giving her false information.")],
			[("Advance your turn one final time - the unknown person Kallysta was expecting will finally arrive. ")],
			]
		1:
			texts = [[''],
			[('Em THE LONG GAME, Diplomacia não se resume a apenas escrever cartas: jogadores podem re-enviar ' +
			'as cartas de outros, também.')],
			[('Depois das batalhas nas planícies entre Grolk e Thoren, a atenção de outros líderes foi atraída ' +
			'para o local.')],
			[('OBRULENA, A LOXODON veio para tentar trazer paz e conciliação à região.')],
			[('Enquanto isso, KALLYSTA, A TIEFLING parece estar se preparando para a chegada de outra pessoa, ' +
			'porém não deu nenhuma indicação de quem esta pessoa seria.')],
			["Apesar de suas diferenças, as duas parecem confiar uma na outra. Vamos mudar isso."],
			[('Por enquanto, apenas avance seu turno. No turno seguinte, Obrulena irá enviar uma mensagem para ' +
			'você, declarando paz.'), 'Avance seu turno.'],
			[('Então, Obrulena te enviou uma mensagem. Quando tiver terminado de lê-la, clique no botão de Falsificação ' +
			'para começar nossas enganações.'), 'Clique no botão de Falsificação.'],
			[('Nosso objetivo aqui é criar desconfiança entre Obrulena e Kallysta. Kallysta tem a característica PARANOIA, ' +
			'o que faz com que todo sinal de hostilidade contra ela a enraiveça.')],
			[("Assim, nós vamos modificar esta carta para fazê-la parecer como uma ameaça contra Kallysta. Selecione a carta " +
			"de Obrulena no lado esquerdo da tela e altere-a no lado direito.")],
			[("Cada alteração custa uma Ação. Você terá de fazer duas alterações nesta carta - uma na segunda parte da " +
			"mensagem, e outra na terceira. Boa sorte."), ("Modifique a carta de Obrulena para fazê-la parecer uma ameaça " +
			"contra Kallysta. Você terá de modificar a segunda e a terceira parte dela.")],
			[("Ótimo! Agora, precisamos apenas enviá-la. Abra o painel de Kallysta e clique no botão ao lado direito de Enviar."),
			"Abra o painel de Kallysta e clique no botão ao lado direito de Enviar."],
			[("Selecione a carta de Obrulena no lado direito da tela e pressione Enviar para usar sua última Ação e enviar " +
			"a carta modificada para Kallysta."), ("Selecione a carta de Obrulena e pressione Enviar para enviá-la para Kallysta.")],
			[("E... pronto. Agora, avance o turno e veja os frutos de nossos planos."),"Avance o turno."],
			[("Até agora, tudo bem. Investigue uma delas e clique no retrato no lado direito do painel para ver o que ocorreu " +
			"entre as duas líderes."), ("Investigue uma delas e veja o que ocorreu entre Obrulena e Kallysta.")],
			[("Como você pode ver, Kallysta atacou Obrulena pensando que ela iria atacar primeiro.")],
			[("Uma vantagem da Falsificação é que, até onde elas sabem, você nem está envolvido! Se você tivesse mentido " +
			"diretamente para a Kallysta, ela ficaria Revoltada com você por ter passado informação falsa.")],
			[("Avance o turno uma última vez - a pessoa desconhecida que Kallysta estava esperando finalmente chegará.")],
			]
		2:
			texts = [[''],
			[("In THE LONG GAME, Diplomacy doesn't only involve writing letters: players may also resend letters " +
			"from others, too.")],
			[('After the battles in the plains between Grolk and Thoren, the conflict quickly attracted the attention ' +
			'of other leaders near the region.')],
			['OBRULENA, THE LOXODON came to try to bring peace and conciliation to the realm.'],
			[('Meanwhile, KALLYSTA, THE TIEFLING seems to be preparing herself for the arrival of someone else, ' + 
			'though the specifics remain unknown.')],
			["Despite their many differences, the two seem to trust each other. Let's change that."],
			[('For now, simply advance your turn. In the next turn, Obrulena will send you a message declaring peace.'),
			 'Advance your turn.'],
			[('So, Obrulena has sent you a message. Once you are done reading it, click the Forgery button to get started ' +
			'on our deception campaign.'), 'Click the Forgery button.'],
			[('Our objective here is to create distrust between Obrulena and Kallysta. Kallysta has the PARANOID trait, ' +
			'meaning that any sign of hostility against herself will enrage her.')],
			[("As such, we'll modify this letter to make it look like a threat against Kallysta. Select Obrulena's letter on " +
			'the left side of the screen and alter it on the right side of it.')],
			[("Each alteration costs one Action. You'll have to make two alterations to this letter - one in the second part " +
			'of the message, and one in the third part. Good luck.'), ("Modify Obrulena's letter to make it look like a " + 
			"threat against Kallysta. You'll have to modify the second and third part of it.")],
			[("Great! Now, we only need to send it. Open Kallysta's panel and click on the button to the right of Send."),
			"Open Kallysta's panel and click on the button to the right of Send."],
			[("Select Obrulena's letter on the left side of the screen and press the Send button to use your last Action " +
			"and send the forged message to Kallysta."), ("Select Obrulena's letter and press the Send button  " +
			"to send it to Kallysta.")],
			[("And... done. Now, advance your turn to see the fruits of our deception."),
			"Advance your turn."],
			[("So far, so good. Investigate one of them and click the portrait on the right to see what transpired between " +
			"the two former allies."), ("Investigate one of them and check what transpired between Obrulena and Kallysta.")],
			[("As you can see, Kallysta has attacked Obrulena, thinking that she was going to attack first.")],
			[("An advantage of forgery is that, as far as they know, you weren't even involved! If you had instead lied to " +
			"Kallysta directly, she'd get Enraged at you for giving her false information.")],
			[("Advance your turn one final time - the unknown person Kallysta was expecting will finally arrive. ")],
			]

# ------------- SIGNAL STUFF -------------------------------

func advance_turn(_char):
	_advance_turn(_char)


func gain_influence(character_name):
	_gain_influence(character_name)


func lose_influence(character_name):
	_lose_influence(character_name)


func _on_SalemAI_advance_turn(_character_name):
	if current_text == 13:
		advance_popup(true)
	elif current_text == 17:
		get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial4.tscn")


func _on_Tutorial3_advanced_popup():
	if current_text == 3:
		$SalemAI.set_portrait_visibility("Obrulena", true)
	elif current_text == 4:
		$SalemAI.set_portrait_visibility("Kallysta", true)


func _on_SalemAI_closed_report():
	if current_text == 6:
		advance_popup(true)


func _on_SalemAI_opened_forgery():
	if current_text == 7:
		advance_popup(true)


func _on_SalemAI_forged_letter(letter):
	if (letter[1] == 'Obrulena' and letter[2] == 1 
	and letter[3] == 'Kallysta' and current_text == 10):
		advance_popup(true)


func _on_SalemAI_pressed_letters(enemy_name):
	if enemy_name == "Kallysta" and current_text == 11:
		advance_popup(true)


func _on_SalemAI_send_message(sender, package, recipient):
	if sender == "Obrulena" and current_text == 12:
		advance_popup(true)


func _on_SalemAI_pressed_info(_panel):
	if current_text == 14:
		if !checked:
			checked = true
		else:
			advance_popup(true)

func _on_SalemAI_pressed_opponent():
	if current_text == 14:
		if !checked:
			checked = true
		else:
			advance_popup(true)
