extends Node

# variaveis globais tipo gold, rep, day(ou semana), hired_adv (array que aramazena os personagens da guild)

const SAVE_PATH = "res://savedata/highscores.txt"
# Create new ConfigFile object.
var config = ConfigFile.new()

var quests: Array[quest]
var adventurers: Array[adventurer]

var totalgold = 1000
var totalrep = 0
var day = 1
