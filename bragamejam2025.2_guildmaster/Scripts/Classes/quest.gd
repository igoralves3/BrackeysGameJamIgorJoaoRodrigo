class_name quest extends Node

## after multipliers when quest is done
var finalGold = 0
var finalRep = 0
var success: bool

## auxiliar to show logs after
var advDead: Array[adventurer]

## contador usado para verificação da mecanica de double down, sendo aqui quantas vezes a quest foi continuada
## quando fizer double down e incrementar o contador, lembrar de ajustar a rep e o gold deacordo
var doubleDownaux = 0


# VERY LIKELY, LIKELY, EVEN ODDS, UNLIKELY, VERY UNLIKELY 
var chanceOfSuccess = "EVEN ODDS"

## quest endend aux
var onGoing = false

var rep = 100
var gold = 100
var questname = "Test Quest"
var questAdventurers: Array[adventurer]

var questinfo = "Quest info here"

@export var Rank = "F"
@export var difficulty = 0

func setQuest(qrep,qgold,qname,qdiff):
	rep = qrep
	gold = qgold
	questname = qname
	difficulty = qdiff
	
	## default no multiplier final rewards
	finalGold = qgold
	finalRep = qrep

func addAdventurer(adv: adventurer):
	questAdventurers.append(adv)
	
func removeAdventurer(adv: adventurer):
	questAdventurers.erase(adv)
