extends Node

signal day_changed

var timelines = ["TestTimeline", "End"]
var plot_state = 0
var day = 0 setget set_day, get_day

func dialog_listener(signal_name: String):
	if signal_name == "timeline_finished":
		plot_state += 1

func set_day(new_value: int):
	day = new_value
	emit_signal("day_changed")

func get_day() -> int:
	return day
