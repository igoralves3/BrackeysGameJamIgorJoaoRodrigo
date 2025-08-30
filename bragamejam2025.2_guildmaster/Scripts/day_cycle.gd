extends Control


@onready var daylabel = $DayTexture/DayLabel


func _ready() -> void:
	daylabel.text = "Day: " + str(Globals.day)
	
func _on_continue_button_pressed() -> void:
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	SoundManager.pickButtonSFX(randi() % 3)
	#var scenetoLoad = preload("res://Scenes/Components/Main.tscn")
	get_tree().change_scene_to_file("res://Scenes/Components/Main.tscn")	
