extends Node

signal inventory_changed

var flowers: int = 0 setget set_flowers, get_flowers
var coins: int = 0 setget set_coins, get_coins

func set_flowers(new_value: int):
	flowers = new_value
	emit_signal("inventory_changed")

func get_flowers() -> int:
	return flowers

func set_coins(new_value: int):
	coins = new_value
	emit_signal("inventory_changed")

func get_coins() -> int:
	return coins
