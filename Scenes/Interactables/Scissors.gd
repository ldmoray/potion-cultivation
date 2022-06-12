extends Area2D


var active: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_Scissors_mouse_entered() -> void:
	$AnimatedSprite.play("selected")

func _on_Scissors_mouse_exited() -> void:
	$AnimatedSprite.play("default")

func _on_Scissors_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if active:
			for area in get_overlapping_areas():
				if area.is_in_group("Plant"):
					area.harvest()
			active = false
			position = Vector2(0,0)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			active = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _unhandled_input(event: InputEvent) -> void:
	if active && event is InputEventMouseMotion:
		global_position = event.position
