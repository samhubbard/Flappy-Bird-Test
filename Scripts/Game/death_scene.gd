extends Control

func _on_button_button_up():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	queue_free()
