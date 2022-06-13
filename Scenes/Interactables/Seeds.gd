extends GardenInteractable


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_group = "Pot"

func _on_target_group_clicked(area) -> void:
	area.set_plant("res://Scenes/Interactables/PlantTest.tscn")
