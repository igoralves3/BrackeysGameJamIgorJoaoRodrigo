extends NinePatchRect

@onready var questsSummaryContainer = $LeftPage_BG/QuestLogLabel/ScrollContainer/VBoxContainer
@onready var questsResultsContainer = $RightPage_BG/Results/ResultsScrollContainer/VBoxContainer

var quest_end_summary = preload("res://Scenes/quest_log_end_summary.tscn")
var quest_result_value = preload("res://Scenes/result_quest_end.tscn")


func resolvePendingDayEvents():
	clearViews()
	## pegar todas as quests ativas e resolver elas
	for activeQuest in Globals.onGoingQuests:
		resolveQuest(activeQuest)
	
		## populate summaries
		var questsum = quest_end_summary.instantiate()
		questsSummaryContainer.add_child(questsum)
		#questsum.setLabels(q)
		
		## populate overall rep and gold gain
		var questresult = quest_result_value.instantiate()
		questsResultsContainer.add_child(questresult)
		#questresult.setLabels()
		
	## calculate and att total 
	
	
func resolveQuest(q: quest):
	pass	
	
func clearViews():
	var children = questsResultsContainer.get_children()
	for c in children:
		c.queue_free()
		
	var children2 = questsSummaryContainer.get_children()
	for c2 in children2:
		c2.queue_free()

func _on_back_to_lobby_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	#passa o dia
	Globals.day = Globals.day + 1
