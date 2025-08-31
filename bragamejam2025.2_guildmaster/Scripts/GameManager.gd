extends Control

@onready var guildLobby = $GuildLobby
@onready var endOfDay = $EndOfDay
@onready var questsSelection = $QuestManSelection


func _ready() -> void:
	SoundManager.pickBGMusic(randi() % 4)

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
