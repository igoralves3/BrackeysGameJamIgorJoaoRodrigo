extends HBoxContainer


@onready var questNameLabel = $Rep_HBoxContainer/QuestNameLabel
@onready var questRepLabel = $Rep_HBoxContainer/QuestRepResult
@onready var questGoldLabel = $Gold_HBoxContainer/QuestGoldResult

func setLabels(q: quest):
	
	questNameLabel.text = str(q.name)
	questRepLabel.text = str(q.finalRep)
	questGoldLabel.text = str(q.finalGold)
	
	if q.finalRep < 0:
		questRepLabel.modulate = Color("#FF4f34")
