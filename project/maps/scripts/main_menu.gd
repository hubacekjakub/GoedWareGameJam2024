extends Control

@onready var version_label: Label = get_node("MarginContainer/HBoxContainer/LeftVBoxContainer/MainMenuVBox/VersionLabel")
@onready var audio_stream_player: AudioStreamPlayer = get_node("AudioStreamPlayer")
@onready var timer: Timer = get_node("Timer")

func _ready() -> void:
	version_label.text = Global.get_version()

func _on_start_button_pressed() -> void:
	Global.goto_scene("res://maps/storyboard.tscn")

func _on_audio_stream_player_finished() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	audio_stream_player.play()