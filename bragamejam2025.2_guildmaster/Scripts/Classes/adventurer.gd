class_name adventurer extends Node

var rank = "F"
#var adv_class = "archer"
var adv_name = "jose"
var adv_sex = "male"


var adv_portrait = "res://Resources/Portraits/Icon45.png"
var isAvaible = true

var traits: Array[String]

var power = 1
var reputation = 0


## retorna um inteiro com a taxa do aventureiro de acordo com o rank 
func getAdventurerFee() -> int:
	match rank:
		"F":
			return 10
		"E":
			return 30	
		"D":
			return 100
		"C":
			return 350	
		"B":
			return 1200
		"A":
			return 4000	
		"S":
			return 15000
	
	return 1000

## adc reputation que funciona como experiencia retorna true se upou
func addReputationAdv(rep) -> bool:
	var rankedup = false
	reputation = reputation + rep
	match rank:
		"F":
			if reputation > 100:
				rank = "E"
				rankedup = true
		"E":
			if reputation > 500:
				rank = "D"
				rankedup = true
		"D":
			if reputation > 1500:
				rank = "C"
				rankedup = true
		"C":
			if reputation > 4000:
				rank = "B"
				rankedup = true
		"B":
			if reputation > 9000:
				rank = "A"
				rankedup = true
	
	if rankedup:
		# adding event to current events
		const ne = preload("res://Scripts/Classes/event.gd")
		var auxnewE = ne.new()
		auxnewE.setEvent("Adventurer RankUp",Globals.guildName,adv_name,"")
		Globals.currentEvents.append(auxnewE)
		
		return true
	else:
		return false

func setAdventurer(advn,advs,advr):
	adv_name = advn
	adv_sex = advs
	rank = advr
	setAdvPortrait()

func setAdvPortrait():
	
	var maleportraitsrankS = ["res://Resources/Portraits/Male/S/Icon22.png","res://Resources/Portraits/Male/S/Icon28.png","res://Resources/Portraits/Male/S/Icon33.png","res://Resources/Portraits/Male/S/Icon35.png"]
	var femaleportraitsrankS = ["res://Resources/Portraits/Female/S/Icon23.png","res://Resources/Portraits/Female/S/Icon34.png","res://Resources/Portraits/Female/S/Icon36.png"]
	
	var maleportraits = ["res://Resources/Portraits/Male/Icon1.png","res://Resources/Portraits/Male/Icon3.png",
						"res://Resources/Portraits/Male/Icon5.png","res://Resources/Portraits/Male/Icon7.png",
						"res://Resources/Portraits/Male/Icon9.png","res://Resources/Portraits/Male/Icon11.png",
						"res://Resources/Portraits/Male/Icon13.png","res://Resources/Portraits/Male/Icon14.png",
						"res://Resources/Portraits/Male/Icon17.png","res://Resources/Portraits/Male/Icon19.png",
						"res://Resources/Portraits/Male/Icon20.png","res://Resources/Portraits/Male/Icon25.png",
						"res://Resources/Portraits/Male/Icon26.png","res://Resources/Portraits/Male/Icon27.png",
						"res://Resources/Portraits/Male/Icon29.png","res://Resources/Portraits/Male/Icon30.png",
						"res://Resources/Portraits/Male/Icon37.png","res://Resources/Portraits/Male/Icon39.png",
						"res://Resources/Portraits/Male/Icon41.png","res://Resources/Portraits/Male/Icon43.png",
						"res://Resources/Portraits/Male/Icon45.png"]
						
	var femaleportraits = ["res://Resources/Portraits/Female/Icon2.png","res://Resources/Portraits/Female/Icon4.png",
						"res://Resources/Portraits/Female/Icon6.png","res://Resources/Portraits/Female/Icon10.png",
						"res://Resources/Portraits/Female/Icon12.png","res://Resources/Portraits/Female/Icon15.png",
						"res://Resources/Portraits/Female/Icon16.png","res://Resources/Portraits/Female/Icon18.png",
						"res://Resources/Portraits/Female/Icon21.png","res://Resources/Portraits/Female/Icon24.png",
						"res://Resources/Portraits/Female/Icon31.png","res://Resources/Portraits/Female/Icon32.png",
						"res://Resources/Portraits/Female/Icon38.png","res://Resources/Portraits/Female/Icon40.png",
						"res://Resources/Portraits/Female/Icon42.png","res://Resources/Portraits/Female/Icon44.png",
						"res://Resources/Portraits/Female/Icon46.png","res://Resources/Portraits/Female/Icon48.png"]
	
	if adv_sex == "male":
		if rank == "S":
			adv_portrait = maleportraitsrankS.pick_random()
		adv_portrait = maleportraits.pick_random()
	else:
		if rank == "S":
			adv_portrait = femaleportraitsrankS.pick_random()
		adv_portrait = femaleportraits.pick_random()
