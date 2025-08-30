extends Node


func spawnNewQuest() -> quest:
	
	const nq = preload("res://Scripts/Classes/quest.gd")
	var rank = "F"
	var r = 0
	
	var qt = nq.new()
	qt.setQuest(2,20,"Test Default", 1)
	qt.questinfo = "Nice quest Info"
	
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
		var myQuests = []
		var q1 = nq.new()
		q1.setQuest(2,20,"Pest Problems", 1)
		q1.questinfo = "The town tavern has a desperate infestation of cellar rats. They're not monsters, merely repulsively large rodents, but his patrons are complaining. they require a few `brave` adventurers to deal with this infestation. Pay is a few coins and a free round of ale."
		myQuests.append(q1)
		
		var q2 = nq.new()
		q2.setQuest(2,20,"The Missing Pie", 1)
		q2.questinfo = "The baker had one of her special pies on her windowsill. And in an instant, it disappeared! She blames a street urchin or a very brazen stray dog. She needs someone to go around the block, ask some questions, and recover the pastry, if it still exists..."
		myQuests.append(q2)		

		var q3 = nq.new()
		q3.setQuest(2,20,"Shovel Brigade", 1)
		q3.questinfo = "The horse stable keepers in the city need some help with a... delicate procedure. They are full of manure, and the stablehands have threatened to walk out. The guild is being offered a smelly but straightforward job: shovel the day away, loading carts with horse manure for the city gardens. Iron stomach and sturdy shoes recommended."
		myQuests.append(q3)	

		var q4 = nq.new()
		q4.setQuest(2,20,"Weed Warriors", 1)
		q4.questinfo = "The Royal Gardener is inundated with a stubborn type of weed infesting the rose bushes of the castle. He needs some delicate hands to spend the afternoon pulling them out without damaging the precious roses. Gloves will be distributed."
		myQuests.append(q4)	
		
		var q5 = nq.new()
		q5.setQuest(2,20,"A Noble's Notion", 1)
		q5.questinfo = "Lady Elara has lost her beloved silver locket somewhere in the garden of her estate. It is greatly valued by her. She needs someone with a keen eye to search for its return."
		myQuests.append(q5)	
		
		var q6 = nq.new()
		q6.setQuest(2,20,"Town Crier's Assistant", 1)
		q6.questinfo = "The town crier's voice is hoarse from shouting yesterday's headlines. He needs help in distributing printed copies of the new royal proclamation to each of the various notice boards around the city. Plenty of walking, but no danger involved."
		myQuests.append(q6)	
		
		var q7 = nq.new()
		q7.setQuest(2,20,"The Noble Kid's Party", 1)
		q7.questinfo = "The Astor family is celebrating the birthday of little Thomas, and he DEMANDS a great hero to appear at his party. This shall be a venture of great ease. 1 day"
		myQuests.append(q7)	
		
		var q8 = nq.new()
		q8.setQuest(2,20,"Ointment's Ingredients", 1)
		q8.questinfo = "The herbalist is in need of some specific herbs to prepare a few ointments. He is the only one at his shop and can't leave it without anyone, that's why he is looking for some helping hands to gather those herbs in the nearby forest."
		myQuests.append(q8)		
			
		return myQuests.pick_random()
		
	if rank == "E":
		var myQuests = []
		
		var q1 = nq.new()
		q1.setQuest(5,60,"Boar Bashing", 10)
		q1.questinfo = "There is one great big wild boar that has been raiding the turnips of a nearby farm. Too much for a farmer to handle. A professional adventurer is needed to chase the beast into the woods, kill it, and hopefully bring back some bacon."
		myQuests.append(q1)
		
		var q2 = nq.new()
		q2.setQuest(5,60,"A Light in the Dark", 10)
		q2.questinfo = "The lamplighters' union is short-staffed. They need an adventurer to serve as an armed bodyguard for their novice members, who will be lighting the night lamps in the somewhat shady sections of the merchant quarter. The work is mostly to look threatening and frighten away chance pickpockets."
		myQuests.append(q2)
		
		var q3 = nq.new()
		q3.setQuest(5,60,"Murky Water", 10)
		q3.questinfo = "There is something clogging the water grate to the city's sweers, and the water is getting polluted. The city guards are too occupied to deal with it. They need a guild to send someone into the shallow waterway to clear the obstruction. It probably is just an accumulation of silt and some dead animals, but who knows what you may find in the way..."
		myQuests.append(q3)		

		#var q4 = nq.new()
		#q4.setQuest(5,60,"Batty Belfry", 5)
		#q4.questinfo = "The central cathedral bell tower has been infested by a screaming colony of bats. 
		#They are disrupting services and their squeaks are making a mess. 
		#the clergy require someone to scale the tower and coax the colony out and relocate them to a new home, preferably without killing them."
		#myQuests.append(q4)
		
		var q5 = nq.new()
		q5.setQuest(5,60,"Stall Security", 10)
		q5.questinfo = "The blacksmith, needs to attend a funeral but can't abandon his market stall unattended. 
		He needs a hard-looking adventurer to stand watch over his wares for an hour or so. 
		The job is to look threatening and ensure that nobody steals a sword."
		myQuests.append(q5)
		
		return myQuests.pick_random()
		
	if rank == "D":
		var myQuests = []
		
		var q1 = nq.new()
		q1.setQuest(15,300,"Graveyard Shift", 40)
		q1.questinfo = "There have been reports of odd scratching noises coming from the biggest mausoleum in the graveyard at night. The caretaker is certain that it is ghouls. A group is needed to sit through the night, locate the source of the sound, and put to rest whatever is disturbring."
		myQuests.append(q1)

		var q2 = nq.new()
		q2.setQuest(15,300,"Wolves at the Door", 40)
		q2.questinfo = "A pack of wolves has been raiding livestock from the surrounding farms. A shepherd boy went missing last night. The guild's mission is to hunt down this pack before they get up the courage to attack the hamlet itself."
		myQuests.append(q2)

		var q3 = nq.new()
		q3.setQuest(15,300,"Kobold Kleptomaniacs", 40)
		q3.questinfo = "A group of kobolds have taken up residence in the copper mine and are known to steal anything shiny. The foreman of the mine would like them gone so his workers can get back to work without having to forfeit all of their tools."
		myQuests.append(q3)
	
		var q4 = nq.new()
		q4.setQuest(15,300,"The Lumberjack's Bane", 40)
		q4.questinfo = "Giant spiders have spun thick, impenetrable webs across the lumberjacks' camp, halting logging operations. The guild needs to move in, burn the webs, and trample the spiders behind them."
		myQuests.append(q4)
		
		var q5 = nq.new()
		q5.setQuest(15,300,"The South Road Scoundrels", 40)
		q5.questinfo = "There is a small, unorganized group of bandits who have been attacking travelers on the main road south of the city. The guards can't patrol that far south. A party is needed to set an ambush and return with the leader of the bandits."
		myQuests.append(q5)

		return myQuests.pick_random()
		
	if rank == "C":
		var myQuests = []
		
		var q1 = nq.new()
		q1.setQuest(40,1000,"The Ogre of the Bridge", 160)
		q1.questinfo = "A hostile ogre has made its lair under the Old King's Bridge, It's been demanding a toll of all passerby and wrecking the wagons of any who refuse to pay. The merchant guild has put up a substantial bounty for a party of adventurers strong enough to remove this nuisance for good."
		myQuests.append(q1)
		
		var q2 = nq.new()
		q2.setQuest(40,1000,"The Old Manor", 160)
		q2.questinfo = "Lord Harrington's country manor house has fallen silent. There have been no servants for a week, and letters are not being replied to. He asks a discreet party to go and investigate. Discretion is advised."
		myQuests.append(q2)
		
		var q3 = nq.new()
		q3.setQuest(40,1000,"The Ransom of Blackwood Pass", 160)
		q3.questinfo = "Bandits have kidnapped a wealthy merchant's son and are seeking ransom in their hidden hideout in Blackwood Pass. The merchant would prefer that his son be returned and that the bandits be taught a lesson they will never forget."
		myQuests.append(q3)
		
		var q4 = nq.new()
		q4.setQuest(40,1000,"Harpy Peak", 160)
		q4.questinfo = "A flock of harpies has built nests in the cliffs overlooking the sheep pastures. The ranchers need a party to climb the treacherous cliffs, burn out the nests, and drive off the harpy matriarch."
		myQuests.append(q4)
		
		var q5 = nq.new()
		q5.setQuest(40,1000,"The Smuggler's Stash", 160)
		q5.questinfo = "The City Guard has received a tip about a smuggler's cave on the coast that is importing untaxed goods. They lack the manpower for a raid and have outsourced the job to the guild. Clear out the smugglers and seize their contraband for a profit share."
		myQuests.append(q5)
		
		var q6 = nq.new()
		q6.setQuest(40,1000,"An Orcish Incursion", 160)
		q6.questinfo = "A warband of orcs has been raiding homesteads to the east. They are hardened fighters and well-equipped. The guild must track them back to their temporary encampment and slay them."
		myQuests.append(q6)
		
		return myQuests.pick_random()
		
	if rank == "B":
		var myQuests = []
		
		var q1 = nq.new()
		q1.setQuest(120,4000,"The Wyvern of the Peaks", 480)
		q1.questinfo = "A young wyvern has been spotted nesting nearby an operating mine, attacking mining caravans and threatening villages close by. The King has placed a bounty on its head."
		myQuests.append(q1)
		
		var q2 = nq.new()
		q2.setQuest(120,4000,"The Serpent in the Sewers", 480)
		q2.questinfo = "The capital's sewer system workers are being stalked. Entire crews are vanishing without a trace.The city is frightened that a basilisk has occupied the sewer as its lair. A team of reliable heroes is needed to venture into the depths and put the beast out of business."
		myQuests.append(q2)
		
		var q3 = nq.new()
		q3.setQuest(120,4000,"An Eye for an Eye", 480)
		q3.questinfo = "The Guild of Thieves has stolen a precious artifact, from the Royal Vault. The Captain of the Guard would prefer having it back, quietly. The guild must locate their hidden lair, break through its traps and guards, and steal the artifact back."
		myQuests.append(q3)
		
		var q4 = nq.new()
		q4.setQuest(120,4000,"The Haunted Battlefield", 480)
		q4.questinfo = "The ghostly remnants of dead warriors have come back from the battlefields of an old war, their spirit armies haunting a nearby village. A combat-exorcism team has to find the source of the haunting and rest the dead."
		myQuests.append(q4)
		
		var q5 = nq.new()
		q5.setQuest(120,4000,"Manticore Menace", 480)
		q5.questinfo = "A monstrous manticore has appeared in the canyons, making the eastern trade trail impassable. Caravan masters are offering a small fortune to any group of adventurers brave enough to hunt and kill the fabled beast."
		myQuests.append(q5)
		
		var q6 = nq.new()
		q6.setQuest(120,4000,"A Scholar's Shield", 480)
		q6.questinfo = "A master Arcanist is on the verge of a major magical discovery and has attracted the attention of assassins who have made him their target. The Mages' Guild requires an escort team to protect him, fending off all and any attacks on his life."
		myQuests.append(q6)
		return myQuests.pick_random()
		
	if rank == "A":
		var myQuests = []
		
		var q1 = nq.new()
		q1.setQuest(300,12000,"The Whispering Crypt", 1440)
		q1.questinfo = "The ancient lich was thought vanquished centuries ago. An elite band must infiltrate the crypt, battle their way past hordes of his most powerful undead servants, and destroy the phylactery of the lich before his power is fully restored."
		myQuests.append(q1)
		
		var q2 = nq.new()
		q2.setQuest(300,12000,"The Crimson Tribute", 1440)
		q2.questinfo = "A mature red dragon has awakened. It takes a levy of gold and livestock from neighboring farms, reducing to ashes those who disobey. The realm needs a team of mythic heroes to do the impossible: slay a great dragon."
		myQuests.append(q2)
		
		var q3 = nq.new()
		q3.setQuest(300,12000,"The Starless Ritual", 1440)
		q3.questinfo = "A doomsday cult is preparing to conduct a ritual to darken the sun. Their leader, a high priest, is calling upon vast power from forbidden magic. The guild must fight their way past a legion of cultists and stop the high priest."
		myQuests.append(q3)
		
		var q4 = nq.new()
		q4.setQuest(300,12000,"The Gorgon's Gaze", 1440)
		q4.questinfo = "Travelers and warriors alike have been found petrified along a river. All signs point to a medusa having made herself comfortable in the nearby cavern complex. A professional team with mirrored shields and unshakeable courage must go in and end her reign."
		myQuests.append(q4)

		var q5 = nq.new()
		q5.setQuest(300,12000,"The Sunken City's Secret", 1440)
		q5.questinfo = "A long-lost submerged city has partially emerged after a recent earthquake. They say that it is where a powerful magical Trident lies in secret. The city is guarded by enraged merfolk warriors and sea serpents.A guild is required to capture the Trident."
		myQuests.append(q5)
		
		var q6 = nq.new()
		q6.setQuest(300,12000,"The Vampire Lord", 1440)
		q6.questinfo = "An old and isolated count, has been found to be a powerful vampire lord. His thralls and night beasts terrorize the inhabitants. A band of heroes will be forced to infiltrate his castle and drive a stake into his cold, dead heart."
		myQuests.append(q6)
		
		return myQuests.pick_random()
		
	if rank == "S":
		var myQuests = []
		
		var q1 = nq.new()
		q1.setQuest(1500,50000,"The Breach at World's Edge", 3900)
		q1.questinfo = "The Demon King's armies have finally broken through the dimensional front. A gigantic portal has opened at the pole, spewing forth armies of demons. One small, elite force—the world's best—is left to fight through the horde of demons and learn how to close the portal on their side. The world will be lost if they lose."
		myQuests.append(q1)
		
		var q2 = nq.new()
		q2.setQuest(1500,50000,"The Tyrant's Heart", 3900)
		q2.questinfo = "The Demon King himself has taken to the field, his forces being led by him from a captured fortress. He is a force not to be denied. The armies of the alliance can only hold him off for so long. One group of the land's strongest heroes must go on a suicide mission: infiltrate behind the enemy lines, penetrate the fortress, and eliminate the Demon King in hand-to-hand combat."
		myQuests.append(q2)
		
		var q3 = nq.new()
		q3.setQuest(1500,50000,"The Withering Plague", 3900)
		q3.questinfo = "A plague of magic has been unleashed that not only kills—it resurrects. The resurrected march as ghouls, and the plague passes with each mouthful. Whole cities are crumbling in a single night. Magical divination has pinpointed the origin to an arch-necromancer. The guild will have to kill the necromancer."
		myQuests.append(q3)
		
		var q4 = nq.new()
		q4.setQuest(1500,50000,"The Tarrasque's Wake", 3900)
		q4.questinfo = "The sleeping, city-destroying beast known as the Tarrasque has awakened and is rampaging a trail of destruction down on the capital. Armies are powerless against its impenetrable hide. The only hope for the kingdom is to have a party of heroes find a legendary artifact or exploit an alleged weakness to slay the monster."
		myQuests.append(q4)
		
		#var q5 = nq.new()
		#q5.setQuest(1500,50000,"The Stars Align", 3900)
		#q5.questinfo = "A cosmic alignment is allowing an evil, supernatural force to gain a grip on the world of mortals, distorting reality and driving people insane. 
		#The party will need to travel to the peaks of the highest mountains to break the system of ancient monoliths as a conduit, severing the connection before the world is wholly rewritten in its nightmarish image."
		#myQuests.append(q5)
		
		var q6 = nq.new()
		q6.setQuest(1500,50000,"The Dragon Queen's Edict", 3900)
		q6.questinfo = "Tiamat, mother of all evil dragons, has instructed her offspring around the globe to begin the great cleansing, a co-ordinated assault to reduce kingdoms of man to ash. The one way to stop the rampage is to battle the Dragon Queen in person in her throne room."
		myQuests.append(q6)		
		return myQuests.pick_random()
			
	return qt
	
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
	var newAdvRank = "F"
	var chance = 0
	
	match Globals.tierGuild:
		"Unlicensed":
			chance = randi_range(0,100)
			if chance <= 30:
				newAdvRank = "E"
			else:
				newAdvRank = "F"
		"Iron":
			chance = randi_range(0,100)
			if chance <= 20:
				newAdvRank = "F"
			elif chance > 20 and chance <= 70:
				newAdvRank = "E"
			else:
				newAdvRank = "D"
		"Bronze":
			chance = randi_range(0,100)
			if chance <= 20:
				newAdvRank = "E"
			elif chance > 20 and chance <= 70:
				newAdvRank = "D"
			else:
				newAdvRank = "C"
		"Silver":
			chance = randi_range(0,100)
			if chance <= 20:
				newAdvRank = "D"
			elif chance > 20 and chance <= 70:
				newAdvRank = "C"
			else:
				newAdvRank = "B"
		"Gold":
			chance = randi_range(0,100)
			if chance <= 20:
				newAdvRank = "C"
			elif chance > 20 and chance <= 70:
				newAdvRank = "B"
			else:
				newAdvRank = "A"
		"Platinum":
			chance = randi_range(0,100)
			if chance <= 40:
				newAdvRank = "B"
			elif chance > 40 and chance <= 90:
				newAdvRank = "A"
			else:
				newAdvRank = "S"
		"Diamond":
			chance = randi_range(0,100)
			if chance <= 60:
				newAdvRank = "A"
			else:
				newAdvRank = "S"		
					
	var coin_flip = randi_range(1,100) 
	## male
	if coin_flip >= 50:
		characterName = maleNames.pick_random() + " " +surnames.pick_random()
		auxnewa.setAdventurer(characterName,"male",newAdvRank)
	else:
		characterName = female_names.pick_random() + " " +surnames.pick_random()
		auxnewa.setAdventurer(characterName,"female",newAdvRank)
		
	return auxnewa



func spawnTestPool():
	
	## ADVENTURERS TEST
	const nadv = preload("res://Scripts/Classes/adventurer.gd")
	var auxnewa = adventurer.new()
	auxnewa.setAdventurer("Adv Rank F","male","F")
	Globals.knownAdventurers.append(auxnewa)
	
	auxnewa = adventurer.new()
	auxnewa.setAdventurer("Adv Rank E","male","E")
	Globals.knownAdventurers.append(auxnewa)
	
	auxnewa = adventurer.new()
	auxnewa.setAdventurer("Adv Rank D","male","D")
	Globals.knownAdventurers.append(auxnewa)
	
	auxnewa = adventurer.new()
	auxnewa.setAdventurer("Adv Rank C","male","C")
	Globals.knownAdventurers.append(auxnewa)
	
	auxnewa = adventurer.new()
	auxnewa.setAdventurer("Adv Rank B","male","B")
	Globals.knownAdventurers.append(auxnewa)
	
	auxnewa = adventurer.new()
	auxnewa.setAdventurer("Adv Rank A","male","A")
	Globals.knownAdventurers.append(auxnewa)
	
	auxnewa = adventurer.new()
	auxnewa.setAdventurer("MISTER S","male","S")
	Globals.knownAdventurers.append(auxnewa)
	
	
	const nq = preload("res://Scripts/Classes/quest.gd")
	
	## F
	var q = nq.new()
	q.setQuest(2,20,"Quest Test F", 1)
	q.questinfo = "Quest Test Rank: F"
	Globals.availableQuests.append(q)
	
	## E
	q = nq.new()
	q.setQuest(5,60,"Quest Test E", 10)
	q.questinfo = "Quest Test Rank: E"
	Globals.availableQuests.append(q)
	
	
	
	## D
	q = nq.new()
	q.setQuest(15,300,"Quest Test D", 40)
	q.questinfo = "Quest Test Rank: D"
	Globals.availableQuests.append(q)
	
	
	## C
	q = nq.new()
	q.setQuest(40,1000,"Quest Test C", 160)
	q.questinfo = "Quest Test Rank: C"
	Globals.availableQuests.append(q)
	
	## B
	q = nq.new()
	q.setQuest(120,4000,"Quest Test B", 480)
	q.questinfo = "Quest Test Rank: B"
	Globals.availableQuests.append(q)
	
	## A
	q = nq.new()
	q.setQuest(300,12000,"Quest Test A", 1440)
	q.questinfo = "Quest Test Rank: A"
	Globals.availableQuests.append(q)
	
	## S
	q = nq.new()
	q.setQuest(1500,50000,"Quest Test S", 3900)
	q.questinfo = "Quest Test Rank: S"
	Globals.availableQuests.append(q)
