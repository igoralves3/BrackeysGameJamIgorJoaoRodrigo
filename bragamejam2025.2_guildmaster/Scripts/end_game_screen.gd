extends Control

@onready var background = $BG_5

@onready var labelLost = $DisplayBackgroun/LabelLost
@onready var labelwon = $DisplayBackgroun/LabelWon

@onready var labelHighlightButton = $TextureButton/NinePatchRect/Label

const scenetoLoad = preload("res://Scenes/main_menu.tscn")


func _ready() -> void:
	
	if Globals.gameResult:
		labelwon.visible = true
		labelLost = false
	else:
		labelwon.visible = false
		labelLost = true
		
		
func _on_texture_button_mouse_entered() -> void:
	$TextureButton/NinePatchRect/Label.self_modulate = Color("c7a68f")

func _on_texture_button_mouse_exited() -> void:
	$TextureButton/NinePatchRect/Label.self_modulate = Color("ffffff")

func _on_texture_button_pressed() -> void:
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_packed(scenetoLoad)
	SoundManager.pickButtonSFX(randi() % 3)
