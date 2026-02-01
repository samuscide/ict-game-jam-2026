extends Sprite2D

func assignSprite(name: String) -> void:
	# Assign Texture
	texture = RoomManager.characterLibrary[name]

func _ready() -> void:
	assignSprite("robert")
