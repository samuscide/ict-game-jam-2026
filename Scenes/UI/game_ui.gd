extends Control

@onready var pause = $pause
@onready var dialog = $dialog
@onready var options = $options
@onready var junctions = $junctions

func hideControl() -> void:
	pause.visible = false
	dialog.visible = false
	options.visible = false
	junctions.visible = false

func disableNode(node: Button):
	node.disabled = true

func revealNode(node: Control) -> void:
	node.visible = true

func _ready() -> void:
	# Start with all UI not visible
	hideControl()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause") and !pause.visible == true:
		hideControl()
		pause.visible = true

# Pause functionality
func _on_return_pressed() -> void:
	hideControl()
	options.visible = true
	pass # Replace with function body.

func _on_save_pressed() -> void:
	# TODO: give visual feedback that the game was saved
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu/Menu.tscn")

# Options functionality
func _on_communicate_pressed() -> void:
	hideControl()
	dialog.visible = true
	pass # Replace with function body.

func _on_movement_pressed() -> void:
	hideControl()
	junctions.visible = true
	pass # Replace with function body.


func _on_observe_pressed() -> void:
	hideControl()
	dialog.visible = true
	pass # Replace with function body.
