extends Area2D

var growth = ["default", "partial", "full"]
var cut_growth = ["default", "cut", "fullcut"] 

var growth_path = growth

var curr_growth = 0

func grow():
	if curr_growth == len(growth_path) - 1:
		return
	curr_growth += 1
	$AnimatedSprite.play(growth_path[curr_growth])

func harvest():
	if not curr_growth == len(growth_path) - 1:
		return
	if growth_path == growth:
		InventoryManager.flowers += 1
	elif growth_path == cut_growth:
		InventoryManager.flowers += 3
	growth_path = cut_growth
	curr_growth -= 1
	$AnimatedSprite.play(growth_path[curr_growth])

	
