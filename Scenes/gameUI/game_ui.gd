extends Control

func hideControl(conItem) -> void:
	conItem.visible = false

func _ready() -> void:
	# Start every new scene with all UI not visible
	hideControl(get_node("dialog"))
	hideControl(get_node("options"))
