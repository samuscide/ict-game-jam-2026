extends Node2D

@onready var UI = $GameUi
@onready var background = $Parallax2D/background/Sprite2D

func _ready() -> void:
	background.texture = RoomManager.roomLibrary["reception"]
	# start the options menu in UI
	AudioManager.playMusic("room")
	if $Parallax2D.characterCount == 0:
		UI.disableNode($GameUi/options/optionList/communicate)
	UI.revealNode(UI.options)
