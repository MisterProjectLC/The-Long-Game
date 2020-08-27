extends "res://Mini Scenes/Scenes/Tutorial.gd"

export var these_players = [['Zardri', Texture], 
							['Drakoth', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Drakoth','Salem', 'Zardri']

var checked = false
var attacked = false
var deltas = {"Zardri":0, "Drakoth":0, "Salem":0}

# ------------------ SETUP ------------------------

# setup
func _ready():
	Global.set_advanced_enabled(true)
	game_setup(these_players, this_turn_order, false)
	ai_node('Zardri').set_relations(player_character, 0)
	ai_node('Drakoth').set_relations(player_character, 0)
	
	setup_texts()
	advance_popup(true)
	
func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[("There's still another layer to THE LONG GAME: the Influence Track and the Council. ")],
			[("The Influence Track measures the amount of diplomatic power and influence a player has in the realm...")],
			[("The more Influence a player has, the earlier he acts in a turn and the more frequently they receive " +
			"attacks and letters. Additionally, the Track is also an important part of the Council.")],
			[("The Council works as follows: on every turn, the first player from the Influence " +
			"Track selects a Decree proposal. Decrees are made up of a STANCE and a TARGET.")],
			[("Following that, all other players vote on the proposal. The second player from the Track has its vote " +
			"count twice. If there are more Ayes than Nays, the Decree gets approved.")],
			[("When that happens, all players are forced to to take the selected stance against the selected target " +
			"next turn, making this a very powerful tool.")],
			[("Keep in mind, however, that both Influence and the Council may cause diplomatic relations to go down " +
			"or up depending on how you act and vote.")],
			[("With all that said, let's get to the Tutorial. For now, vote Aye on Drakoth's Proposal. We'll talk " +
			"more about him soon."), "Vote Aye on Drakoth's Proposal."],
			#^ 8
			[("Great. With the recent conflicts in the region, leaders in both high and low places have begun to watch " +
			"it more carefully in search of an opportunity to consolidate power.")],
			[("ZARDRI, THE GOBLIN is a chieftain from his tribe, and seems to be awaiting for an opportunity to strike.")],
			[("Zardri: Ghk! Human!! Yeah, you, listen: this Drakoth guy, he seems strong, doesn't he? Ye, well, " +
			"what if we stab him hard in the back, alright? Ye, no, not now, but, you know, later.")],
			[("DRAKOTH, THE DRAGONBORN, on the other hand, has claimed to come to demonstrate the power of the empire's " +
			"army and end the unrest that's been causing all this bloodshed.")],
			[("Drakoth: Greetings. I'm Drakoth, first son of Maugr, High General of the Empire, and unquestionable " +
			"Heir to the Throne. Are you the one behind this conflict? No? Well, we shall see.")],
			[("Drakoth: For now, I will enforce the peace. But I know, or at least hope, we'll meet in the battlefield. " +
			"Then, you and that green vermin will both... heh, I won't ruin the surprise.")],
			[("For now, investigate Drakoth and look into his relation with Zardri."), 
			"Investigate Drakoth and look into his relation with Zardri."],
			#^ 15
			[("So, Drakoth is hostile against Zardri. Let's advance the turn for now and see where that leads us."), 
			"Advance your turn."],
			[("Alright! Again, Drakoth is in power. This time, we'll vote Null. Voting Aye will anger Zardri, while " +
			"voting Nay will anger Drakoth. We should stay neutral for now."), "Vote Null on Drakoth's proposal."],
			[("Okay. This turn, we'll make some Influence alterations. Click the Influence button next to Forgery."), 
			"Click the Influence button next to Forgery."],
			#^ 18
			[("Players are displayed by influence rank, and the Influence alterations to each are shown to the right of " +
			"each profile.")],
			[("So, Zardri has reduced Drakoth's Influence. While doing so will help us get the throne, it will " +
			"also worsen our relations with Drakoth. We must wait for the right moment.")],
			[("What we will do instead is increase our own Influence, and Zardri's, too - the explanation for this will " +
			"come later. Increase our own Influence by 1 and Zardri's by 2 and press Finish."), 
			"Increase our own Influence by 1 and Zardri's by 2 and press Finish."],
			#^ 21
			[("Now, advance your turn."), "Advance your turn."],
			[("Again, vote Null on the proposal."), "Vote Null on the proposal."],
			[("This is the time. Last turn, we setup Zardri to become our second-in-command. Now, use 2 Actions to reduce " +
			"Drakoth's Influence, and one to attack Drakoth."), 
			"Use 2 Actions to reduce Drakoth's Influence, and one to attack Drakoth."],
			#^ 24
			[("Excellent. Let's advance the turn."), "Advance your turn."],
			[("Done! You're in power, Zardri is second. You may choose any Decree you want, but we recommend " +
			"attacking Drakoth. Anything else will get rejected by the others.")],
			[("Info about their Voting Policies can be checked by clicking the button to the right of Info. When you're done, " +
			"advance your turn."), "When you're done, advance your turn."],
			[("")]
			#^ 27
			]
		1:
			texts = [[''],
			[("Existe, ainda, mais uma camada em THE LONG GAME: a Ordem do Trono e o Conselho.")],
			[("A Ordem do Trono mede a quantidade de poder diplomático e influência que um jogador tem no reino.")],
			[("Quanto mais Influência um jogador tiver, o mais cedo ele age no turno e com mais frequência ele recebe " +
			"ataques e cartas. Adicionalmente, a Ordem também é parte importante do Conselho.")],
			[("O Conselho funciona da seguinte forma: a todo turno, o primeiro jogador da Ordem do " +
			"Trono seleciona uma proposta de Decreto. Decretos são formados de uma POSTURA e um ALVO.")],
			[("Depois disso, todos os outros jogadores votam na proposta. O voto do segundo jogador da Ordem vale o " +
			"dobro. Se houverem mais Sim do que Não, o Decreto é aprovado.")],
			[("Quando isso acontece, todos os jogadores no próximo turno são forçados a tomarem a postura selecionada " +
			"contra o alvo selecionado. Isto é, naturalmente, uma ferramenta poderosa.")],
			[("Tenha em mente, porém, que tanto Influência quanto o Conselho podem ter repercussões diplomáticas " +
			"dependendo da forma de como você age e vota.")],
			[("Com isso dito, vamos ao Tutorial. Por agora, vote Sim para a proposta de Drakoth. Falaremos mais sobre " +
			"ele daqui a pouco."), "Vote Sim para a proposta de Drakoth."],
			#^ 8
			[("Ótimo. Com os conflitos recentes na região, líderes de diferentes círculos começaram a prestar mais " +
			"atenção, procurando oportunidades para consolidar seus poderes.")],
			[("ZARDRI, O GOBLIN é o chefe de sua tribo, e parece estar esperando por uma oportunidade para atacar.")],
			[("Zardri: Ghk! Humano! É, você, ouve: esse Drakoth aí, ele parece fortão, né não? É, ó, e se a " +
			"gente dar uma bela dumas facada nas costa dele, hein? É, tipo, depois, não agora.")],
			[("DRAKOTH, O DRACONIANO, por outro lado, afirma que veio para demonstrar o poder do exército do império e " +
			"acabar com o cerne de todo o derramamento de sangue.")],
			[("Drakoth: Saudações. Eu sou Drakoth, filho de Maugr, Alto General do Império, e inquestionável herdeiro" +
			"do Trono. É você quem está por trás desse conflito? Não...? Bem, veremos.")],
			[("Drakoth: Por agora, eu vou impor a paz. Mas eu sei, ou pelo menos espero, que nos veremos na batalha." +
			"Aí, você e aquele verme verde vão ambos... heh, não vou arruinar a surpresa.")],
			[("Por enquanto, investigue Drakoth e veja sua relação com Zardri."), 
			"Investigue Drakoth e veja sua relação com Zardri."],
			#^ 15
			[("Então Drakoth está hostil contra Zardri. Vamos avançar o turno por agora e ver o que acontece."), 
			"Avance o turno."],
			[("Ok. Drakoth está novamente no poder. Dessa vez, vote Nulo. Votar Sim vai irritar Zardri, enquanto que " +
			"votar Não vai irritar Drakoth. Devemos nos manter neutros por agora."), "Vote Nulo na proposta de Drakoth."],
			[("Muito bem. Neste turno, faremos algumas alterações de Influência. Clique no botão de Influência, ao lado " +
			"de Falsificação."), 
			"Clique no botão de Influência, ao lado de Falsificação."],
			#^ 18
			[("Players are displayed by influence rank, and the Influence alterations to each are shown to the right of " +
			"each profile.")],
			[("So, Zardri has reduced Drakoth's Influence. While doing so will help us get the throne, it will " +
			"also worsen our relations with Drakoth. We must wait for the right moment.")],
			[("What we will do instead is increase our own Influence, and Zardri's, too - the explanation for this will " +
			"come later. Increase our own Influence by 1 and Zardri's by 2 and press Finish."), 
			"Increase our own Influence by 1 and Zardri's by 2 and press Finish."],
			#^ 21
			[("Now, advance your turn."), "Advance your turn."],
			[("Again, vote Null on the proposal."), "Vote Null on the proposal."],
			[("This is the time. Last turn, we setup Zardri to become our second-in-command. Now, use 2 Actions to reduce " +
			"Drakoth's Influence, and one to attack Drakoth."), 
			"Use 2 Actions to reduce Drakoth's Influence, and one to attack Drakoth."],
			#^ 24
			[("Excellent. Let's advance the turn."), "Advance your turn."],
			[("Done! You're in power, Zardri is second. You may choose any Decree you want, but we recommend " +
			"attacking Drakoth. Anything else will get rejected by the others.")],
			[("Info about their Voting Policies can be checked by clicking the button to the right of Info. When you're done, " +
			"advance your turn."), "When you're done, advance your turn."],
			[("")]
			#^ 27
			]
		2:
			texts = [[''],
			[("EDRAELE, THE ELVEN QUEEN has arrived with her armies, claiming to have come to support Thoren's " +
			"campaign. You suspect, however, that she's here for power and influence.")],
			[("Now, you'll have to play a match against these three. Here's a summary of each opponent:")],
			[("Obrulena is a pacifist monk, and as such only enters combat when there's no other option. Additionally, " +
			"she frequently tries to mediate hostilities, ending them via diplomacy.")],
			[("Kallysta is suspicious of powerful figures and always tries to undermine strong alliances. If you have " +
			"many allies, be wary of her.")],
			[("Finally, Edraele is a cunning and intelligent leader, piting players against each other " +
			"and adjusting her behavior according to her opinion of the player character.")],
			[("Good luck.")],
			]


# ------------- SIGNAL STUFF -------------------------------


func advance_turn(_char):
	_advance_turn(_char)


func _on_Tutorial5_received_vote(voter, vote):
	if (current_text == 8 and vote == 1) or ((current_text == 17 or current_text == 23) and vote == 0):
		advance_popup(true)


func _on_SalemAI_pressed_info(enemy_name):
	if current_text == 15 and enemy_name == 'Drakoth':
		checked = true


func _on_SalemAI_pressed_opponent():
	if current_text == 15:
		if checked:
			advance_popup(true)


func _on_SalemAI_advance_turn(_char):
	if current_text == 16 or current_text == 22 or current_text == 25:
		advance_popup(true)
	elif current_text == 27:
		get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial6.tscn")


func _on_SalemAI_pressed_influence():
	if current_text == 18:
		advance_popup(true)


func _on_Tutorial5_changed_influence(change, character_name, target):
	if current_text == 21:
		deltas[target] += change
		
		if deltas["Zardri"] == 2 and deltas["Salem"] == 1:
			advance_popup(true)
	elif current_text == 24:
		deltas[target] += change
		
		if deltas["Drakoth"] == -2 and attacked:
			advance_popup(true)


func _on_SalemAI_changed_stance():
	if current_text == 24:
		attacked = true
		if deltas["Drakoth"] == -2 and attacked:
			advance_popup(true)
