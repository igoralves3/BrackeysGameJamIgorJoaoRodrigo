extends HBoxContainer


@onready var questNameLabel = $Rep_HBoxContainer/QuestNameLabel
@onready var questRepLabel = $Rep_HBoxContainer/QuestRepResult
@onready var questGoldLabel = $Gold_HBoxContainer/QuestGoldResult

func setLabels(questName, repObtained, goldObtained):
	
	questNameLabel.text = questName
	questRepLabel.text = repObtained
	questGoldLabel.text = goldObtained
	
	if repObtained < 0:
		questRepLabel.modulate = Color("#FF4f34")
