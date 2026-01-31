extends Control

func _ready() -> void:
	AudioManager.playMusic("menu")

func _on_exit_pressed() -> void:
	# close the game
	get_tree().quit()


func _on_start_pressed() -> void:
	# for now change scene to Waiting room
	get_tree().change_scene_to_file("res://Scenes/room/RoomTemplate.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits/Credits.tscn")
