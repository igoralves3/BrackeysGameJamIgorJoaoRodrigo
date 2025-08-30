extends TextureRect


@onready var logLabel = $LogLabel

func setLabel(e:event):
	logLabel.text = "- " + e.eventDescLst[randi() % e.eventDescLst.size()]
