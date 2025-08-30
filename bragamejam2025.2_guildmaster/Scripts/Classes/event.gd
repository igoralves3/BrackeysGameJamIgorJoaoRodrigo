class_name event extends Node

var eventType = "DefaultEvent"

var aux1 = ""
var aux2 = ""
var aux3 = ""

var eventDesc = ""

func setEvent(eventT,a1,a2,a3):
	eventType = eventT
	aux1 = a1
	aux2 = a2
	aux3 = a3
	
	setDesc(eventType)

func setDesc(eventType):
	match eventType:
		## guild ranks up 
		## USAGE : var1 = GUILDNAME, var2 = GUILDTIER
		"Guild RankUp":
			eventDesc = "Congratulations to The " + aux1 + " for reachin the " + aux2 + " Tier"

	
		## great quest completed 	
		## USAGE : var1 = GUILDNAME, var2 = custom text for specified quest ex: giant spiders quest - defeating the eight legged manace!
		"Quest Completed":
			eventDesc = "Congratulations to The " + aux1 + " for" + aux2

			
		## great quest failed 	
		## USAGE : var1 = GUILDNAME, var2 = custom text for specified quest ex: giant spiders quest - perished in the webs of fate!	
		"Quest Failed":
			eventDesc = "Unfortunately the party sent by the " + aux1 + aux2

			
		## great quest failed 	
		## USAGE : var1 = GUILDNAME, var2 = ADV_DEAD_NAME
		"Adventurer Death":
			eventDesc = "Unfortunately the party sent by the " + aux1 +" came back with losses - "+ aux2 + " perished"

		## great quest failed 	
		## USAGE : var1 = GUILDNAME, var2 = ADV_RANKUP_NAME
		"Adventurer RankUp":
			eventDesc = "Congratulations the party sent by the " + aux1 +" foght and won - "+ aux2 + " became Stronger"
			
		"Custom Event":
			eventDesc = aux1
