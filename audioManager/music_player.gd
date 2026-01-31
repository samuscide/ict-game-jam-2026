extends Node

var currentPlayer: AudioStreamPlayer
var nextPlayer: AudioStreamPlayer

@export var fadeTime = 0.5

@onready var musicA: AudioStreamPlayer = $MusicA
@onready var musicB: AudioStreamPlayer = $MusicB

var musicTween: Tween

var musicLibrary = {
	"menu": preload("res://Assets/audio/check it out i'm in the house like carpet [aByWFApNKEw].mp3"),
	"room": preload("res://Assets/audio/Drakengard 3： mikhail's song english version [BWLTHAm_vhM].mp3")
}

func _ready() -> void:
	currentPlayer = musicA
	nextPlayer = musicB
	currentPlayer.volume_db = 0
	nextPlayer.volume_db = -80
	musicA.finished.connect(_on_music_finished)
	musicB.finished.connect(_on_music_finished)

func playMusic(trackName: String):
	if not musicLibrary.has(trackName):
		return
	if currentPlayer.stream == musicLibrary[trackName]:
		return
	if musicTween and musicTween.is_running():
		musicTween.kill()
		currentPlayer.volume_db = 0
		nextPlayer.volume_db = -80
		currentPlayer.play()
	
	nextPlayer.stream = musicLibrary[trackName]
	nextPlayer.volume_db = -80
	nextPlayer.play()
	
	var tween = create_tween()
	
	tween.tween_property(currentPlayer, "volume_db", -80, fadeTime)
	tween.tween_property(nextPlayer, "volume_db", 0, fadeTime)
	
	tween.finished.connect(func():
		currentPlayer.stop()
		_swap_players()
		)

func _on_music_finished():
	currentPlayer.play()

func _swap_players():
	var temp = currentPlayer
	currentPlayer = nextPlayer
	nextPlayer = temp
