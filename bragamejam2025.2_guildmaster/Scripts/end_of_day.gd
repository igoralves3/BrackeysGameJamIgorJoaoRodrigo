extends NinePatchRect




func _on_back_to_lobby_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	#passa o dia
	Globals.day = Globals.day + 1
