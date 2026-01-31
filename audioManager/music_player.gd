extends Node

var activeMusicStream: AudioStreamPlayer

@export_group("Test")
@export var clips: Node

func play(audio: String, from: float = 0.0, restart: bool = false) -> void:
	if restart and activeMusicStream and activeMusicStream.name == audio:
		return
	activeMusicStream = clips.get_node(audio)
	activeMusicStream.play(from)
