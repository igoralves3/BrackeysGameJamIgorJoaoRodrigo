extends NinePatchRect


@onready var totalgold = $Gold/TotalGold
@onready var totalreptutation = $Reputation/Reputation
@onready var dayCounter = $DayCounter

@onready var guildNameLabel = $GuildNameLabel


func _process(delta: float) -> void:
	guildNameLabel.text = Globals.guildName
	totalgold.text = str(Globals.totalgold)
	totalreptutation.text = str(Globals.totalrep)
	dayCounter.text = "Day " + str(Globals.day)
