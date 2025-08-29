extends TextureRect


@onready var difrepIcon = $DifRepIcon
@onready var descName = $QuestDescriptionLabel
var questLocal = null


func setNewQuest(q: quest):
	questLocal = q
	descName.text = str(q.questname) + " - " + str(q.gold) + " Gold, " + str(q.rep) + " Rep"
	
	
	if q.difficulty <= 10:
		difrepIcon.texture = load("res://Resources/Sprites/UI_TravelBook_IconStar01e.png")
	elif q.difficulty > 10 and q.difficulty <= 160:
		difrepIcon.texture = load("res://Resources/Sprites/UI_TravelBook_IconStar01c.png")
	elif q.difficulty > 160 and q.difficulty <= 1440:
		difrepIcon.texture = load("res://Resources/Sprites/UI_TravelBook_IconStar01a.png")
	else:
		difrepIcon.texture = load("res://Resources/Sprites/UI_TravelBook_IconStar01a-1.png.png")
	
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
	
