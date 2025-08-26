extends TextureRect


@onready var difrepIcon = $DifRepIcon
@onready var descName = $QuestDescriptionLabel


func setNewQuest(questname: String):
	descName.text = str(questname)
	

func _on_go_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("quests")
