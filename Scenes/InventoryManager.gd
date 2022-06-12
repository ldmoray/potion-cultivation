extends Node

signal inventory_changed

var flowers: int = 0 setget set_flowers, get_flowers

func set_flowers(new_value: int):
	flowers = new_value
	emit_signal("inventory_changed")

func get_flowers() -> int:
	return flowers
