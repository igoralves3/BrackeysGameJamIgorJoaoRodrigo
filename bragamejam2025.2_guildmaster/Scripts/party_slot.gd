extends TextureButton

@onready var advNameLabel = $LabelName
@onready var advRankLabel = $LabelRank
@onready var advPortrait = $PortraitSlot/Portrait

var localAdvReference = null

func _on_pressed() -> void:
	if(localAdvReference!=null):
		Globals.removeParty(localAdvReference)
		clearAdventurerDisplay()

func setAdventurer(adv: adventurer):
	localAdvReference = adv
	advNameLabel.text = adv.adv_name
	advPortrait.visible = true

func clearAdventurerDisplay():
	advNameLabel.text = "Empty"
	advRankLabel.visible = false
	advPortrait.visible = false
