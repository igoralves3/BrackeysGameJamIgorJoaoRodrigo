class_name adventurer extends Node

var rank = "F"
var adv_class = "archer"
var adv_name = "jose"
var adv_sex = "male"
var adv_fee = 100

var isAvaible = true

var traits: Array[String]

var power = 1

func setAdventurer(advn,advs):
	adv_name = advn
	adv_sex = advs
