extends TextureRect


@onready var logLabel = $VBoxContainer/LogLabel
@onready var repLabel = $VBoxContainer/HBoxContainer/RepResult/RepResultLabel
@onready var goldLabel = $VBoxContainer/HBoxContainer/GoldResult/GoldResultLabel


func _ready() -> void:
	setLabels()
	
func setLabels():
	pass
