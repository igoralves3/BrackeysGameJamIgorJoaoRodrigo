extends Control

const scenetoLoad = preload("res://Scenes/Main.tscn")

@onready var menuContainer = $MainMenuContainer

func _process(delta: float) -> void:
	while (menuContainer.modulate.a < 255):
		menuContainer.modulate.a += 0.15 * delta
		if get_tree():
			await get_tree().create_timer(1).timeout

func _on_play_game_button_pressed() -> void:
	SceneTransition.transition()
	SoundManager.pickButtonSFX(randi() % 3)
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_packed(scenetoLoad)


func _on_play_game_button_mouse_entered() -> void:
	$MainMenuContainer/MainMenuVBoxContainer/PlayButtonContainer/PlayGameButton/Label.self_modulate = Color("311006")


func _on_play_game_button_mouse_exited() -> void:
	$MainMenuContainer/MainMenuVBoxContainer/PlayButtonContainer/PlayGameButton/Label.self_modulate = Color("943f23")
