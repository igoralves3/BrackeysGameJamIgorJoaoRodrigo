extends HBoxContainer


@onready var questNameLabel = $Rep_HBoxContainer/QuestNameLabel
@onready var questRepLabel = $Rep_HBoxContainer/QuestRepResult
@onready var questGoldLabel = $Gold_HBoxContainer/QuestGoldResult

func setLabels(q: quest):
	if q.success:
		questRepLabel.text = "+" + str(q.finalRep) + " Rep"
	else:		
		questRepLabel.text = "-" + str(q.finalRep) + " Rep"
		questRepLabel.modulate = Color("ff3f21")
		
	questNameLabel.text = str(q.questname) + ": "
	questGoldLabel.text = "+" + str(q.finalGold) + " Gold"
	
	if q.finalRep < 0:
		questRepLabel.modulate = Color("#FF4f34")
