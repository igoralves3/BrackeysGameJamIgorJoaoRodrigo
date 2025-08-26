extends Control

@onready var advCostLabel = $LabelCost
@onready var advRankLabel = $LabelRank
@onready var advNameLabel = $InfoContainer/LabelName

func setAdventurer(adv: adventurer):
	advCostLabel.text = str(adv.adv_fee)
	advRankLabel.text = "Rank: " + str(adv.rank)
	advNameLabel.text = adv.adv_name
