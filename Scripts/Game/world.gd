extends Node2D

@export var death_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_death.connect(on_death)

func on_death() -> void:
	if death_scene == null:
		return
	
	var death = death_scene.instantiate()
	get_parent().add_child(death)
