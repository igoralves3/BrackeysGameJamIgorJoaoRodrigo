class_name adventurer extends Node

var rank = "F"
#var adv_class = "archer"
var adv_name = "jose"
var adv_sex = "male"

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
func addReptutation(rep) -> bool:
	reputation = reputation + rep
	match rank:
		"F":
			if reputation > 100:
				rank = "E"
				return true
		"E":
			if reputation > 500:
				rank = "D"
				return true
		"D":
			if reputation > 1500:
				rank = "C"
				return true
		"C":
			if reputation > 4000:
				rank = "B"
				return true
		"B":
			if reputation > 9000:
				rank = "A"
				return true
	
	return false

func setAdventurer(advn,advs,advr):
	adv_name = advn
	adv_sex = advs
	rank = advr
