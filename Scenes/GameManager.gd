extends Node

var current_scene = null
var scenes = {}

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)

func goto_scene(path, clean=false):
	call_deferred("_deferred_goto_scene", path, clean)

func _deferred_goto_scene(path, clean):
	if not clean:
		scenes[current_scene.filename] = current_scene
	else:
		current_scene.free()
	get_tree().get_root().remove_child(current_scene)
	if path in scenes:
		current_scene = scenes[path]
	else:
		var s = ResourceLoader.load(path)
		current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
