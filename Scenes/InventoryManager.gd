extends Node

signal inventory_changed

var flowers: int = 0 setget set_flowers, get_flowers
var coins: int = 0 setget set_coins, get_coins

func _ready():
	Console.add_command("setFlowers", self, "set_flowers")\
		.set_description("Set flower count.")\
		.add_argument("new_value", TYPE_INT)\
		.register()
	
	Console.add_command("setCoins", self, "set_coins")\
		.set_description("Set coin count.")\
		.add_argument("new_value", TYPE_INT)\
		.register()

func set_flowers(new_value: int):
	flowers = new_value
	emit_signal("inventory_changed")

func get_flowers() -> int:
	return flowers

func set_coins(new_value: int):
	if new_value > coins:
		AudioStreamManager.play_sfx("res://Assets/coin.wav")
	coins = new_value
	emit_signal("inventory_changed")

func get_coins() -> int:
	return coins
