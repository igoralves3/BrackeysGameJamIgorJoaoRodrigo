extends NinePatchRect


@onready var newslogContainer = $LeftPage_BG/NewsLogLabel/ScrollContainer/VBoxContainer
@onready var rankingContainer =$LeftPage_BG/RankingLabel/ScrollContainer/VBoxContainer
@onready var questsContainer = $RightPage_BG/QuestsScrollContainer/QuestsVBoxContainer

var quest_label = preload("res://Scenes/quest_label.tscn")
var rank_label = preload("res://Scenes/guild_ranking_label.tscn")

## variavel local do dia que compara com globals se for diferente o dia passou tem que atualizar a view
var localdayaux = 0


func _ready() -> void:
		
	## READY EXECUTA APENAS DA PRIMEIRA VEZ! SPAWNS INICIAIS AQUI!
	var auxnewa = Spawner.spawnNewAdventurer()
	#adc no globals o adv
	Globals.knownAdventurers.append(auxnewa)
	
	#var auxnewa2 = Spawner.spawnNewAdventurer()
	#adc no globals o adv
	#Globals.knownAdventurers.append(auxnewa2)
	pass

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
	## se nao ta no limite cria novo aventureiro no array de aventureiros conhecidos
	if Globals.knownAdventurersMaxLimit > Globals.knownAdventurers.size():
		var auxnewa = Spawner.spawnNewAdventurer()
		print("spawning new adventurer: " + auxnewa.adv_name)
		#adc no globals o adv
		Globals.knownAdventurers.append(auxnewa)
		
		
	 # sorteia os aventureiros do dia 
	for i in Globals.availbleAdventurersMaxLimit:
		if Globals.knownAdventurers.is_empty():
			#print("all knownadventurerspicked")
			pass
		else:
			Globals.knownAdventurers.shuffle()
			Globals.availbleAdventurers.append(Globals.knownAdventurers.pop_front())


# cria os eventos randomicos no começo do dia
func newDaySpawnNews():
	pass

func newDaySpawnQuests():
	
	## por enquanto sempre spawna 3 quests
	var auxnewq = Spawner.spawnNewQuest()
	Globals.availableQuests.append(auxnewq)
	auxnewq = Spawner.spawnNewQuest()
	Globals.availableQuests.append(auxnewq)
	auxnewq = Spawner.spawnNewQuest()
	Globals.availableQuests.append(auxnewq)
	
	match Globals.tierGuild:
		"Unlicensed":
			pass
		"Iron":
			pass	
		"Bronze":
			pass
		"Silver":
			pass
		"Gold":
			pass
		"Platinum":
			pass
		"Diamond":
			pass

	attAvaibleQuestsDisplay()


func attAvaibleQuestsDisplay():
	#clear nas quests antigas antes de popular
	var children = questsContainer.get_children()
	for c in children:
		c.queue_free()
	
	## popula o container de quests no lobby 
	for q in Globals.availableQuests:
		if q:
			var questlabel = quest_label.instantiate()
			questsContainer.add_child(questlabel)
			questlabel.setNewQuest(q)

## atualiza os ranks caso haja mudanças e termina o jogo caso o rank seja o maior entre as guilds
func attGuildRanks():
	
	var children = rankingContainer.get_children()
	for c in children:
		c.queue_free()
	
	var deep_dict_copy_aux = Globals.rivalGuilds_dict.duplicate(true)
	deep_dict_copy_aux[Globals.guildName] = Globals.totalrep
	
	var keys_sorted_by_value = deep_dict_copy_aux.keys()
	keys_sorted_by_value.sort_custom(func(a, b): return deep_dict_copy_aux[a] > deep_dict_copy_aux[b])

	for key in keys_sorted_by_value:
		var ranklabel = rank_label.instantiate()
		rankingContainer.add_child(ranklabel)
		ranklabel.setLabel(key,deep_dict_copy_aux[key])

func _on_end_day_button_pressed() -> void:
	#Globals.reset()
	
	#SoundManager.play_sfx("select_sound")
	get_tree().get_root().get_node("Main").changeBookPage("endofday")
	SoundManager.pickButtonSFX(randi() % 3)
	pass
