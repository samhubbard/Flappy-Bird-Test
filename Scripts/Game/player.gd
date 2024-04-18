extends CharacterBody2D

@export var boost : float = -700.0
@export var gravity : float = 600.0
@export var max_velocity : float = 700.0
@export var rotation_amount : float = 25

@onready var _animate_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var _flap_audio : AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	SignalManager.on_death.connect(on_death)

func _physics_process(delta) -> void:
	if position.y >= 1000:
		SignalManager.on_death.emit()

	if _animate_sprite != null:
		_animate_sprite.play("default")

	velocity.y += gravity * delta
	if velocity.y > max_velocity:
		velocity.y = max_velocity

	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = boost
		_flap_audio.play()

	rotation = rotation_amount if velocity.y < 0 else -rotation_amount

	move_and_slide()

func on_death() -> void:
	queue_free()
