extends NinePatchRect


@onready var newslogContainer = $LeftPage_BG/NewsLogLabel/ScrollContainer/VBoxContainer
@onready var rankingContainer =$LeftPage_BG/RankingLabel/ScrollContainer/VBoxContainer
@onready var questsContainer = $RightPage_BG/QuestsScrollContainer/QuestsVBoxContainer

var quest_label = preload("res://Scenes/quest_label.tscn")

## variavel local do dia que compara com globals se for diferente o dia passou tem que atualizar a view
var localdayaux = 0


func _ready() -> void:
	# cria um aventureiro teste
	const adv = preload("res://Scripts/Classes/adventurer.gd")
	var auxnewa = adventurer.new()
	#adc no globals o adv
	Globals.adventurers.append(auxnewa)
	
	const adv2 = preload("res://Scripts/Classes/adventurer.gd")
	var auxnewa2 = adventurer.new()
	#adc no globals o adv
	Globals.adventurers.append(auxnewa2)

func _process(delta: float) -> void:
	## dia MUDOU!!!
	if(localdayaux!=Globals.day):
		print("new day, settting up new quests and news")
		localdayaux = Globals.day 
		setNewDay()
		attGuildRanks()
		

## cria quests e news randomicas 
func setNewDay():	
	newDaySpawnAdventurers()
	newDaySpawnNews()
	newDaySpawnQuests()

func newDaySpawnAdventurers():
	pass

# cria os eventos randomicos no começo do dia
func newDaySpawnNews():
	pass

func newDaySpawnQuests():
	# cria uma nova quest exemplo no começo do dia
	const quest = preload("res://Scripts/Classes/quest.gd")
	var auxnewq = quest.new()
	#adc no globals a quest criada
	Globals.quests.append(auxnewq)
	
	attAvaibleQuestsDisplay()


func attAvaibleQuestsDisplay():
	#clear nas quests antigas antes de popular
	var children = questsContainer.get_children()
	for c in children:
		c.queue_free()
	
	## popula o container de quests no lobby 
	for q in Globals.quests:
		var questlabel = quest_label.instantiate()
		questsContainer.add_child(questlabel)
		questlabel.setNewQuest(q)

## atualiza os ranks caso haja mudanças e termina o jogo caso o rank seja o maior entre as guilds
func attGuildRanks():
	pass


func _on_end_day_button_pressed() -> void:
	#Globals.reset()
	#SoundManager.play_sfx("select_sound")
	get_tree().get_root().get_node("Main").changeBookPage("endofday")
	pass
