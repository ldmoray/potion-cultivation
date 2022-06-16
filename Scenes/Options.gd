extends Control

onready var _sfx_bus := AudioServer.get_bus_index("sfx")
onready var _bgm_bus := AudioServer.get_bus_index("bgm")
onready var sfx_slider := $CenterContainer/VBoxContainer/HBoxContainer2/SFXSlider
onready var bgm_slider := $CenterContainer/VBoxContainer/HBoxContainer/BGMSlider

func _ready() -> void:
	sfx_slider.value = db2linear(AudioServer.get_bus_volume_db(_sfx_bus))
	bgm_slider.value = db2linear(AudioServer.get_bus_volume_db(_bgm_bus))


func _on_SFXSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_sfx_bus, linear2db(value))


func _on_BGMSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bgm_bus, linear2db(value))


func _on_Button_pressed() -> void:
	visible = false
