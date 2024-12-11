extends Node2D

var current_scene = null
var current_path : String = ""

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	current_path = current_scene.scene_file_path

func get_version() -> String:
	return "Version: " + ProjectSettings.get_setting("application/config/version")

func goto_main_menu():
	goto_scene("res://maps/main_menu.tscn")

func goto_scene(path):
	current_path = path
	call_deferred("_deferred_goto_scene", current_path)

func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
