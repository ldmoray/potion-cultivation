extends GardenInteractable

var plant

func set_plant(path: String):
	if plant or is_locked:
		return
	var plant_scene = load(path)
	var instance = plant_scene.instance()
	$PlantPoint.add_child(instance)
	plant = $PlantPoint.get_child(0)
