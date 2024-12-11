extends Control

@onready var version_label: Label = get_node("MarginContainer/HBoxContainer/LeftVBoxContainer/MainMenuVBox/VersionLabel")

func _ready() -> void:
	version_label.text = Global.get_version()

func _on_start_button_pressed() -> void:
		Global.goto_scene("res://maps/storyboard.tscn")
