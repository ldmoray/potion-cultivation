extends Node2D



func _ready() -> void:
	pass # Replace with function body.

func _on_Timer_timeout() -> void:
	PlotManager.day += 1
	GameManager.goto_scene("res://Scenes/ShopFront.tscn", true)
