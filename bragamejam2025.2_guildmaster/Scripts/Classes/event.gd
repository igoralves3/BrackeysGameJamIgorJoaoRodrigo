class_name event extends Node

var eventType = "DefaultEvent"

var aux1 = ""
var aux2 = ""
var aux3 = ""

var eventDescLst: Array = []
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
			eventDescLst.append("Congratulations to The " + aux1 + " for reaching the " + aux2 + " Tier")
			eventDescLst.append("Thanks to leadership, " + aux1 + " reached " + aux2 + " Tier, Rejoice!")
			eventDescLst.append( aux1 + " just reached to the " + aux2 + " Tier, Hip, Hip, hooray!")

		## great quest completed 	
		## USAGE : var1 = GUILDNAME, var2 = custom text for specified quest ex: giant spiders quest - defeating the eight legged manace!
		"Quest Completed":
			eventDescLst.append("The migthy" + aux1 + " just completed " + aux2 + "!")

		## great quest failed 	
		## USAGE : var1 = GUILDNAME, var2 = custom text for specified quest ex: giant spiders quest - perished in the webs of fate!	
		"Quest Failed":
			eventDescLst.append(aux1 + " just failed " + aux2 + "!")

		## great quest failed 	
		## USAGE : var1 = GUILDNAME, var2 = ADV_DEAD_NAME
		"Adventurer Death":
			eventDescLst.append("Unfortunately a party sent by the " + aux1 +" came back with losses - "+ aux2 + " perished")
			eventDescLst.append("Thanks to " + aux1 + " more souls were lost!")
			eventDescLst.append("Rest in peace" + aux2 )

		## great quest failed 	
		## USAGE : var1 = GUILDNAME, var2 = ADV_RANKUP_NAME
		"Adventurer RankUp":
			eventDescLst.append("Wow!" + aux2 +" outdid himself and became stronger!")
			eventDescLst.append("The mighty " + aux2 + " carried it's party and became stronger!")
			eventDescLst.append("Due to the incredible influence of the" + aux1 + "'leadership, " + aux2 + " became stronger!")
			
		"Custom Event":
			eventDescLst.append(aux1)
