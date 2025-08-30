extends Node

@onready var BGMusicPlaylist: Array = ["res://Resources/Sounds/BGMusic1.wav", "res://Resources/Sounds/BGMusic2.wav", "res://Resources/Sounds/BGMusic3.wav", "res://Resources/Sounds/BGMusic4.wav", "res://Resources/Sounds/BGMusic5.wav"]
@onready var FailPlaylist: Array = ["res://Resources/Sounds/fail1.wav", "res://Resources/Sounds/fail2.wav", "res://Resources/Sounds/fail3.wav"]
@onready var VictoryPlaylist: Array = ["res://Resources/Sounds/victory1.wav", "res://Resources/Sounds/victory2.wav"]
@onready var ButtonPlayList: Array = ["res://Resources/Sounds/Button1.wav", "res://Resources/Sounds/Button2.wav", "res://Resources/Sounds/Button3.wav"]
@onready var ClickPlayList: Array = ["res://Resources/Sounds/click1.wav", "res://Resources/Sounds/click2.wav", "res://Resources/Sounds/click3.wav"]
@onready var SelectionPlayList: Array = ["res://Resources/Sounds/select.wav"]


func _ready():
	pickBGMusic(randi() % 5)

func pickBGMusic(index: int):
	$BG.stop()
	#print(index)
	#print(BGMusicPlaylist[index])
	$BG.stream = load(BGMusicPlaylist[index])
	$BG.play()

func pickFailMusic(index: int):
	$SFX.stop()
	#print(index)
	#print(FailPlaylist[index])
	$SFX.stream = load(FailPlaylist[index])
	$SFX.play()

func pickVictoryMusic(index: int):
	$SFX.stop()
	#print(index)
	#print(VictoryPlaylist[index])
	$SFX.stream = load(VictoryPlaylist[index])
	$SFX.play()

func pickButtonSFX(index: int):
	$SFX.stop()
	#print(index)
	#print(ButtonPlayList[index])
	$SFX.stream = load(ButtonPlayList[index])
	$SFX.play()

func pickClickSFX(index: int):
	$SFX.stop()
	#print(index)
	#print(ButtonPlayList[index])
	$SFX.stream = load(ClickPlayList[index])
	$SFX.play()

func pickSelectSFX(index: int = 0):
	$SFX.stop()
	#print(index)
	#print(ButtonPlayList[index])
	$SFX.stream = load(SelectionPlayList[index])
	$SFX.play()
