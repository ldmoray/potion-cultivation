extends Area2D


var plant: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_Pot_mouse_entered() -> void:
	$AnimatedSprite.play("selected")

func _on_Pot_mouse_exited() -> void:
	$AnimatedSprite.play("default")

func _on_Pot_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass

func set_plant(path: String):
	if plant:
		print("already full")
		return
	var plant_scene = load(path)
	var instance = plant_scene.instance()
	$PlantPoint.add_child(instance)
	plant = $PlantPoint.get_child(0)
