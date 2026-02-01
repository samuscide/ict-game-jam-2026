extends Node2D

@export var texture: Texture2D
@export var communicate = false

@onready var characterSprite = $Sprite2D

func assignSprite(name: String) -> void:
	# Assign Texture
	characterSprite.texture = RoomManager.characterLibrary[name]

func _ready() -> void:
	assignSprite("robert")
