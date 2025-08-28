extends Node

# variaveis globais tipo gold, rep, day(ou semana), hired_adv (array que aramazena os personagens da guild)

const SAVE_PATH = "res://savedata/highscores.txt"
# Create new ConfigFile object.
var config = ConfigFile.new()
## usada apenas pra salvar a ref da quest selecionada
var questAux = null
## usado apenas temporariamente
var partyNow: Array[adventurer]


var guildName = "Nome da Guild"
var rivalGuilds_dict = {"White": 500, "Yellow": 750, "Orange": 1000}

var availableQuests: Array[quest]
var onGoingQuests: Array[quest]

## all adventurerrs
var knownAdventurers: Array[adventurer]
var knownAdventurersMaxLimit = 10
## available adventurers per day 
var availbleAdventurers: Array[adventurer]
var availbleAdventurersMaxLimit = 5

var totalgold = 1000
var totalrep = 0
var day = 1

var tierGuild = "Unlicenced"


## usado para adicionar reputção no final do dia, retorna true se upou agora (para fins de popups e triggar animaçoes)
func addReputation(rep) -> bool:
	totalrep = totalrep + rep
	match tierGuild:
		
		"Unlicenced":
			if totalrep > 100:
				tierGuild = "Iron"
				availbleAdventurersMaxLimit = 7
				knownAdventurersMaxLimit = (availbleAdventurersMaxLimit * 2)
				return true
		"Iron":
			if totalrep > 500:
				tierGuild = "Bronze"
				availbleAdventurersMaxLimit = 9
				knownAdventurersMaxLimit = (availbleAdventurersMaxLimit * 2)
				return true
		"Bronze":
			if totalrep > 1500:
				tierGuild = "Silver"
				availbleAdventurersMaxLimit = 11
				knownAdventurersMaxLimit = (availbleAdventurersMaxLimit * 2)
				return true
		"Silver":
			if totalrep > 4000:
				tierGuild = "Gold"
				availbleAdventurersMaxLimit = 12
				knownAdventurersMaxLimit = (availbleAdventurersMaxLimit * 2)
				return true
		"Gold":
			if totalrep > 9000:
				tierGuild = "Platinum"
				availbleAdventurersMaxLimit = 14
				knownAdventurersMaxLimit = (availbleAdventurersMaxLimit * 2)
				return true
		"Platinum":
			if totalrep > 18000:
				tierGuild = "Diamond"
				availbleAdventurersMaxLimit = 17
				knownAdventurersMaxLimit = (availbleAdventurersMaxLimit * 2)
				return true
		"Diamond":
			if totalrep > 25000:
				tierGuild = "Pinnacle"
				availbleAdventurersMaxLimit = 20
				knownAdventurersMaxLimit = (availbleAdventurersMaxLimit * 2)
				return true
	
	return false

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
		
func killAdv(adv: adventurer):
	if(partyNow.has(adv)):
		partyNow.erase(adv)
	elif(knownAdventurers.has(adv)):
		knownAdventurers.erase(adv)
	elif(availbleAdventurers.has(adv)):
		availbleAdventurers.erase(adv)
	else:
		print("error adventurer not found")
