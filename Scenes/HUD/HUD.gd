extends CanvasLayer

export(String) var location: String

func _ready() -> void:
	set_location(location)
	InventoryManager.connect("inventory_changed", self, "_on_inventory_change")
	PlotManager.connect("day_changed", self, "_on_day_change")
	_on_inventory_change()
	_on_day_change()

func set_right_scene_path(path: String):
	$HUD/TravelRight.scene_path = path
	$HUD/TravelRight.disabled = false
	$HUD/TravelRight.visible = true
	$HUD/TravelRightWarn.visible = true

func set_left_scene_path(path: String):
	$HUD/TravelLeft.scene_path = path
	$HUD/TravelLeft.disabled = false
	$HUD/TravelLeft.visible = true
	$HUD/TravelLeftWarn.visible = true

func set_location(name: String):
	$HUD/LocationPanel/Label.text = name

func _on_inventory_change():
	$HUD/InventoryPanel/FlowersLabel.text = "Flowers: %s" % InventoryManager.flowers
	$HUD/InventoryPanel/CoinLabel.text = ": %s" % InventoryManager.coins

func _on_day_change():
	$HUD/DayPanel/Label.text = "Day %s" % PlotManager.day

func _on_GrowButton_pressed() -> void:
	get_tree().call_group("Plant", "grow")
	GameManager.call_sleeping_group("Plant", "grow")

func _on_NextDayButton_pressed() -> void:
	_on_GrowButton_pressed()
	GameManager.goto_scene("res://Scenes/Sleep.tscn")

