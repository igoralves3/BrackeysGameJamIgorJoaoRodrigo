extends Control

const scenetoLoad = preload("res://Scenes/Components/Main.tscn")

@onready var playerButtonContainer = $MainMenuContainer/MainMenuVBoxContainer/PlayButtonContainer/PlayGameButton
@onready var guildNameInputContainer = $MainMenuContainer/MainMenuVBoxContainer/PlayButtonContainer/InputFieldContainer

@onready var menuContainer = $MainMenuContainer

func _process(delta: float) -> void:
	while (menuContainer.modulate.a < 255):
		menuContainer.modulate.a += 0.15 * delta
		if get_tree():
			await get_tree().create_timer(1).timeout

func _on_play_game_button_pressed() -> void:
	
	playerButtonContainer.visible = false
	guildNameInputContainer.visible = true
	
	#SceneTransition.transition()
	#SoundManager.pickButtonSFX(randi() % 3)
	#await SceneTransition.on_transition_finished
	#get_tree().change_scene_to_packed(scenetoLoad)


func _on_play_game_button_mouse_entered() -> void:
	$MainMenuContainer/MainMenuVBoxContainer/PlayButtonContainer/PlayGameButton/Label.self_modulate = Color("311006")


func _on_play_game_button_mouse_exited() -> void:
	$MainMenuContainer/MainMenuVBoxContainer/PlayButtonContainer/PlayGameButton/Label.self_modulate = Color("943f23")


func _on_line_edit_text_submitted(new_text: String) -> void:
	
	if ("guild" in new_text) or ("clan" in new_text) or ("Guild" in new_text) or ("Clan" in new_text):
		Globals.guildName = new_text
	else:
		Globals.guildName = new_text + " Guild"
	
	SceneTransition.transition()
	SoundManager.pickButtonSFX(randi() % 3)
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_packed(scenetoLoad)
