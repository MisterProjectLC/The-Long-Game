extends 'res://Scripts/popup.gd'

var letter_list = []
var players
var dip_phrases

var original_letter = ['Teste', '', 0, '']
var selected_letter = ['Teste', '', 0, '']
var selected_index = 0
var change_count = 0

const GREY = Color(75.0/255.0, 75.0/255.0, 75.0/255.0)
const BLACK = Color(0, 0, 0)

onready var option_buttons = [$Mention1, $Phrase, $Mention2]
onready var texts = [$AuthorText, $SubjectText, $ActionText, $ObjectText]

signal forged_letter

# ---------------- INITIAL ANIMATION ------------------
func _ready():
	setup(338, 222)


func _process(delta):
	processing(delta)

# ------------------ SETUP/INIT --------------------

func language(language):
	$CloseButton.text = Global.panels[language]['Close']
	$FinishButton.text = Global.panels[language]['Finish']
	$Subject.text = Global.panels[language]['Subject']
	$Action.text = Global.panels[language]['Action']
	$Object.text = Global.panels[language]['Object']
	$Object.text = Global.panels[language]['Author']


# panel setup/initialization
func setup_panel(_letter_list, _players, _dip_phrases):
	language(Global.get_language())
	
	# variables setup
	self.letter_list = _letter_list
	self.players = _players
	self.dip_phrases = _dip_phrases
	
	# setup letter list
	$LetterList.setup(letter_list)


# ------------------- PRESSING STUFF -----------------

# pressed the close button
func _on_CloseButton_button_up():
	close()


# pressed the Letter button
func _on_LetterButton_button_up(index):
	var letter = letter_list[index]
	var letter_text = dip_phrases[letter[2]]
	
	original_letter = letter.duplicate()
	original_letter[2] = letter_text
	
	selected_letter = letter.duplicate()
	selected_letter[2] = letter_text
	selected_index = index
	
	for option_button in option_buttons:
		option_button.clear()
	
	# setup dropdowns
	for i in range(len(players)):
		var player = players[i][0]
		
		$Mention1.add_item(player)
		if player == original_letter[1]:
			$Mention1.select(i)
		
		$Mention2.add_item(player)
		if player == original_letter[3]:
			$Mention2.select(i)
	
	for i in range(len(dip_phrases)):
		$Phrase.add_item(dip_phrases[i])
		if dip_phrases[i] == original_letter[2]:
			$Phrase.select(i)
	
	
	# setup text
	for i in range(len(texts)):
		texts[i].text = original_letter[i]
		texts[i].set("custom_colors/font_color", GREY)
	texts[0].set("custom_colors/font_color", BLACK)
	
	change_count = 0


# pressed the Finish button
func _on_FinishButton_button_up():
	selected_letter[2] = dip_phrases.find(selected_letter[2])
	emit_signal("forged_letter", selected_letter, selected_index, change_count)
	close()


func item_selected(id, i):
	var new_text = option_buttons[i-1].get_item_text(id)
	if texts[i].text == new_text:
		return
	
	# display
	if new_text == original_letter[i]:
		texts[i].set("custom_colors/font_color", GREY)
		change_count -= 1
	else:
		texts[i].set("custom_colors/font_color", BLACK)
		change_count += int(texts[i].text == original_letter[i])
	
	texts[i].text = new_text
	
	# update letter
	selected_letter[i] = new_text


func _on_Mention1_item_selected(id):
	item_selected(id, 1)

func _on_Phrase_item_selected(id):
	item_selected(id, 2)

func _on_Mention2_item_selected(id):
	item_selected(id, 3)

# --------------- HELPER FUNCTIONS -------------------


