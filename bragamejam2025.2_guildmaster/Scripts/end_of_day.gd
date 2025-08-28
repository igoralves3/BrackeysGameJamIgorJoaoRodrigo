extends NinePatchRect

@onready var questsSummaryContainer = $LeftPage_BG/QuestLogLabel/ScrollContainer/VBoxContainer
@onready var questsResultsContainer = $RightPage_BG/Results/ResultsScrollContainer/VBoxContainer

var quest_end_summary = preload("res://Scenes/quest_log_end_summary.tscn")
var quest_result_value = preload("res://Scenes/result_quest_end.tscn")

var doubleDownQuestsAux = []

var endDayGoldEarned = 0
var endDayRepEarned = 0


func resolvePendingDayEvents():
	
	clearViews()
	## pegar todas as quests ativas e resolver elas
	for activeQuest in Globals.onGoingQuests:
		resolveQuest(activeQuest)
	
		## populate summaries
		var questsum = quest_end_summary.instantiate()
		questsSummaryContainer.add_child(questsum)
		questsum.setLabels(activeQuest)
		
		## populate overall rep and gold gain
		var questresult = quest_result_value.instantiate()
		questsResultsContainer.add_child(questresult)
		questresult.setLabels(activeQuest)
		
		## check if complete else doubledown activated, still onGoing
		if activeQuest.onGoing == false:
			## quest complete remove quest from avaible quests on globals script 
			if Globals.availableQuests.has(activeQuest):
				Globals.availableQuests.erase(activeQuest)
			
			if Globals.onGoingQuests.has(activeQuest):
				Globals.onGoingQuests.erase(activeQuest)	
			
	## calculate and att total 
	$RightPage_BG/Results/Total/RepTotalLabel.text = "+" + str(endDayRepEarned)
	$RightPage_BG/Results/Total/GoldTotalLabel.text = "+" + str(endDayGoldEarned)
	
	
func resolveQuest(q: quest):
	
	## chance de double down ADC CODIGO COM PORCENTAGENS POR ENQUANTO FLAG FALSE
	var doubledown = false
	
	## doubledown nao tem logo acaba a quest
	if doubledown == false:
		questSuccessCalculation(q)
		## quest survivors calculation
		questSurvivorsCalculation(q)

		
	#doubledown TRUE cria uma copia da quest para caso o player queira encerrar a quest e pegar os rewards	
	##atualiza valores da quest original para refletir o doubledown
	else:
		const quest = preload("res://Scripts/Classes/quest.gd")
		var auxnewq = quest.new()
		auxnewq.setQuest(q.rep,q.gold,q.name,q.difficulty)
		auxnewq.questAdventurers = q.questAdventurers
		questSuccessCalculation(auxnewq)
		questSurvivorsCalculation(auxnewq)
		## att valores da quest original, NÃO da copia
		questDoubleDownValuesAtt(q)


func questDoubleDownValuesAtt(q: quest):
	if q.success:
		randomize()
		var diceRoll: int = randi() % 100
		var probability: int = 15
		match (q.chanceOfSuccess):
			"EVEN ODDS":
				probability += 10
				pass
			"UNLIKELY":
				probability += 25
				pass
			"VERY UNLIKELY":
				probability += 50
				pass
		if diceRoll <= probability:
			#success
			pass
		else:
			#fail
			pass
	else:
		pass
## calculo sobreviventes ou nao da quest	
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
				pass
			else:
				adv.isAvaible = true

## calculo sucesso da quest
func questSuccessCalculation(q: quest):
	## quest success calculation
	var total_party_power = 0
	for quest_adv in q.questAdventurers:
		total_party_power += quest_adv.power
		
	#var p_success :float = clamp((total_party_power / q.difficulty) * 0.5, 5, 99)	
	#print(p_success)
	randomize()
	var diceRoll:= randi()%100
	var probability: int
	
	match (q.chanceOfSuccess):
		"VERY LIKELY":
			probability = randi_range(80, 99)
			pass
		"LIKELY":
			probability = randi_range(60, 79)
			pass
		"EVEN ODDS":
			probability = randi_range(40, 59)
			pass
		"UNLIKELY":
			probability = randi_range(20, 39)
			pass
		"VERY UNLIKELY":
			probability = randi_range(5, 19)
			pass
			
	if diceRoll <= probability:
		#Vitoria
		q.success = true
		## calculate gold and rep earned
		endDayGoldEarned = endDayGoldEarned + q.finalGold
		endDayRepEarned = endDayRepEarned + q.finalRep
	else:
		#Fracasso
		q.success = false
		## calculate losses
		endDayGoldEarned = endDayGoldEarned - q.finalGold
		endDayRepEarned = endDayRepEarned - q.finalRep
		pass
	## quest endend
	q.onGoing = false

func clearViews():
	var children = questsResultsContainer.get_children()
	for c in children:
		c.queue_free()
		
	var children2 = questsSummaryContainer.get_children()
	for c2 in children2:
		c2.queue_free()

func _on_back_to_lobby_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	SoundManager.pickButtonSFX(randi() % 3)
	
	Globals.totalgold = Globals.totalgold + endDayGoldEarned
	Globals.totalrep = Globals.totalrep + endDayRepEarned
	Globals.day = Globals.day + 1
