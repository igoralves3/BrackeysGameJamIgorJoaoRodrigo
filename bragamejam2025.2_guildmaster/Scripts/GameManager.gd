extends Control

@onready var guildLobby = $GuildLobby
@onready var endOfDay = $EndOfDay
@onready var questsSelection = $QuestManSelection


func changeBookPage(page: String):
	guildLobby.visible = false
	endOfDay.visible = false
	questsSelection.visible = false
	
	match page:
		"endofday":
			endOfDay.visible = true
		"lobby":
			guildLobby.visible = true
		"quests":
			questsSelection.visible = true
