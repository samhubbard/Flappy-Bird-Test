extends Control

@onready var startButton = $StartButton
@onready var quitButton = $QuitButton

func _on_start_button_button_up():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_quit_button_button_up():
	get_tree().quit()
