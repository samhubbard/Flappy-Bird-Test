extends Node

const FILENAME = "user://game-data.json"

signal scoreSaved

var highscore = 0
var score = 0

func save(points) -> void:
	score = points
	scoreSaved.emit()
	if (highscore > score):
		return
	var file = FileAccess.open(FILENAME, FileAccess.WRITE)
	file.store_var(score)

func load() -> void:
	if !FileAccess.file_exists(FILENAME):
		var newFile = FileAccess.open(FILENAME, FileAccess.WRITE)
		newFile.store_var(highscore)
	var file = FileAccess.open(FILENAME, FileAccess.READ)
	highscore = file.get_var()

func get_score() -> int:
	return score

func get_highscore() -> int:
	return highscore
