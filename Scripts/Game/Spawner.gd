extends Node2D

@export var time_to_spawn : float = 1.0
@export var blocker_scene : PackedScene

var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var dead : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if blocker_scene != null:
		$Timer.start()
	SignalManager.on_death.connect(on_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

func _on_timer_timeout() -> void:
	if dead == true:
		return
	_spawn()
	$Timer.wait_time = rng.randf_range(1.0, 1.45)
	$Timer.start()

func _spawn() -> void:
	var blocker_instance = blocker_scene.instantiate()
	add_child(blocker_instance)

func on_death() -> void:
	dead = true
