extends TextureRect


@onready var logLabel = $VBoxContainer/LogLabel
@onready var repLabel = $VBoxContainer/HBoxContainer/RepResult/RepResultLabel
@onready var goldLabel = $VBoxContainer/HBoxContainer/GoldResult/GoldResultLabel

	
	
## nesse momento no tempo se a quest nao possui personagens nela entao falou	
func setLabels(q: quest):
	if q.success:
		repLabel.text = "+" + str(q.finalRep) + " Rep"
		logLabel.text = "Quest Complete!"
	else:		
		logLabel.text = "Quest failed!"
		repLabel.text = "-" + str(q.finalRep) + " Rep"
		repLabel.modulate = Color("ff3f21")
		
	if q.advDead.size()>0:
		for adv in q.advDead:
			logLabel.text = logLabel.text + " - " + adv.adv_name + " morreu!"
	
	goldLabel.text =  "+" + str(q.finalGold) + " Gold"
