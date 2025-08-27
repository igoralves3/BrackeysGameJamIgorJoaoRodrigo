extends TextureRect


@onready var GuildIcon = $GuildIcon
@onready var GuildNameLabel = $GuildName
@onready var GuildRepLabel = $RepLabel

func setLabel(guildName,GuildRep):
	match guildName:
		"White":
			##GuildIcon
			pass
		"White":
			##GuildIcon
			pass
		"White":
			##GuildIcon
			pass
	
	GuildNameLabel.text = guildName + " Guild"
	GuildRepLabel.text = str(GuildRep) + " Reputation"
	
	if(guildName==Globals.guildName):
		##GuildIcon
		self.modulate = Color("c7c7c7")
	
