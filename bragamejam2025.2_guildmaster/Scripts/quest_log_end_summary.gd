extends TextureRect


@onready var logLabel = $QuestEndLogContainer/LogLabel
@onready var repLabel = $QuestEndLogContainer/HBoxContainer/RepResult/RepResultLabel
@onready var goldLabel = $QuestEndLogContainer/HBoxContainer/GoldResult/GoldResultLabel

@onready var QEndLogContainer = $QuestEndLogContainer
@onready var DDChoiceContainer = $DDQuestChoiceContainer
@onready var DDContinueContainer = $DDQuestContinueContainer

var questlocal = null
signal DDQuestSignalRefresh


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
	
	questlocal = q
	if q.doubleDownTriggered:
		DDChoiceContainer.visible = true
		$DDQuestChoiceContainer/DoubleDownLabel.text = "- Quest: " + questlocal.questname + " has found a hidden riches during the quest, the party is tired, but they can try to get the valuables at a increased risk, SHOULD THEY PROCEED?"
	if q.doubleDownTriggered == false and q.doubleDownNow == false:
		setEndLabels(q)


func questDoubleDownValuesAtt(q: quest):

	

	q.gold *= 2
	q.rep *= 2
	q.difficulty *= 2
	
## calculo sobreviventes ou nao da quest	


func _on_dd_confirm_button_pressed() -> void:
	
	questlocal.doubleDownTriggered = true
	questDoubleDownValuesAtt(questlocal)
	DDChoiceContainer.visible = false
	DDContinueContainer.visible = true
	QEndLogContainer.visible = false
	$DDQuestContinueContainer/DoubleDownLabel.text = "- Quest: " + questlocal.questname + " has continued searching for greater riches and fame!"


func _on_dd_return_button_pressed() -> void:
	
	questlocal.doubleDownTriggered = false
	Globals.ddEventResolvedRefreshView = true


func _on_dd_confirm_button_mouse_entered() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDConfirmButton/DDConfirmLabel.self_modulate = Color("3a8211")


func _on_dd_confirm_button_mouse_exited() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDConfirmButton/DDConfirmLabel.self_modulate = Color("256109")


func _on_dd_return_button_mouse_entered() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDReturnButton/DDReturnLabel.self_modulate = Color("ecb0ac")


func _on_dd_return_button_mouse_exited() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDReturnButton/DDReturnLabel.self_modulate = Color("b75857")
