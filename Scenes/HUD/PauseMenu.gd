extends Control

var is_paused:= false setget set_is_paused

func set_is_paused(new_value: bool) -> void:
	is_paused = new_value
	get_tree().paused = is_paused
	visible = is_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_action"):
		self.is_paused = !is_paused

func _on_ResumeBtn_pressed() -> void:
	self.is_paused = false


func _on_TitleScreenBtn_pressed() -> void:
	self.is_paused = false
	GameManager.goto_scene("res://Scenes/TitleScreen.tscn")
