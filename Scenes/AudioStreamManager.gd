extends Node

var num_players := 7
var bus := "sfx"

var bgm_player
var available = []
var queue = []

func _ready() -> void:
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.connect("finished", self, "_on_sfx_stream_finished", [p])
		p.bus = bus
	bgm_player = AudioStreamPlayer.new()
	add_child(bgm_player)
	bgm_player.bus = "bgm"
	bgm_player.pause_mode = PAUSE_MODE_PROCESS
	

func _on_sfx_stream_finished(stream):
	available.append(stream)

func play_sfx(sound_path):
	queue.append(sound_path)

func play_bgm(sound_path):
	bgm_player.stream = load(sound_path)
	bgm_player.play()

func _process(delta: float) -> void:
	if not queue.empty() and not available.empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()
