extends NinePatchRect


@onready var newslogContainer = $LeftPage_BG/NewsLogLabel/ScrollContainer/VBoxContainer
@onready var rankingContainer =$LeftPage_BG/RankingLabel/ScrollContainer/VBoxContainer
@onready var questsContainer = $RightPage_BG/QuestsScrollContainer/QuestsVBoxContainer

var quest_label = preload("res://Scenes/Components/quest_label.tscn")
var rank_label = preload("res://Scenes/Components/guild_ranking_label.tscn")
var news_label = preload("res://Scenes/Components/news_log.tscn")

@onready var hold_timer = $RightPage_BG/EndDayButton/HoldTimer

## variavel local do dia que compara com globals se for diferente o dia passou tem que atualizar a view
var localdayaux = 0


func _ready() -> void:
		
	## READY EXECUTA APENAS DA PRIMEIRA VEZ! SPAWNS INICIAIS AQUI!
	var auxnewa = Spawner.spawnNewAdventurer()
	#adc no globals o adv
	Globals.knownAdventurers.append(auxnewa)
	
	
	Spawner.spawnTestPool()
	
	#var auxnewa2 = Spawner.spawnNewAdventurer()
	#adc no globals o adv
	#Globals.knownAdventurers.append(auxnewa2)
	pass

func _process(delta: float) -> void:
	## dia MUDOU!!!
	if(localdayaux!=Globals.day):
		#print("new day, settting up new quests and news")
		localdayaux = Globals.day 
		setNewDay()
		attGuildRanks()
		
## cria quests e news randomicas 
func setNewDay():	
	newDaySpawnNews()
	newDaySpawnAdventurers()
	newDaySpawnQuests()

func newDaySpawnAdventurers():
	## se nao ta no limite cria novo aventureiro no array de aventureiros conhecidos
	if Globals.knownAdventurersMaxLimit > Globals.knownAdventurers.size():
		var auxnewa = Spawner.spawnNewAdventurer()
		#print("spawning new adventurer: " + auxnewa.adv_name)
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
	#clear nas quests antigas antes de popular
	var children = newslogContainer.get_children()
	for c in children:
		c.queue_free()
	
	
	for e in Globals.currentEvents:
		if e:
			var newslabel = news_label.instantiate()
			newslogContainer.add_child(newslabel)
			newslabel.setLabel(e)

func newDaySpawnQuests():
	
	var minumum_ranks_possible = 1
	var max_quests = 3
	
	if Globals.tierGuild == "Unlicensed":
		minumum_ranks_possible = 2
		max_quests = 3
	if Globals.tierGuild == "Iron":
		minumum_ranks_possible = 3
		max_quests = 5
	if Globals.tierGuild == "Bronze":
		minumum_ranks_possible = 4
		max_quests = 7
	if Globals.tierGuild == "Silver":
		minumum_ranks_possible = 5
		max_quests = 9
	if Globals.tierGuild == "Gold":
		minumum_ranks_possible = 6
		max_quests = 12
	if Globals.tierGuild == "Platinum":
		minumum_ranks_possible = 7
		max_quests = 15
	if Globals.tierGuild == "Diamond":
		minumum_ranks_possible = 7
		max_quests = 17
	if Globals.tierGuild == "Pinnacle":
		minumum_ranks_possible = 7
		max_quests = 20
			
	##if minumum_ranks_possible >= 3 and minumum_ranks_possible <= 4:
	##	max_quests=6
	##elif minumum_ranks_possible > 4:
	##	max_quests=7
		
	var n = randi_range(1,max_quests)
	for i in range(0,n):
		var auxnewq = Spawner.spawnNewQuest()	
		if checkQuestExists(auxnewq):
			pass
		else:
			Globals.availableQuests.append(auxnewq)
	
	attAvaibleQuestsDisplay()

func checkQuestExists(q: quest) -> bool:
	for gq in Globals.availableQuests:
		if gq.questname == q.questname:
			return true
			
	for gq in Globals.onGoingQuests:
		if gq.questname == q.questname:
			return true
			
	return false



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


func _on_end_day_button_button_down() -> void:
	hold_timer.start()
	$RightPage_BG/EndDayButton/TextureRect.play("default")

func _on_end_day_button_button_up() -> void:
	if hold_timer.is_stopped():
		$RightPage_BG/EndDayButton/TextureRect.play("static")
		pass
	else:
		$RightPage_BG/EndDayButton/TextureRect.play("static")
		hold_timer.stop()


func _on_hold_timer_timeout() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("endofday")
	Globals.currentEvents.clear()
	Globals.repEarnedThisRound = 0
	Globals.availableQuests.clear()
	SoundManager.pickButtonSFX(randi() % 3)


func _on_end_day_button_mouse_entered() -> void:
	$RightPage_BG/EndDayButton/Label.modulate = Color("99725d")


func _on_end_day_button_mouse_exited() -> void:
	$RightPage_BG/EndDayButton/Label.modulate = Color("ffffff")
