extends NinePatchRect


@onready var totalgold = $Gold/TotalGold
@onready var totalreptutation = $Reputation/Reputation
@onready var dayCounter = $DayCounter


func _process(delta: float) -> void:
	totalgold.text = str(Globals.totalgold)
	totalreptutation.text = str(Globals.totalrep)
	dayCounter.text = "Day " + str(Globals.day)
