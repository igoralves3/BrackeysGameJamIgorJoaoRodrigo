extends Control

@onready var guildLobby = $GuildLobby
@onready var endOfDay = $EndOfDay
@onready var questsSelection = $QuestManSelection
@onready var your_mission_panel = $YourMissionPanel


func _ready() -> void:
	SoundManager.pickBGMusic(randi() % 4)
	
	if Globals.day == 1:
		your_mission_panel.visible = true
	else:
		your_mission_panel.visible = false

func changeBookPage(page: String):
	guildLobby.visible = false
	endOfDay.visible = false
	questsSelection.visible = false
	
	match page:
		"endofday":
			endOfDay.startResolvingDayQuests()
			endOfDay.visible = true
		"lobby":
			guildLobby.visible = true
			guildLobby.attAvaibleQuestsDisplay()
		"quests":
			questsSelection.visible = true


func _on_confirm_button_pressed() -> void:
	your_mission_panel.visible = false
	SoundManager.pickButtonSFX(randi() % 3)
