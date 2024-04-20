extends Control

const ScoreItem : PackedScene = preload("res://Scenes/ScoreItem.tscn")
const MainMenu : PackedScene = preload("res://Scenes/main_menu.tscn")

var list_index = 0
var max_scores = 10

func _init():
	var sw_result : Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	var scores = sw_result.scores
	for score in scores:
		add_item(score.player_name, str(int(score.score)))

func add_item(player_name: String, score_value: String) -> void:
	var scoreItem = ScoreItem.instantiate()
	list_index += 1
	scoreItem.get_node("PlayerName").text = str(list_index) + str(". ") + player_name
	scoreItem.get_node("Score").text = score_value
	scoreItem.offset_top = list_index * 100
	$ScrollContainer/ScrollItemContainer.add_child(scoreItem)


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_packed(MainMenu)
