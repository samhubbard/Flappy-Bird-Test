extends CharacterBody2D

@export var boost : float = 250.0
@export var gravity : float = 800.0
@export var max_velocity : float = 900.0
@export var rotation_amount : float = 25
@export var fall_death_y : float = 1500.0

@onready var _animate_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var _flap_audio : AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	SignalManager.on_death.connect(on_death)

func _physics_process(delta) -> void:
	if position.y >= fall_death_y:
		SignalManager.on_death.emit()

	if _animate_sprite != null:
		_animate_sprite.play("default")

	velocity.y += gravity * delta
	if velocity.y > max_velocity:
		velocity.y = max_velocity

	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -boost
		_flap_audio.play()

	rotation = rotation_amount if velocity.y < 0 else -rotation_amount

	move_and_slide()

func on_death() -> void:
	queue_free()
