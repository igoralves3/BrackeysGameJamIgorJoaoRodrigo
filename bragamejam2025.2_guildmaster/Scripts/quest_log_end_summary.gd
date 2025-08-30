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
	else:		
		setEndLabels(q)


func questDoubleDownValuesAtt(q: quest):
	if q.success:
		randomize()
		var diceRoll: int = randi() % 100
		var probability: int = 15
		match (q.chanceOfSuccess):
			"EVEN ODDS":
				probability += 10
				pass
			"UNLIKELY":
				probability += 25
				pass
			"VERY UNLIKELY":
				probability += 50
				pass
		if diceRoll <= probability:
			#success
			pass
		else:
			#fail
			pass
	else:
		pass
## calculo sobreviventes ou nao da quest	


func _on_dd_confirm_button_pressed() -> void:
	DDChoiceContainer.visible = false
	DDContinueContainer.visible = true
	questDoubleDownValuesAtt(questlocal)
	$DDQuestContinueContainer/DoubleDownLabel.text = "- Quest: " + questlocal.questname + " has continued searching for greater riches and fame!"
	
	## NAO ESQUECER DE TIRAR DEPOIS DE IMPLEMENTAR CHANCE DE DD
	##questlocal.doubleDownTriggered = false


func _on_dd_return_button_pressed() -> void:
	DDChoiceContainer.visible = false
	Globals.ddEventResolvedRefreshView = true
	questlocal.doubleDownTriggered = false


func _on_dd_confirm_button_mouse_entered() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDConfirmButton/DDConfirmLabel.self_modulate = Color("3a8211")


func _on_dd_confirm_button_mouse_exited() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDConfirmButton/DDConfirmLabel.self_modulate = Color("256109")


func _on_dd_return_button_mouse_entered() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDReturnButton/DDReturnLabel.self_modulate = Color("ecb0ac")


func _on_dd_return_button_mouse_exited() -> void:
	$DDQuestChoiceContainer/HBoxContainer/DDReturnButton/DDReturnLabel.self_modulate = Color("b75857")
