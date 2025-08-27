extends TextureRect


@onready var logLabel = $VBoxContainer/LogLabel
@onready var repLabel = $VBoxContainer/HBoxContainer/RepResult/RepResultLabel
@onready var goldLabel = $VBoxContainer/HBoxContainer/GoldResult/GoldResultLabel

	
	
## nesse momento no tempo se a quest nao possui personagens nela entao falou	
func setLabels(q: quest):
	if q.questAdventurers.size()==0:
		logLabel.text = "quest falhou"
	else:
		logLabel.text = "quest sucesso"
		
	if q.advDead.size()>0:
		for adv in q.advDead:
			logLabel.text = logLabel.text + " - " + adv.name + " morreu!"
	
	repLabel.text = str(q.finalRep)
	goldLabel.text = str(q.finalGold)
