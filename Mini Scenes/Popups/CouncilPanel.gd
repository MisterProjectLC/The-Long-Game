extends 'res://Mini Scenes/Popups/popup.gd'

var is_leader = false
var dip_phrases
var vote_names
var vote = 0

onready var profiles = [$CurrentDecree/Voter1, $CurrentDecree/Voter2, 
						$CurrentDecree/Voter3, $CurrentDecree/Voter4]
onready var votes = [$CurrentDecree/Vote1, $CurrentDecree/Vote2, 
					$CurrentDecree/Vote3, $CurrentDecree/Vote4]

signal vote
signal propose
signal toggle_council

# ---------------- INITIAL ANIMATION ------------------
func _ready():
	invisible_list = [$CurrentDecree, $Action, $ActionDD, $Object, $ObjectDD, $AyeNayButton]
	setup(255, 297)


func _process(delta):
	processing(delta)

# ------------------ SETUP/INIT --------------------

# panel setup/initialization
func setup_panel(action, object, voters, vote_count, old_turn_order, turn_order, _players, proposal = []):
	# SETUP
	var language = Global.get_language()
	is_leader = (len(proposal) == 0)
	
	dip_phrases = [Global.council[language]['Co-op'], Global.council[language]['Attack']]
	vote_names = [Global.council[language]['Nay'], Global.council[language]['Null'], 
					Global.council[language]['Aye']]
	$AyeNayButton.language(language)
	
	# order players by turn order
	var players = _players.duplicate()
	for i in range(len(old_turn_order)):
		for j in range(i, len(players)):
			if old_turn_order[i] == players[j][0]:
				var helper = players[j]
				players[j] = players[i]
				players[i] = helper
				break
	
	# SETUP CURRENT DECREE ---------------------------
	if vote_count != [0, 0, 0]:
		$CurrentDecree.visible = true
		$CurrentDecree.text = Global.council[language]['Current']
		$CurrentDecree/For.text = str(vote_count[2])
		$CurrentDecree/Against.text = str(vote_count[0])
		$CurrentDecree/CurrentAction.text = dip_phrases[action].to_upper()
		$CurrentDecree/CurrentObject.text = object.to_upper()
		$CurrentDecree/Leader.readdy(players[0])
		if vote_count[0] < vote_count[2]:
			$CurrentDecree/Decree.text = Global.council[language]['Approved']
		else:
			$CurrentDecree/Decree.text = Global.council[language]['Rejected']
		
		# Votes
		for i in range(1, len(old_turn_order)):
			profiles[i-1].readdy(players[i])
			
			var vote = voters[old_turn_order[i]]
			votes[i-1].text = vote_names[vote+1]
			
			if i == 1:
				votes[i-1].text += ' (x2)'
	
	# SETUP DECREE PROPOSAL ---------------------------
	$NextDecree.text = Global.council[language]['Next']
	$DecreeProposal.text = Global.council[language]['Proposal']
	
	for player in players:
		if turn_order[0] == player[0]:
			$NextLeader.readdy(player)
			break
	
	# Leader setup
	if is_leader:
		# Groundwork setup
		$FinishButton.text = Global.council[language]['Propose'].to_upper()
		$Action.visible = true
		$Object.visible = true
		$ActionDD.visible = true
		$ObjectDD.visible = true
		
		# Setup proposal options (yes, I'm using the original _players order')
		for dip_phrase in dip_phrases:
			$ActionDD.add_item(dip_phrase)
		for player in _players:
			$ObjectDD.add_item(player[0])
		$NextAction.text = dip_phrases[0].to_upper()
		$NextObject.text = _players[0][0].to_upper()
		
	
	# Voter setup
	else:
		# Groundwork setup
		$FinishButton.text = Global.council[language]['Vote'].to_upper()
		$AyeNayButton.visible = true
		$Action.text = Global.panels[language]['Action']
		$Object.text = Global.panels[language]['Object']
		
		# Setup proposal
		$NextAction.text = dip_phrases[proposal[0]].to_upper()
		$NextObject.text = proposal[1].to_upper()


# PRESSING STUFF --------------------
func _on_ActionDD_item_selected(id):
	$NextAction.text = $ActionDD.get_item_text(id).to_upper()

func _on_ObjectDD_item_selected(id):
	$NextObject.text = $ObjectDD.get_item_text(id).to_upper()


func _on_AyeNayButton_stance_change(stance):
	vote = stance
	$AyeNayButton.set_visible(stance)


func _on_CloseButton_button_up():
	emit_signal('toggle_council', true)
	close()

func _on_FinishButton_button_up():
	if is_leader:
		emit_signal('propose', [$ActionDD.get_selected_id(),
							$ObjectDD.get_item_text($ObjectDD.get_selected_id())])
	else:
		emit_signal('vote', vote)
	
	emit_signal('toggle_council', false)
	close()

