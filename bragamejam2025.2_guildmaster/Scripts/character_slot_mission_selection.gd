extends Control


@onready var HighlightTexture = $PortraitSlot/SelectedHighlight
@onready var AddPartyButton = $AddButton

@onready var advCostLabel = $LabelCost
@onready var advRankLabel = $PortraitSlot/TextureRect2/LabelRank
@onready var advNameLabel = $InfoContainer/LabelName
@onready var advPortrait = $PortraitSlot/Portrait
var adventurerLocal = null

func setAdventurer(adv: adventurer):
	adventurerLocal = adv
	advCostLabel.text = "Cost: " + str(adv.getAdventurerFee()) + " Gold"
	advRankLabel.text = "Rank: " + str(adv.rank)
	advPortrait.texture = load(adv.adv_portrait)
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
		SoundManager.pickClickSFX(randi()%3)
	else:
		print("cannot add adverurer not avaible")





func _on_add_button_mouse_entered() -> void:
	$AddButton/Arrow.texture = load("res://Resources/Sprites/UI_TravelBook_IconArrow01a-1PRESSED.png")
	$AddButton/Arrow.modulate = Color("d2b1b0")


func _on_add_button_mouse_exited() -> void:
	$AddButton/Arrow.texture = load("res://Resources/Sprites/UI_TravelBook_IconArrow01a.png")
	$AddButton/Arrow.modulate = Color("ffffff")
