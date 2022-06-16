extends Node2D
class_name GardenInteractable

var active: bool = false
var target_group: String
export var is_locked := false setget set_is_locked
export var pickupable := false
export var unlock_cost := 0

func _ready() -> void:
	if has_node("Lock"):
		$Lock.visible = is_locked
		if has_node("Lock/Coin"):
			$Lock/Coin/Control/CC/Label.text = str(unlock_cost)

func set_is_locked(value: bool) -> void:
	is_locked = value
	$Lock.visible = is_locked

func _on_Area2D_mouse_entered() -> void:
	if is_locked && has_node("Lock"):
		$Lock/LockedSprite.play("unlock")
		if has_node("Lock/Coin"):
			$Lock/Coin/CoinSprite.play("selected")
	else:
		$AnimatedSprite.play("selected")

func _on_Area2D_mouse_exited() -> void:
	if is_locked && has_node("Lock"):
		$Lock/LockedSprite.play("locked")
		if has_node("Lock/Coin"):
			$Lock/Coin/CoinSprite.play("default")
	else:
		$AnimatedSprite.play("default")

func _on_target_group_clicked(area: Area2D):
	pass

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if is_locked && event is InputEventMouseButton && event.is_pressed():
		if InventoryManager.coins >= unlock_cost:
			self.is_locked = false
			InventoryManager.coins -= unlock_cost
			return
		else:
			AudioStreamManager.play_sfx("res://Assets/error.wav")
			return
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
