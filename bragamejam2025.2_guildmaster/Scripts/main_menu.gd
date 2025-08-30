extends Control

const scenetoLoad = preload("res://Scenes/Components/Main.tscn")

@onready var play_game_button: TextureButton = $MainMenuContainer/MainMenuVBoxContainer/VBoxContainer/PlayGameButton
@onready var v_box_container: VBoxContainer = $MainMenuContainer/MainMenuVBoxContainer/VBoxContainer
@onready var line_edit: LineEdit = $MainMenuContainer/MainMenuVBoxContainer/GuildNameBoxContainer/LineEdit

func _on_play_game_button_pressed() -> void:
	
	if line_edit.text == "":
		line_edit.placeholder_text = "Type a name!"
	else:
		if ("guild" in line_edit.text) or ("clan" in line_edit.text) or ("Guild" in line_edit.text) or ("Clan" in line_edit.text):
			Globals.guildName = line_edit.text
		else:
			Globals.guildName = line_edit.text + " Guild"
		
		SceneTransition.transition()
		SoundManager.pickButtonSFX(randi() % 3)
		await SceneTransition.on_transition_finished
		get_tree().change_scene_to_packed(scenetoLoad)


func _on_line_edit_text_submitted(new_text: String) -> void:
	if line_edit.text == "":
		line_edit.placeholder_text = "Type a name!"
	else:
		if ("guild" in line_edit.text) or ("clan" in line_edit.text) or ("Guild" in line_edit.text) or ("Clan" in line_edit.text):
			Globals.guildName = line_edit.text
		else:
			Globals.guildName = line_edit.text + " Guild"
		
		SceneTransition.transition()
		SoundManager.pickButtonSFX(randi() % 3)
		await SceneTransition.on_transition_finished
		get_tree().change_scene_to_packed(scenetoLoad)
