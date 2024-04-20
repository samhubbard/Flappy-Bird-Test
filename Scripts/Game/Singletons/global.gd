extends Node

func _ready():
	
  SilentWolf.configure({
	"api_key": "pimPQFh31B1AtbvDaM2RN5CP0BD64OAO8a8o0L1K",
	"game_id": "FlappyDragon",
	"log_level": 1
  })

  SilentWolf.configure_scores({
	"open_scene_on_close": "res://Scenes/main_menu.tscn"
  })
