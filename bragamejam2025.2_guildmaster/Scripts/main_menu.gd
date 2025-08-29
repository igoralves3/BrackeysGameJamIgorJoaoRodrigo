extends Control

const scenetoLoad = preload("res://Scenes/Main.tscn")

func _on_play_game_button_pressed() -> void:
	SceneTransition.transition()
	SoundManager.pickButtonSFX(randi() % 3)
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_packed(scenetoLoad)
