extends TextureRect


@onready var logLabel = $LogLabel

func setLabel(e:event):
	logLabel.text = "- " + e.eventDesc
