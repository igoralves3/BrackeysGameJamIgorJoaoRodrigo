extends NinePatchRect

@onready var questsSummaryContainer = $LeftPage_BG/QuestLogLabel/ScrollContainer/VBoxContainer
@onready var questsResultsContainer = $RightPage_BG/Results/ResultsScrollContainer/VBoxContainer

@onready var guildNameLabel = $RightPage_BG/GuildNameLabel

var quest_end_summary = preload("res://Scenes/Components/quest_log_end_summary.tscn")
var quest_result_value = preload("res://Scenes/Components/result_quest_end.tscn")

var endDayGoldEarned = 0
var endDayRepEarned = 0

func _process(delta: float) -> void:
	
	if Globals.ddEventResolvedRefreshView == true:
		startResolvingDayQuests()
		Globals.ddEventResolvedRefreshView = false

func _ready() -> void:
	guildNameLabel.text = Globals.guildName


func startResolvingDayQuests():
	clearViews()	

	## pegar todas as quests ativas e resolver elas
	for activeQuest in Globals.onGoingQuests:
		
		## CHANCE DE DOUBLE DOWN
		var random_roll = randi_range(1, 100)	
		if random_roll <= 15:
			activeQuest.doubleDownTriggered = true
		
		
		if activeQuest.doubleDownTriggered == false:
			resolveQuest(activeQuest)
		
			## populate summaries
			var questsum = quest_end_summary.instantiate()
			questsSummaryContainer.add_child(questsum)
			questsum.setLabels(activeQuest)
			
			## populate overall rep and gold gain
			var questresult = quest_result_value.instantiate()
			questsResultsContainer.add_child(questresult)
			questresult.setLabels(activeQuest)
		
		else:
			## populate ONLY summaries
			var questsum = quest_end_summary.instantiate()
			questsSummaryContainer.add_child(questsum)
			questsum.setLabels(activeQuest)
		
	## calculate and att total 
	$RightPage_BG/Results/Total/RepTotalContainer/RepTotalLabel.text = "+ " + str(endDayRepEarned) + " Rep"
	$RightPage_BG/Results/Total/GoldTotalContainer/GoldTotalLabel.text = "+ " + str(endDayGoldEarned) + " Gold"


func endDayAttQuestResults():
	for activeQuest in Globals.onGoingQuests:	
		if activeQuest.onGoing == false:
			## quest complete remove quest from avaible quests on globals script 
			if Globals.availableQuests.has(activeQuest):
				Globals.availableQuests.erase(activeQuest)
			
			if Globals.onGoingQuests.has(activeQuest):
				Globals.onGoingQuests.erase(activeQuest)

func resolveQuest(q: quest):
	questSuccessCalculation(q)
	## quest survivors calculation
	questSurvivorsCalculation(q)
	q.onGoing = false


func questSurvivorsCalculation(q: quest):
	## quest end set remaining survivors to avaible 	
	var baseDeathChance: int
	match (q.Rank):
		"F":
			if q.success:
				baseDeathChance = 1
			else: 
				baseDeathChance = 5
		"E":
			if q.success:
				baseDeathChance = 1
			else: 
				baseDeathChance = 5
		"D":
			if q.success:
				baseDeathChance = 1
			else: 
				baseDeathChance = 5
		"C":
			if q.success:
				baseDeathChance = 2
			else: 
				baseDeathChance = 10
		"B":
			if q.success:
				baseDeathChance = 3
			else: 
				baseDeathChance = 15
		"A":
			if q.success:
				baseDeathChance = 5
			else: 
				baseDeathChance = 25
		"S":
			if q.success:
				baseDeathChance = 10
			else: 
				baseDeathChance = 50
				
	for adv in q.questAdventurers:
		if q.success:
			if q.questAdventurers.size() > 1:
				var diceRoll:= randi()%100
				adv.isAvaible = diceRoll < 100-baseDeathChance
			else:	
				adv.isAvaible = true
		else:
			var diceRoll:= randi()%100
			adv.isAvaible = diceRoll < 100-baseDeathChance
			
		## player death, remove from arrays
		if adv.isAvaible == false:
			
			## adding event to current events
			const ne = preload("res://Scripts/Classes/event.gd")
			var auxnewE = ne.new()
			auxnewE.setEvent("Adventurer Death",Globals.guildName,adv.adv_name,"")
			Globals.currentEvents.append(auxnewE)
			
			print("adventurer DEATH: " + adv.adv_name)
			q.advDead.append(adv)
			Globals.killAdv(adv)
			if q.questAdventurers.has(adv):
				q.questAdventurers.erase(adv)
				
		## adv alive calculate exp		
		else:
			adv.addReputationAdv(q.finalRep)

## calculo sucesso da quest
func questSuccessCalculation(q: quest):
	randomize()
	var diceRoll:= randi()%100
	var probability: int
	
	match (q.chanceOfSuccess):
		"VERY LIKELY":
			probability = randi_range(80, 99)
		"LIKELY":
			probability = randi_range(60, 79)
		"EVEN ODDS":
			probability = randi_range(40, 59)
		"UNLIKELY":
			probability = randi_range(20, 39)
		"VERY UNLIKELY":
			probability = randi_range(5, 19)
		
	
	if diceRoll <= probability:
		#Vitoria
		q.success = true
		
		const ne = preload("res://Scripts/Classes/event.gd")
		var auxnewE = ne.new()
		auxnewE.setEvent("Quest Completed",Globals.guildName,"Completing the Quest",q)
		Globals.currentEvents.append(auxnewE)
		
		
		## calculate gold and rep earned
		endDayGoldEarned = endDayGoldEarned + q.finalGold
		endDayRepEarned = endDayRepEarned + q.finalRep
	else:
		#Fracasso
		
		q.success = false
		q.finalGold = 0
		
		const ne = preload("res://Scripts/Classes/event.gd")
		var auxnewE = ne.new()
		auxnewE.setEvent("Quest Failed",Globals.guildName,"Perished",q)
		Globals.currentEvents.append(auxnewE)
		
		
		## calculate losses
		endDayRepEarned = endDayRepEarned - calculateRepLoss(q)
		
	## quest endend

func calculateRepLoss(q: quest) -> int:
	match (q.Rank):
		"F":
			pass
		"E":
			return 5
		"D":
			return 20
		"C":
			return 60
		"B":
			return 200
		"A":
			return 500
		"S":
			return 2500
	return 0
	
func clearViews():
	var children = questsResultsContainer.get_children()
	for c in children:
		c.queue_free()
		
	var children2 = questsSummaryContainer.get_children()
	for c2 in children2:
		c2.queue_free()

func _on_back_to_lobby_button_pressed() -> void:
	
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	SoundManager.pickButtonSFX(randi() % 3)
	
	endDayAttQuestResults()
	startResolvingDayQuests()
	endDayAttQuestResults()
	
	Globals.totalgold = Globals.totalgold + endDayGoldEarned
	Globals.availableQuests.clear()
	
	#print("rep earnedthisround: " + str(endDayRepEarned))
	Globals.repEarnedThisRound = endDayRepEarned
	## se retornar true upou agora
	if Globals.addReputationGuild(endDayRepEarned):
		print("Up Guild Tier: " + Globals.tierGuild)
		
		const ne = preload("res://Scripts/Classes/event.gd")
		var auxnewE = ne.new()
		auxnewE.setEvent("Guild RankUp",Globals.guildName,Globals.tierGuild,"")
		Globals.currentEvents.append(auxnewE)
		
	## caso contrario nada acontece
	else:
		pass
		
	Globals.endDay()

func _on_back_to_lobby_button_button_down() -> void:
	pass # Replace with function body.


func _on_back_to_lobby_button_button_up() -> void:
	pass # Replace with function body.


func _on_back_to_lobby_button_mouse_entered() -> void:
	$RightPage_BG/BackToLobbyButton/Label.modulate = Color("99725d")


func _on_back_to_lobby_button_mouse_exited() -> void:
	$RightPage_BG/BackToLobbyButton/Label.modulate = Color("ffffff")
