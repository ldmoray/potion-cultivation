extends Node2D
class_name GardenInteractable

var active: bool = false
var target_group: String
export var is_locked := false
export var pickupable := false

func _on_Area2D_mouse_entered() -> void:
	$AnimatedSprite.play("selected")

func _on_Area2D_mouse_exited() -> void:
	$AnimatedSprite.play("default")

func _on_target_group_clicked(area: Area2D):
	pass

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not pickupable:
		return
	if event is InputEventMouseButton && event.is_pressed():
		if active:
			for area in $Area2D.get_overlapping_areas():
				if area.is_in_group(target_group):
					_on_target_group_clicked(area)
					return
			active = false
			position = Vector2(0,0)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			active = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _unhandled_input(event: InputEvent) -> void:
	if active && event is InputEventMouseMotion:
		global_position = event.position
