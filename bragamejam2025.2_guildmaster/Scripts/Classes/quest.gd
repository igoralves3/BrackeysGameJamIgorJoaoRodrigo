class_name quest extends Node

## after multipliers when quest is done
var finalGold = 0
var finalRep = 0
var success: bool

## auxiliar to show logs after
var advDead: Array[adventurer]

## contador usado para verificação da mecanica de double down, sendo aqui quantas vezes a quest foi continuada
## quando fizer double down e incrementar o contador, lembrar de ajustar a rep e o gold deacordo
var doubleDownTriggered = false


# VERY LIKELY, LIKELY, EVEN ODDS, UNLIKELY, VERY UNLIKELY 
var chanceOfSuccess = "EVEN ODDS"

## quest endend aux
var onGoing = false

var rep = 100
var gold = 100
var questname = "Test Quest"
var questAdventurers: Array[adventurer]

var questinfo = "Quest info here"

var Rank = "F"
var difficulty = 1

func setQuest(qrep,qgold,qname,qdiff):
	rep = qrep
	gold = qgold
	questname = qname
	difficulty = qdiff
	
	## default no multiplier final rewards
	finalGold = qgold
	finalRep = qrep
	
	if qdiff < 10:
		Rank = "F"
	elif qdiff >= 10 and qdiff < 40:
		Rank = "E"
	elif qdiff >= 40 and qdiff < 160:
		Rank = "D"	
	elif qdiff >= 160 and qdiff < 480:
		Rank = "C"
	elif qdiff >= 180 and qdiff < 1440:
		Rank = "B"
	elif qdiff >= 1440 and qdiff < 3900:
		Rank = "A"
	elif qdiff >= 3900:
		Rank = "S"
		
func addAdventurer(adv: adventurer):
	questAdventurers.append(adv)
	
func removeAdventurer(adv: adventurer):
	questAdventurers.erase(adv)
