extends Area2D


var plant: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_plant(path: String):
	get_parent().set_plant(path)
