extends NinePatchRect

var adv_label = preload("res://Scenes/character_slot_mission_selection.tscn")
@onready var charactersContainer = $LeftPage_BG/ScrollContainer/CharacterSlotsContainer

## current quest infos
@onready var currQuestNameLabel = $RightPage_BG/QuestInfoPannel/QuestNameLabel
@onready var currQuestInfoLabel = $RightPage_BG/QuestInfoPannel/InfoLabel
@onready var currQuestRepLabel = $RightPage_BG/QuestInfoPannel/Reputation/Reputation
@onready var currQuestGoldLabel = $RightPage_BG/QuestInfoPannel/Gold/TotalGold


@onready var slot1 = $RightPage_BG/PartySlots/HBoxContainer/PartySlot
@onready var slot2 = $RightPage_BG/PartySlots/HBoxContainer/PartySlot2
@onready var slot3 = $RightPage_BG/PartySlots/HBoxContainer/PartySlot3
@onready var slot4 = $RightPage_BG/PartySlots/HBoxContainer/PartySlot4

@onready var playerSlots = [$RightPage_BG/PartySlots/HBoxContainer/PartySlot,$RightPage_BG/PartySlots/HBoxContainer/PartySlot2,$RightPage_BG/PartySlots/HBoxContainer/PartySlot3,$RightPage_BG/PartySlots/HBoxContainer/PartySlot4]

var has_been_visible_and_processed = false
var auxPartyCounter = 0


func _process(delta):
	
	#caso aconteça alguma mudança no rooster dos personagens selecionados pra quest atual
	if Globals.partyNow.size()!=auxPartyCounter:
		attPartyCharactersDisplay()
		attGuildCharacterStatus()
		auxPartyCounter = Globals.partyNow.size()
		
	## check pra atualizar os personagens disponiveis roda assim que ficar visivel a pagina
	if visible and not has_been_visible_and_processed:
		attGuildCharacterStatus()
		has_been_visible_and_processed = true

func attPartyCharactersDisplay():
	for i in range(0, 4):
		if Globals.partyNow.size()>i:
			playerSlots[i].setAdventurer(Globals.partyNow[i])
		else:
			playerSlots[i].clearAdventurerDisplay()

func attGuildCharacterStatus():
	## clear previous before populate
	var children = charactersContainer.get_children()
	for c in children:
		c.queue_free()
	## populate
	listGuildCharacters()

func listGuildCharacters():
	for adv in Globals.adventurers:
		#instancia uma nova quest label e coloca no container
		var advlabel = adv_label.instantiate()
		charactersContainer.add_child(advlabel)
		advlabel.setAdventurer(adv)

func _on_back_button_pressed() -> void:
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	has_been_visible_and_processed = false


func _on_start_quest_button_pressed() -> void:
	
	if Globals.partyNow.size()>=1:
		# calculate gold cost 
		var goldcost = 0
		for adv in Globals.partyNow:
			goldcost = adv.adv_fee + goldcost
			
		## if can pay
		if Globals.totalgold >= goldcost:
			## remove gold from character pay
			Globals.totalgold = Globals.totalgold - goldcost
		
			# adc os aventureiros na quest desejada
			for adv in Globals.partyNow:
				Globals.questAux.questAdventurers.append(adv)
				
			# da clear no partyAux e no quest aux
			Globals.partyNow.clear()
			Globals.startActiveQuest()
			
		get_tree().get_root().get_node("Main").changeBookPage("lobby")
		has_been_visible_and_processed = false
