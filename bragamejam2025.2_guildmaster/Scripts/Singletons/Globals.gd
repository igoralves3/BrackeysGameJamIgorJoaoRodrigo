extends Node

# variaveis globais tipo gold, rep, day(ou semana), hired_adv (array que aramazena os personagens da guild)

const SAVE_PATH = "res://savedata/highscores.txt"
# Create new ConfigFile object.
var config = ConfigFile.new()
## usada apenas pra salvar a ref da quest selecionada
var questAux = null
## usado apenas temporariamente
var partyNow: Array[adventurer]
var repEarnedThisRound = 0


var guildName = "The Flying Dragon"
var rivalGuilds_dict = {"White Guild": 500, "Yellow Guild": 750, "Orange Guild": 1000}

var availableQuests: Array[quest]
var onGoingQuests: Array[quest]
var DDQuests: Array[quest]

var ddEventResolvedRefreshView = false

## all adventurerrs
var knownAdventurers: Array[adventurer]
var knownAdventurersMaxLimit = 10
## available adventurers per day 
var availbleAdventurers: Array[adventurer]
var availbleAdventurersMaxLimit = 5

var currentEvents: Array[event]

var totalgold = 1000
var totalrep = 99
var day = 1

var tierGuild = "Unlicenced"


## usado para adicionar reputção no final do dia, retorna true se upou agora (para fins de popups e triggar animaçoes)
func addReputationGuild(rep) -> bool:
	totalrep = totalrep + rep
	updateRivalGuildsRep()
	
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
				gameEndWon()	
				return true
	
	return false


func gameEndWon():
	pass
	
func gameEndLost():
	pass

func endDay():
	day = day + 1
	if day == 50 and tierGuild != "Pinnacle":
		gameEndLost()

func updateRivalGuildsRep():
	
	var high_rate = randf_range(0.80, 1.00)
	var mid_rate = randf_range(0.40, 0.70)
	var slow_rate = randf_range(0.05, 0.45)
	
	var variation = repEarnedThisRound * high_rate
	rivalGuilds_dict["White Guild"] = int(rivalGuilds_dict["White Guild"] + variation)
	
	var variation2 = repEarnedThisRound * mid_rate
	rivalGuilds_dict["Yellow Guild"] = int(rivalGuilds_dict["Yellow Guild"] + variation2)
	
	var variation3 = repEarnedThisRound * slow_rate
	rivalGuilds_dict["Orange Guild"] = int(rivalGuilds_dict["Orange Guild"] + variation3)

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
