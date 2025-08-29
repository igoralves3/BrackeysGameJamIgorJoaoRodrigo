extends TextureRect


@onready var GuildIcon = $GuildIcon
@onready var GuildNameLabel = $GuildName
@onready var GuildRepLabel = $RepLabel


func setLabel(guildName,GuildRep):
	match guildName:
		"White Guild":
			GuildIcon.texture = preload("res://Resources/ShieldSprites/Transperent/Icon30.png")
			pass
		"Orange Guild":
			GuildIcon.texture = preload("res://Resources/ShieldSprites/Transperent/Icon14.png")
			pass
		"Yellow Guild":
			GuildIcon.texture = preload("res://Resources/ShieldSprites/Transperent/Icon18.png")
			pass
	
	GuildNameLabel.text = guildName
	GuildRepLabel.text = str(GuildRep) + " Reputation"
	
	if(guildName==Globals.guildName):
		##GuildIcon
		self.modulate = Color("c7c7c7")
	
