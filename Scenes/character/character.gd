extends Node2D

@export var texture: Texture2D
@export var communicate = false

@onready var characterSprite = $Sprite2D

func assignSprite(name: String) -> void:
	# Assign Texture
	characterSprite.texture = RoomManager.characterLibrary[name]
	
	# Create Area2D and collision
	var area = Area2D.new()
	var collisionShape = CollisionShape2D.new()
	area.position = Vector2.ZERO
	area.input_pickable = true
	
	# Assign a collision Shape to allow us to interact with character
	var spriteSize = characterSprite.texture.get_size()
	var spriteShape = RectangleShape2D.new()
	spriteShape.extents = spriteSize / 2.0
	collisionShape.shape = spriteShape
	area.add_child(collisionShape)
	
	# Add area to scene
	add_child(area)
	
	# Assign signals so we can interact with the collisionshape
	area.mouse_entered.connect(func():_on_mouse_entered(area))
	area.mouse_exited.connect(func():_on_mouse_exited(area))
	area.input_event.connect(func(event, shape_idx, local_pos): _on_area_input(area, event, shape_idx))

func _ready() -> void:
	assignSprite("robert")

# Signal function
func _on_mouse_entered(area):
	if communicate == true:
		print("Mouse entered area:", area)

func _on_mouse_exited(area):
	if communicate == true:
		print("Mouse exited area:", area)

func _on_area_input(area, event, shape_idx):
	if communicate == true:
		if event is InputEventMouseButton and event.pressed:
			print("Area clicked:", area)
