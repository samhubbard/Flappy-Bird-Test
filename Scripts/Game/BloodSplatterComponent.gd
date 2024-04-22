extends Node2D

@export var BloodParticleScene : PackedScene
@export var BloodParticleNumber = 15
@export var RandomVelocity = 500.0

const BloodSplatterSignalName = "OnDeath"

var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_death.connect(on_death)
	random.randomize()

func on_death() -> void:
	splatter()

func splatter(particles_to_spawn = -1) -> void:
	if (particles_to_spawn <= 0):
		particles_to_spawn = BloodParticleNumber
	
	var spawnedParticle : RigidBody2D
	
	for i in range(particles_to_spawn):
		spawnedParticle = BloodParticleScene.instantiate()
		
		get_tree().root.call_deferred("add_child", spawnedParticle)
		
		spawnedParticle.global_position = global_position
		
		spawnedParticle.linear_velocity = Vector2(random.randf_range(-RandomVelocity, RandomVelocity), random.randf_range(-RandomVelocity, RandomVelocity))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass
