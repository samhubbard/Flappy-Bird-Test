extends Node2D

@export var speed : float = 500.0

@onready var points_granted_audio : AudioStreamPlayer2D = $PointsGrantedAudio
@onready var death_audio : AudioStreamPlayer2D = $DeathAudio

var dead : bool = false
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = rng.randf_range(-200, 150)
	$Timer.start()
	SignalManager.on_death.connect(on_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if dead == true:
		return
	position.x += -speed * delta

func _on_top_blocker_body_entered(body:Node2D) -> void:
	if body.name == "Player":
		SignalManager.on_death.emit()
		death_audio.play()

func _on_bottom_blocker_body_entered(body:Node2D) -> void:
	if body.name == "Player":
		SignalManager.on_death.emit()
		death_audio.play()

func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.name == "Player":
		SignalManager.add_points.emit()
		points_granted_audio.play()

func _on_timer_timeout() -> void:
	if dead == true:
		return
	queue_free()

func on_death() -> void:
	dead = true;
