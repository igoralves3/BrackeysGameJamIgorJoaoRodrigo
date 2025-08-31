extends TextureRect


@onready var descName = $QuestDescriptionLabel
var questLocal = null

@onready var questRankLabel = $WaxSeal/WaxSealLabel


func setNewQuest(q: quest):
	questLocal = q
	
	questRankLabel.text = q.Rank	
	descName.text = str(q.questname) + " - " + str(q.gold) + " Gold, " + str(q.rep) + " Rep"
	
	
	if q.difficulty <= 10:
		questRankLabel.modulate = Color("864e24")
	elif q.difficulty > 10 and q.difficulty <= 160:
		questRankLabel.modulate = Color("c55a21")
	elif q.difficulty > 160 and q.difficulty <= 1440:
		questRankLabel.modulate = Color("711607")
	else:
		questRankLabel.modulate = Color("ce7726")
	
	if q.onGoing == true:
		self.modulate = Color("#565656")
		$GoButton.visible = false
	else:
		self.modulate = Color("#FFFFFF")
		
		
		$GoButton.visible = true
	

func _on_go_button_pressed() -> void:
	if questLocal.onGoing == false:
		Globals.questAux = questLocal
		get_tree().get_root().get_node("Main").changeBookPage("quests")
		SoundManager.pickButtonSFX(randi() % 3)
	
