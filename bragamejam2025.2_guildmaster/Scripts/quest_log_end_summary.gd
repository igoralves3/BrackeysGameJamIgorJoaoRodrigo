extends TextureRect


@onready var logLabel = $VBoxContainer/LogLabel
@onready var repLabel = $VBoxContainer/HBoxContainer/RepResult/RepResultLabel
@onready var goldLabel = $VBoxContainer/HBoxContainer/GoldResult/GoldResultLabel

	
func setLabels(failstate, charactersDead, repObtained, goldObtained):
	if failstate == true:
		logLabel.text = "quest falhou"
	else:
		logLabel.text = "quest sucesso"
		
	if charactersDead.size()>0:
		for cdeaths in charactersDead:
			logLabel.text = logLabel.text + " - " + charactersDead[0] + " morreu!"
	
	repLabel.text = repObtained
	goldLabel.text = goldObtained
