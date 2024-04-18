extends ParallaxBackground

var dead : bool = false

func _ready() -> void:
	SignalManager.on_death.connect(on_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if dead:
		return
	
	scroll_base_offset -= Vector2(100, 0) * delta

func on_death() -> void:
	dead = true
