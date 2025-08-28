extends TextureRect


@onready var difrepIcon = $DifRepIcon
@onready var descName = $QuestDescriptionLabel
var questLocal = null


func setNewQuest(q: quest):
	questLocal = q
	descName.text = str(q.questname)
	
	if q.onGoing == true:
		self.modulate = Color("#565656")
	else:
		self.modulate = Color("#FFFFFF")
	

func _on_go_button_pressed() -> void:
	if questLocal.onGoing == false:
		Globals.questAux = questLocal
		get_tree().get_root().get_node("Main").changeBookPage("quests")
		SoundManager.pickButtonSFX(randi() % 3)
	
