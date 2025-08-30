extends NinePatchRect

var adv_label = preload("res://Scenes/Components/character_slot_mission_selection.tscn")
@onready var charactersContainer = $LeftPage_BG/ScrollContainer/CharacterSlotsContainer

## current quest infos
@onready var currQuestNameLabel = $RightPage_BG/QuestInfoPannel/QuestNameLabel
@onready var currQuestInfoLabel = $RightPage_BG/QuestInfoPannel/InfoLabel
@onready var currQuestRepLabel = $RightPage_BG/QuestInfoPannel/Reputation/Reputation
@onready var currQuestGoldLabel = $RightPage_BG/QuestInfoPannel/Gold/TotalGold


@onready var successIndicatorLabel = $RightPage_BG/PartySlots/VBoxContainer/OutcomeContainer/SuccessChance/TextureRect/SuccessIndicatorLabel
@onready var PayValueLabel = $RightPage_BG/PartySlots/VBoxContainer/OutcomeContainer/BalanceAfterPayouts/TextureRect/Payout/PayValue
@onready var FeeValueLabel = $RightPage_BG/PartySlots/VBoxContainer/OutcomeContainer/BalanceAfterPayouts/TextureRect/Fee/FeeValue
@onready var TotalValueLabel = $RightPage_BG/PartySlots/VBoxContainer/OutcomeContainer/BalanceAfterPayouts/TextureRect/Total/TotalValue


@onready var playerSlots = [$RightPage_BG/PartySlots/VBoxContainer/HBoxContainer/PartySlot,
							$RightPage_BG/PartySlots/VBoxContainer/HBoxContainer/PartySlot2,
							$RightPage_BG/PartySlots/VBoxContainer/HBoxContainer/PartySlot3,
							$RightPage_BG/PartySlots/VBoxContainer/HBoxContainer/PartySlot4]
							
@onready var outComeContainer = $RightPage_BG/PartySlots/VBoxContainer/OutcomeContainer

var has_been_visible_and_processed = false
var auxPartyCounter = 0


func _process(delta):
	
	#caso aconteça alguma mudança no rooster dos personagens selecionados pra quest atual
	if Globals.partyNow.size()!=auxPartyCounter and Globals.questAux!=null:
		$RightPage_BG/CantPay.visible = false
		attPartyCharactersDisplay()
		attGuildCharacterStatus()
		attQuestChancesandPayouts()
		auxPartyCounter = Globals.partyNow.size()
		if Globals.partyNow.size() > 0:
			attQuestChancesandPayouts()
			if canPayFee():
				$RightPage_BG/StartQuestButton.visible = true
				$RightPage_BG/CantPay.visible = false
			else:
				$RightPage_BG/StartQuestButton.visible = false
				$RightPage_BG/CantPay.visible = true
		else:
			outComeContainer.visible = false
			$RightPage_BG/StartQuestButton.visible = false
		
	## check pra atualizar os personagens disponiveis roda assim que ficar visivel a pagina
	if visible and not has_been_visible_and_processed:
		attGuildCharacterStatus()
		attQuestInfos()
		
		has_been_visible_and_processed = true

func attQuestChancesandPayouts():

	outComeContainer.visible = true
	## quest success calculation
	var total_party_power = 0
	for quest_adv in Globals.questAux.questAdventurers:
		total_party_power += quest_adv.power
		
	var auxdiff = total_party_power - Globals.questAux.difficulty
	var percentile = roundi(Globals.questAux.difficulty/100)
	if percentile == 0:
		percentile = 1
	var succChance = auxdiff/percentile

	if Globals.questAux.Rank == "F":
		print("here if f")
		successIndicatorLabel.text = "VERY LIKELY"
		successIndicatorLabel.self_modulate = Color("55a965")
		Globals.questAux.chanceOfSuccess = "VERY LIKELY"
	else:
		print("here else")
		if succChance < -80:
			successIndicatorLabel.text = "VERY UNLIKELY"
			successIndicatorLabel.self_modulate = Color("ff1508")
			Globals.questAux.chanceOfSuccess = "VERY UNLIKELY"
		elif succChance < -80 and succChance > -30:
			successIndicatorLabel.text = "UNLIKELY"
			successIndicatorLabel.self_modulate = Color("e04037")
			Globals.questAux.chanceOfSuccess = "UNLIKELY"
		elif succChance == 0:	
			successIndicatorLabel.text = "EVEN ODDS"
			successIndicatorLabel.self_modulate = Color("e06324")
			Globals.questAux.chanceOfSuccess = "EVEN ODDS"
		elif succChance > 30 and succChance < 80:
			successIndicatorLabel.text = "LIKELY"
			successIndicatorLabel.self_modulate = Color("3b7a47")
			Globals.questAux.chanceOfSuccess = "LIKELY"
		elif succChance > 80:
			successIndicatorLabel.text = "VERY LIKELY"
			successIndicatorLabel.self_modulate = Color("55a965")
			Globals.questAux.chanceOfSuccess = "VERY LIKELY"


	## pay information indicators
	PayValueLabel.text = "+" + str(Globals.questAux.gold)
	var feeTotalValue = 0
	for adv in Globals.partyNow:
		feeTotalValue = feeTotalValue + adv.getAdventurerFee()
		
	FeeValueLabel.text = str(feeTotalValue*-1)
	TotalValueLabel.text = str((feeTotalValue*-1) + Globals.questAux.gold)

func attQuestInfos():
	currQuestNameLabel.text = str(Globals.questAux.questname)
	currQuestInfoLabel.text = str(Globals.questAux.questinfo)
	currQuestRepLabel.text = str(Globals.questAux.rep)
	currQuestGoldLabel.text = str(Globals.questAux.gold)

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
	for adv in Globals.availbleAdventurers:
		#print(str(Globals.availbleAdventurers.size()))
		#instancia uma nova quest label e coloca no container
		var advlabel = adv_label.instantiate()
		charactersContainer.add_child(advlabel)
		advlabel.setAdventurer(adv)

func canPayFee():
	
	var goldcost = 0
	for adv in Globals.partyNow:
		goldcost = adv.getAdventurerFee() + goldcost	
		
	## if can pay
	if Globals.totalgold >= goldcost:
			return true	
	return false


func _on_back_button_pressed() -> void:
	
	for p in playerSlots:
		p._on_pressed()
	
	outComeContainer.visible = false
	attPartyCharactersDisplay()
	attGuildCharacterStatus()
	$RightPage_BG/CantPay.visible = false
	#Globals.removeParty(localAdvReference)
	
	get_tree().get_root().get_node("Main").changeBookPage("lobby")
	SoundManager.pickButtonSFX(randi() % 3)
	has_been_visible_and_processed = false


func _on_start_quest_button_pressed() -> void:
	
	if Globals.partyNow.size()>=1:
		# calculate gold cost 
		var goldcost = 0
		for adv in Globals.partyNow:
			goldcost = adv.getAdventurerFee() + goldcost
			
		## if can pay
		if Globals.totalgold >= goldcost:
			## remove gold from character pay
			Globals.totalgold = Globals.totalgold - goldcost
		
			# adc os aventureiros na quest desejada
			for adv in Globals.partyNow:
				Globals.questAux.addAdventurer(adv)
				
			# da clear no partyAux e no quest aux
			Globals.partyNow.clear()
			Globals.startActiveQuest()
	
			get_tree().get_root().get_node("Main").changeBookPage("lobby")
			SoundManager.pickButtonSFX(randi() % 3)
			has_been_visible_and_processed = false


func _on_start_quest_button_mouse_entered() -> void:
	$RightPage_BG/StartQuestButton/StartQuestLabel.modulate = Color("d2b1b0")
	$RightPage_BG/StartQuestButton/TextureRect.texture = load("res://Resources/Sprites/UI_TravelBook_IconArrow01a-1PRESSED.png")

func _on_start_quest_button_mouse_exited() -> void:
	$RightPage_BG/StartQuestButton/StartQuestLabel.modulate = Color("ffffff")
	$RightPage_BG/StartQuestButton/TextureRect.texture = load("res://Resources/Sprites/UI_TravelBook_IconArrow01a.png")

func _on_back_button_mouse_entered() -> void:
	$LeftPage_BG/BackButton/BackToLobbyLabel.modulate = Color("d2b1b0")
	$LeftPage_BG/BackButton/TextureRect.texture = load("res://Resources/Sprites/UI_TravelBook_IconArrow01a-1PRESSED.png")

func _on_back_button_mouse_exited() -> void:
	$LeftPage_BG/BackButton/BackToLobbyLabel.modulate = Color("ffffff")
	$LeftPage_BG/BackButton/TextureRect.texture = load("res://Resources/Sprites/UI_TravelBook_IconArrow01a.png")
