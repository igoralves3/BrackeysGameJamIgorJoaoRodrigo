extends TextureRect


@onready var logLabel = $QuestEndLogContainer/LogLabel
@onready var repLabel = $QuestEndLogContainer/HBoxContainer/RepResult/RepResultLabel
@onready var goldLabel = $QuestEndLogContainer/HBoxContainer/GoldResult/GoldResultLabel

@onready var QEndLogContainer = $QuestEndLogContainer
@onready var DDChoiceContainer = $DDQuestChoiceContainer
@onready var DDContinueContainer = $DDQuestContinueContainer


func setEndLabels(q: quest):
	
	QEndLogContainer.visible = true
	
	if q.success:
		repLabel.text = "+" + str(q.finalRep) + " Rep"
		logLabel.text = " - Quest " +q.questname + " Complete!"
	else:		
		logLabel.text = " - Quest " +q.questname + " Failed!"
		repLabel.text = "-" + str(q.finalRep) + " Rep"
		repLabel.modulate = Color("ff3f21")
		
	if q.advDead.size()>0:
		for adv in q.advDead:
			logLabel.text = logLabel.text + " - " + adv.adv_name + " morreu!"
	
	goldLabel.text =  "+" + str(q.finalGold) + " Gold"
	
## nesse momento no tempo se a quest nao possui personagens nela entao falou	
func setLabels(q: quest):
	if q.doubleDownaux>0:
		DDChoiceContainer.visible = true
	else:		
		setEndLabels(q)

func _on_dd_confirm_button_pressed() -> void:
	DDChoiceContainer.visible = false
	DDContinueContainer = true


func _on_dd_return_button_pressed() -> void:
	DDChoiceContainer.visible = false
	QEndLogContainer.visible = true
