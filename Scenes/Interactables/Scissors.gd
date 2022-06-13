extends GardenInteractable

func _ready() -> void:
	target_group = "Plant"

func _on_target_group_clicked(area) -> void:
	area.harvest()
