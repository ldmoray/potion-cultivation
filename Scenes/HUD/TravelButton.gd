extends TextureButton
class_name TravelButton

export(String) var scene_path: String

func _ready() -> void:
	connect("pressed", self, "_on_pressed")
	
func _on_pressed() -> void:
	GameManager.goto_scene(scene_path)
