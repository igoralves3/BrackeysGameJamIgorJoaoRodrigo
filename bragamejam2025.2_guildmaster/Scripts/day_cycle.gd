extends Control


@onready var daylabel = $DayTexture/DayLabel


func _ready() -> void:
	daylabel.text = "Day: " + str(Globals.day)
	
func _on_continue_button_pressed() -> void:

	const scenetoLoad = preload("res://Scenes/day_cycle.tscn")
	get_tree().change_scene_to_packed(scenetoLoad)
	
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	SoundManager.pickButtonSFX(randi() % 3)
