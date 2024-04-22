extends Node2D

@export var death_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_death.connect(on_death)
	Data.scoreSaved.connect(showDeathScene)

func on_death() -> void:
	if death_scene == null:
		return
	
	Data.load()

func showDeathScene():
	var death_ui = death_scene.instantiate()
	get_parent().add_child(death_ui)
