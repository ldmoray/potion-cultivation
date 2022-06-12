extends Area2D

onready var InventoryManager = get_node("/root/InventoryManager")

var growth = ["default", "partial", "full"]
var curr_growth = 0

func grow():
	if curr_growth == len(growth) - 1:
		return
	curr_growth += 1
	$AnimatedSprite.play(growth[curr_growth])

func harvest():
	if not curr_growth == len(growth) - 1:
		return
	curr_growth -= 1
	$AnimatedSprite.play(growth[curr_growth])
	InventoryManager.flowers += 1
	
