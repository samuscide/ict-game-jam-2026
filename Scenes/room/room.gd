extends Node2D

@onready var UI = $GameUi
@onready var bg_a = $Parallax2D/background/bg_a
@onready var bg_b = $Parallax2D/background/bg_b

@export var fadeTime = 0.5

var _using_a := true
var _is_fading := false

signal movementButtonSignal

var activeJunction = RoomManager.Junction

func _ready() -> void:
	crossFade(RoomManager.roomLibrary["reception"])
	# start the options menu in UI
	if $Parallax2D.characterCount == 0:
		UI.disableNode($GameUi/options/optionList/communicate)
	UI.revealNode(UI.options)


func crossFade(texture: Texture2D):
	if _is_fading:
		return
	
	var from = bg_a if _using_a else bg_b
	var to = bg_b if _using_a else bg_a
	
	to.texture = texture
	to.modulate.a = 0.0
	to.visible = true
	
	var tween = create_tween()
	tween.parallel().tween_property(from, "modulate:a", 0.0, fadeTime)
	tween.parallel().tween_property(to, "modulate:a", 1.0, fadeTime)

	await tween.finished

	from.visible = false
	_using_a = !_using_a
	_is_fading = false
