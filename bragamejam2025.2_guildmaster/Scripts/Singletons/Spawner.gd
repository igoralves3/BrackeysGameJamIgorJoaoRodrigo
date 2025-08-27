extends Node


func spawnNewQuest() -> quest:
	
	const nq = preload("res://Scripts/Classes/quest.gd")
	var myquests = []
	## check requirements for spawn like rep min for upper ranks etcs 
	
	## modelo criação de quest
	## tem que criar uma variavel nova pra cada uma, lembrar problema duplicate no godot
	## set quest (REP<INT>, GOLD<INT>, NAME<STRING>, DIFFICULTY<INT> (rank calculado com base na dificuldade dentro da clase quest)
	
	"""
	var q1 = nq.new()
	q1.setQuest(100,100,"Test Quest", 5)
	q1.questinfo = "Nice quest Info"
	myquests.append(q1)
	#####################################
	var q2 = nq.new()
	q2.setQuest(200,200,"Test Quest2", 15)
	q2.questinfo = "Nice quest Info2"
	myquests.append(q2)
	"""
	
	var minumum_ranks_possible = 1
	
	
	
	if Globals.tierGuild == "Unlicensed":
		minumum_ranks_possible = 2
	if Globals.tierGuild == "Iron":
		minumum_ranks_possible = 3
	if Globals.tierGuild == "Bronze":
		minumum_ranks_possible = 4
	if Globals.tierGuild == "Silver":
		minumum_ranks_possible = 5
	if Globals.tierGuild == "Gold":
		minumum_ranks_possible = 6
	if Globals.tierGuild == "Platinum":
		minumum_ranks_possible = 7
	if Globals.tierGuild == "Diamond":
		minumum_ranks_possible = 7
		
	
		
	var max_quests = 5
	
	if minumum_ranks_possible >= 3 and minumum_ranks_possible <= 4:
		max_quests=6
	elif minumum_ranks_possible > 4:
		max_quests=7
		
	var n = randi_range(1,max_quests)
	for i in range(0,n-1):
		var rank = "F"
		var r = 0
		if Globals.tierGuild == "Unlicensed":
			r = randi_range(0,100)
			if r <= 40:
				rank = "F"
			else:
				rank = "E"
		if Globals.tierGuild == "Iron":
			r = randi_range(0,100)
			if r <= 10:
				rank = "F"
			elif r > 10 and r <= 50:
				rank = "E"
			else: 
				rank = "D"
		if Globals.tierGuild == "Bronze":
			r = randi_range(0,100)
			if r <= 10:
				rank = "E"
			elif r > 10 and r <= 60:
				rank = "D"
			else: 
				rank = "C"
		if Globals.tierGuild == "Silver":
			r = randi_range(0,100)
			if r <= 20:
				rank = "D"
			elif r > 20 and r <= 70:
				rank = "C"
			else: 
				rank = "B"
		if Globals.tierGuild == "Gold":
			r = randi_range(0,100)
			if r <= 20:
				rank = "C"
			elif r > 20 and r <= 60:
				rank = "B"
			else: 
				rank = "A"
		if Globals.tierGuild == "Platinum":
			r = randi_range(0,100)
			if r <= 30:
				rank = "B"
			elif r > 30 and r <= 95:
				rank = "A"
			else: 
				rank = "S"
		if Globals.tierGuild == "Diamond":
			r = randi_range(0,100)
			if r <= 50:
				rank = "A"
			elif r > 30 and r <= 95:
				rank = "S"
		#quest = rep, gold, name, diff,
		if rank == "F":
			var q1 = nq.new()
			q1.setQuest(2,20,"Test Quest 1", 0)
			q1.questinfo = "Nice quest Info"
			myquests.append(q1)
		if rank == "E":
			var q2 = nq.new()
			q2.setQuest(5,60,"Test Quest 2", 5)
			q2.questinfo = "Nice quest Info"
			myquests.append(q2)
		if rank == "D":
			var q3 = nq.new()
			q3.setQuest(15,300,"Test Quest 3", 20)
			q3.questinfo = "Nice quest Info"
			myquests.append(q3)
		if rank == "C":
			var q4 = nq.new()
			q4.setQuest(40,1000,"Test Quest 4", 80)
			q4.questinfo = "Nice quest Info"
			myquests.append(q4)
		if rank == "B":
			var q5 = nq.new()
			q5.setQuest(120,4000,"Test Quest 5", 240)
			q5.questinfo = "Nice quest Info"
			myquests.append(q5)
		if rank == "A":
			var q6 = nq.new()
			q6.setQuest(300,12000,"Test Quest 6", 720)
			q6.questinfo = "Nice quest Info"
			myquests.append(q6)
		if rank == "S":
			var q7 = nq.new()
			q7.setQuest(1500,50000,"Test Quest 7", 2880)
			q7.questinfo = "Nice quest Info"
			myquests.append(q7)
			
			
						
					
	
	#########################################################################
	
	return myquests.pick_random()
	
func spawnNewAdventurer() -> adventurer:
	# cria um aventureiro teste
	const nadv = preload("res://Scripts/Classes/adventurer.gd")
	var auxnewa = adventurer.new()
	
	var maleNames = ["Elres","Helman","Gaenbeornw","Sege","Helmund","Walter","Helre","Feiusi","Aerehrt","Ealfard","Mund","Tane","Gerey","Narder","Enryn","Alters","Georguy","Ames","Piersym","Frobert"]
	var female_names = ["Wigswe","Elell","Ewall","Bricthlu","Burhiua","Evell","Wulfwe","Saewe","Kather","Arran","Mindra","Wene","Burga","Joane","Cyna","Odgis","Cecie","Benne","Sarrey","Enen"]
	var surnames = ["Serpentstone","Boulderward","Rapidroar","Blazeblight","Springwing","Frozentalon","Smartflare","Simplesnarl","Pineshine","Duskbash","Roqueleilles",
		"Vizin","Dullac","Cregnon","Boisgefelon","Échefort","Échezac","Chabalot","Estieveron","Ravibannes","Crowhisk","Battlebough","Highspirit","Blazebash","Titanwater",
		"Sternglide","Blazeward","Noblebraid","Hydrahand","Frozenbow","Croissard","Sunne","Clarimtal","Massounie","Chavallon","Chananteau","Chamidras","Vernillevé","Lamagnon","Sublimpes"]
	
	var characterName = ""
	
	var coin_flip = randi_range(1,100) 
	## male
	if coin_flip >= 50:
		characterName = maleNames.pick_random() + " " +surnames.pick_random()
		auxnewa.setAdventurer(characterName,"male")
	else:
		characterName = female_names.pick_random() + " " +surnames.pick_random()
		auxnewa.setAdventurer(characterName,"female")
			
	return auxnewa

	
func spawnNewEvent():
	pass
