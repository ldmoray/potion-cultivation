extends Control

func _ready() -> void:
	AudioStreamManager.play_bgm("res://Assets/Ludum Dare 28 - Track 6.wav")

func _on_StartBtn_pressed() -> void:
	GameManager.goto_scene("res://Scenes/ShopFront.tscn", true)


func _on_CreditsBtn_pressed() -> void:
	$Credits.visible = true


func _on_ExitCreditsBtn_pressed() -> void:
	$Credits.visible = false


func _on_OptionsBtn_pressed() -> void:
	$Options.visible = true
