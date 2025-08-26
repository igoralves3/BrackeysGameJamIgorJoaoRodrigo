extends TextureRect


@onready var logLabel = $VBoxContainer/LogLabel
@onready var repLabel = $VBoxContainer/HBoxContainer/RepResult/RepResultLabel
@onready var goldLabel = $VBoxContainer/HBoxContainer/GoldResult/GoldResultLabel


func _ready() -> void:
	setLabels()
	
func setLabels():
	pass


func _on_back_to_lobby_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
