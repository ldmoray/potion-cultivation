extends CanvasLayer

onready var InventoryManager = get_node("/root/InventoryManager")

export(String) var location: String

func _ready() -> void:
	set_location(location)
	InventoryManager.connect("inventory_changed", self, "_on_inventory_change")
	_on_inventory_change()

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
	$Control/InventoryPanel/Label.text = "Inventory: %s Flowers" % InventoryManager.flowers
