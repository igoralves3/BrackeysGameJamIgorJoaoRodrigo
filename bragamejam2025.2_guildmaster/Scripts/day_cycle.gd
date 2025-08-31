extends Control

@onready var daylabel = $DayTexture/DayLabel
@onready var backgrounds = [$MedievalTown, $MedievalTown2, $FantasyLandscape]

func _ready() -> void:
	Globals.endDay()
	backgrounds.pick_random().visible = true
	daylabel.text = "Day " + str(Globals.day)
	SoundManager.pickBGByName("res://Resources/Sounds/BGMusic1.wav")
	
	await (get_tree().create_timer(1.3).timeout)
	SoundManager.pickSFXByName("res://Resources/Sounds/FarmRoosterCockadoodledo.mp3")
	
func _on_continue_button_pressed() -> void:
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	#SoundManager.pickButtonSFX(randi() % 3)
	#var scenetoLoad = preload("res://Scenes/Components/Main.tscn")
	get_tree().change_scene_to_file("res://Scenes/Components/Main.tscn")	
