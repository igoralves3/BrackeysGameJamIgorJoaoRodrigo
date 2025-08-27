extends Node

# variaveis globais tipo gold, rep, day(ou semana), hired_adv (array que aramazena os personagens da guild)

const SAVE_PATH = "res://savedata/highscores.txt"
# Create new ConfigFile object.
var config = ConfigFile.new()
## usada apenas pra salvar a ref da quest selecionada
var questAux = null
## usado apenas temporariamente
var partyNow: Array[adventurer]

var availableQuests: Array[quest]
var adventurers: Array[adventurer]

var onGoingQuests: Array[quest]

var totalgold = 1000
var totalrep = 0
var day = 1


func startActiveQuest():
	onGoingQuests.append(questAux)
	questAux.onGoing = true
	questAux = null
	
# auxiliar functions to add and remove adventurers from party selection
func addParty(adv: adventurer):
	if(partyNow.size()<=4):
		partyNow.append(adv)
		adv.isAvaible = false
	else:
		print("partyIsFull")
	
func removeParty(adv: adventurer):
	if(partyNow.has(adv)):
		adv.isAvaible = true
		partyNow.erase(adv)
	else:
		print("error party do not contains adventurer")
