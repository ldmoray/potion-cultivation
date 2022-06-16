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
	if current_scene != null:
		get_tree().get_root().remove_child(current_scene)
	if path in scenes:
		current_scene = scenes[path]
		scenes.erase(path)
	else:
		var s = ResourceLoader.load(path)
		current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func _walk_sleeping_node(node: Node) -> Array:
	var nodes = []
	for child in node.get_children():
		nodes.append_array(_walk_sleeping_node(child))
	nodes.append(node)
	return nodes

func call_sleeping_group(group: String, method: String):
	for i in scenes:
		for node in _walk_sleeping_node(scenes[i]):
			if node.is_in_group(group):
				node.call(method)
