extends Control


@onready var HighlightTexture = $PortraitSlot/SelectedHighlight
@onready var AddPartyButton = $AddButton

@onready var advCostLabel = $LabelCost
@onready var advRankLabel = $LabelRank
@onready var advNameLabel = $InfoContainer/LabelName

var adventurerLocal = null

func setAdventurer(adv: adventurer):
	adventurerLocal = adv
	advCostLabel.text = "Cost: " + str(adv.adv_fee) + " Gold"
	advRankLabel.text = "Rank: " + str(adv.rank)
	advNameLabel.text = adv.adv_name
	
	if adv.isAvaible:
		self.modulate = Color("#FFFFFF")
	else:
		self.modulate = Color("#565656")


func _on_mouse_entered() -> void:
	if adventurerLocal.isAvaible == true:
		$PortraitSlot/TextureRect.visible = true

func _on_mouse_exited() -> void:
	$PortraitSlot/TextureRect.visible = false

func _on_toggled(toggled_on: bool) -> void:
	if adventurerLocal.isAvaible == true:
		HighlightTexture.visible = !HighlightTexture.visible
		AddPartyButton.visible = !AddPartyButton.visible
	else:
		print("adventurer not avaible")


func _on_add_button_pressed() -> void:
	if adventurerLocal.isAvaible == true:
		Globals.addParty(adventurerLocal)
		self.modulate = Color("#565656")
		AddPartyButton.visible = false
	else:
		print("cannot add adverurer not avaible")
