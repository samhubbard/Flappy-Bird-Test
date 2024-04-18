extends Label

var score = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(score)
	SignalManager.add_points.connect(_add_score)

func _add_score() -> void:
	score += 1
	text = str(score)
