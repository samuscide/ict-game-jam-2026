extends Control

@onready var pause = $pause
@onready var dialog = $dialog
@onready var options = $options
@onready var junctions = $junctions
@onready var dialogOptions = $avialableCharacters

@onready var dialog1 = $avialableCharacters/Button
@onready var dialog2 = $avialableCharacters/Button2
@onready var dialog3 = $avialableCharacters/Button3
@onready var dialog4 = $avialableCharacters/Button4

var avialableCharactersButtons = [dialog1,dialog2,dialog3,dialog4]

# Hides the buttons we don't need in dialogOptions
func hideCommunicate(node: Button) -> void:
	node.visible = false

func hideControl() -> void:
	pause.visible = false
	dialog.visible = false
	options.visible = false
	junctions.visible = false
	dialogOptions.visible = false

func updateJunctions() -> void:
	pass

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
	
	dialogOptions.visible = true
	avialableCharactersinRoom()
	pass # Replace with function body.

func _on_movement_pressed() -> void:
	hideControl()
	junctions.visible = true
	pass # Replace with function body.


func _on_observe_pressed() -> void:
	hideControl()
	dialog.visible = true
	pass # Replace with function body.

# dialog options functionality
func _on_button_pressed() -> void:
	hideControl()
	dialog.visible = true


func _on_button_2_pressed() -> void:
	hideControl()
	dialog.visible = true


func _on_button_3_pressed() -> void:
	hideControl()
	dialog.visible = true


func _on_button_4_pressed() -> void:
	hideControl()
	dialog.visible = true
	
	
func avialableCharactersinRoom():
	var room = RoomManager.activeJunction 
	if(room):
		var npcs = room["npcs"]
		for i in range(4):
			if(i < npcs.size()):
				match i:
					0:
						dialog1.text = npcs[i]
					1: 
						dialog2.text = npcs[i]
					2: 
						dialog3.text = npcs[i]
					3:
						dialog4.text = npcs[i]
			else :
				match i:
					0:
						hideCommunicate(dialog1)
					1: 
						hideCommunicate(dialog2)
					2: 
						hideCommunicate(dialog3)
					3:
						hideCommunicate(dialog4)
						
				
				
		
