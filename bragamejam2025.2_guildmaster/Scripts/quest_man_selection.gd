extends NinePatchRect



var adv_label = preload("res://Scenes/character_slot_mission_selection.tscn")
@onready var charactersContainer = $LeftPage_BG/CharacterSlotsContainer

## current quest infos
@onready var currQuestNameLabel = $RightPage_BG/QuestInfoPannel/QuestNameLabel
@onready var currQuestInfoLabel = $RightPage_BG/QuestInfoPannel/InfoLabel
@onready var currQuestRepLabel = $RightPage_BG/QuestInfoPannel/Reputation/Reputation
@onready var currQuestGoldLabel = $RightPage_BG/QuestInfoPannel/Gold/TotalGold

var has_been_visible_and_processed = false

func _process(delta):
	if visible and not has_been_visible_and_processed:
		run_once_on_visible()
		has_been_visible_and_processed = true

func run_once_on_visible():
	listCharacters()

func listCharacters():
	for adv in Globals.adventurers:
		#instancia uma nova quest label e coloca no container
		var advlabel = adv_label.instantiate()
		charactersContainer.add_child(advlabel)
		advlabel.setAdventurer(adv)



func _on_back_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	has_been_visible_and_processed = false


func _on_start_quest_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	has_been_visible_and_processed = false
