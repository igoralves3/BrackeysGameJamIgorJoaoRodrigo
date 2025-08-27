extends Node


func spawnNewQuest() -> quest:
	
	const nq = preload("res://Scripts/Classes/quest.gd")
	var myquests = []
	## check requirements for spawn like rep min for upper ranks etcs 
	
	## modelo criação de quest
	## tem que criar uma variavel nova pra cada uma, lembrar problema duplicate no godot
	## set quest (REP<INT>, GOLD<INT>, NAME<STRING>, DIFFICULTY<INT> (rank calculado com base na dificuldade dentro da clase quest)
	var q1 = nq.new()
	q1.setQuest(100,100,"Test Quest", 5)
	q1.questinfo = "Nice quest Info"
	myquests.append(q1)
	#####################################
	var q2 = nq.new()
	q2.setQuest(200,200,"Test Quest2", 15)
	q2.questinfo = "Nice quest Info2"
	myquests.append(q2)
	
	#########################################################################
	
	return myquests.pick_random()
	
func spawnNewAdventurer() -> adventurer:
	
	# cria um aventureiro teste
	const nadv = preload("res://Scripts/Classes/adventurer.gd")
	var auxnewa = adventurer.new()
	
	return auxnewa

	
func spawnNewEvent():
	pass
