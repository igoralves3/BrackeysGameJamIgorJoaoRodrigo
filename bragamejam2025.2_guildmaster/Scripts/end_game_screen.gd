extends Control

@onready var background = $BG_5

@onready var labelLost = $DisplayBackgroun/LabelLost
@onready var labelwon = $DisplayBackgroun/LabelWon

@onready var labelHighlightButton = $TextureButton/NinePatchRect/Label

const scenetoLoad = preload("res://Scenes/main_menu.tscn")


func _ready() -> void:
	
	if Globals.gameResult:
		labelwon.visible = true
		labelLost.visible = false
		labelwon.text = pickLabelWin()

	else:
		labelwon.visible = false
		labelLost.visible = true
		labelLost.text = pickLabelLost()

func pickLabelWin() -> String:
	var possibleLst: Array = [
		"You brought everyone to their knees... You're the chosen one... You win!",
		"You defeated them all... Hail to the supreme leader... You win!",
		"You achieved greateness... You're the Lord of the lands... You win!",
	]
	randomize()
	return possibleLst[randi() % possibleLst.size()]

func pickLabelLost() -> String:
	var possibleLst: Array = [
		"Your time is due, and you have failed... Now, your head is OURS... You lost!",
		"Due to your incompetence, your people abandoned you... Now, you're alone... You lost!",
		"Because of your sins, the gods had forsaken you and your guild... Better run before it's too late... You lost!",
		"You've failed our children, your family and your people... You're a failure... You lost!",
		"Thanks to you're negligence, the people rose up... Now you're head is on a pike... You lost!"
	]
	randomize()
	return possibleLst[randi() % possibleLst.size()]

func _on_texture_button_mouse_entered() -> void:
	$TextureButton/NinePatchRect/Label.self_modulate = Color("c7a68f")

func _on_texture_button_mouse_exited() -> void:
	$TextureButton/NinePatchRect/Label.self_modulate = Color("ffffff")

func _on_texture_button_pressed() -> void:
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_packed(scenetoLoad)
	SoundManager.pickButtonSFX(randi() % 3)
