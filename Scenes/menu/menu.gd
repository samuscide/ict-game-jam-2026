extends Control


func _on_exit_pressed() -> void:
	# close the game
	get_tree().quit()


func _on_start_pressed() -> void:
	# for now change scene to Waiting room
	get_tree().change_scene_to_file("res://Scenes/Rooms/RoomTemplate.tscn")
