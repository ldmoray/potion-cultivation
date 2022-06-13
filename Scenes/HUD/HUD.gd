extends CanvasLayer

export(String) var location: String

func _ready() -> void:
	set_location(location)
	InventoryManager.connect("inventory_changed", self, "_on_inventory_change")
	PlotManager.connect("day_changed", self, "_on_day_change")
	_on_inventory_change()
	_on_day_change()

func set_right_scene_path(path: String):
	$Control/TravelRight.scene_path = path
	$Control/TravelRight.disabled = false
	$Control/TravelRight.visible = true
	$Control/TravelRightWarn.visible = true

func set_left_scene_path(path: String):
	$Control/TravelLeft.scene_path = path
	$Control/TravelLeft.disabled = false
	$Control/TravelLeft.visible = true
	$Control/TravelLeftWarn.visible = true

func set_location(name: String):
	$Control/LocationPanel/Label.text = name

func _on_inventory_change():
	$Control/InventoryPanel/FlowersLabel.text = "Flowers: %s" % InventoryManager.flowers
	$Control/InventoryPanel/CoinLabel.text = "Coins: %s" % InventoryManager.coins

func _on_day_change():
	$Control/DayPanel/Label.text = "Day %s" % PlotManager.day

func _on_GrowButton_pressed() -> void:
	for plant in get_tree().get_nodes_in_group("Plant"):
		plant.grow()



func _on_NextDayButton_pressed() -> void:
	_on_GrowButton_pressed()
	GameManager.goto_scene("res://Scenes/Sleep.tscn")
