extends Control

@onready var highscore : Label = $Score
@onready var playerName : LineEdit = $PlayerName

const leaderboardScene : PackedScene = preload("res://Scenes/leaderboard.tscn")

var score

func _ready() -> void:
	score = Data.get_score()
	if score == null:
		print("score is null")
		return
	highscore.text = "Your score: " + str(score)
	SilentWolf.Scores.sw_save_score_complete.connect(save_score_complete)

func _on_button_button_up() -> void:
	if playerName.text != "":
		SilentWolf.Scores.save_score(playerName.text, score)
	else:
		get_tree().change_scene_to_packed(leaderboardScene)
		queue_free()

func save_score_complete(_item):
	get_tree().change_scene_to_packed(leaderboardScene)
	queue_free()
