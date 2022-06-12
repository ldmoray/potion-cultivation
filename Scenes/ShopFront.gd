extends Node2D

onready var InventoryManager = get_node("/root/InventoryManager")

func _ready() -> void:
	$HUD.set_right_scene_path("res://Scenes/Garden.tscn")
	var dialog = Dialogic.start("TestTimeline")
	add_child(dialog)
	Dialogic.set_variable("Flowers", InventoryManager.flowers)
	dialog.connect("dialogic_signal", self, "dialog_listener")


func dialog_listener(signal_name: String):
	if signal_name == "flowers_changed":
		_on_flowers_changed()
		
func _on_flowers_changed():
	InventoryManager.flowers = int(Dialogic.get_variable("Flowers"))
