extends Control



func _on_StartBtn_pressed() -> void:
	GameManager.goto_scene("res://Scenes/ShopFront.tscn", true)


func _on_CreditsBtn_pressed() -> void:
	$Credits.visible = true


func _on_ExitCreditsBtn_pressed() -> void:
	$Credits.visible = false
