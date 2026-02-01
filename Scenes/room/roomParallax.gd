extends Parallax2D

@onready var background = $background

@export var sensitivity = 8
@export var dampening = 5.0
@export var characterCount = 3
@export var startPos = Vector2(200, 300)


var characters = []
var charStartPos = []
var bgStartPos: Vector2



func _ready() -> void:
	bgStartPos = background.position
	addCharacters()

func addCharacters() -> void:
	var characterScene: PackedScene = preload("res://Scenes/character/character.tscn")
	# clear characters before adding new ones
	for child in get_children():
		if child != background:
			child.queue_free()
	for i in range(characterCount):
		if characterScene:
			var charInstance = characterScene.instantiate()
			add_child(charInstance)
			var charSpacing = Vector2(randf_range(200.0, 400.0), randf_range(1.0, 40.0))
			var pos = startPos + charSpacing * i
			charInstance.position = pos
			characters.append(charInstance)
			## Will be set by state
			var tex = "robert" 
			charInstance.assignSprite(tex)
			charStartPos.append(pos)

func _process(delta: float) -> void:
	# move parallax value based on mouse position
	var viewportSize = get_viewport_rect().size
	var mousePos = get_viewport().get_mouse_position()
	
	var normalized = ((mousePos / viewportSize) - Vector2(0.5, 0.5)) * sensitivity
	
	# calculate target positions for parallax
	var bg_target = bgStartPos + normalized * sensitivity * 0.1
	background.position = background.position.lerp(bg_target, dampening * delta)
	
	for i in range(characters.size()):
		var factor = randf_range(0.4, 0.7)
		var charTarget = charStartPos[i] + normalized * sensitivity * factor
		characters[i].position = characters[i].position.lerp(charTarget, dampening * delta)
