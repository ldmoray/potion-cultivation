extends Node2D

var loaded = false

func _ready() -> void:
	$HUD.set_right_scene_path("res://Scenes/Garden.tscn")
	InventoryManager.connect("inventory_changed", self, "_on_inventory_change")
	loaded = true
	start_dialog()

func start_dialog():
	var dialog = Dialogic.start(PlotManager.timelines[PlotManager.plot_state])
	add_child(dialog)
	_on_inventory_change()
	dialog.connect("dialogic_signal", self, "dialog_listener")
	dialog.connect("dialogic_signal", PlotManager, "dialog_listener")

func dialog_listener(signal_name: String):
	if signal_name == "flowers_changed":
		_on_flowers_changed()
	if signal_name == "coins_changed":
		_on_coins_changed()
		
func _on_flowers_changed():
	InventoryManager.flowers = int(Dialogic.get_variable("Flowers"))

func _on_coins_changed():
	InventoryManager.coins = int(Dialogic.get_variable("Coins"))
	
func _on_inventory_change():
	Dialogic.set_variable("Flowers", InventoryManager.flowers)
	Dialogic.set_variable("Coins", InventoryManager.coins)

func _enter_tree() -> void:
	if not loaded:
		return
	start_dialog()
