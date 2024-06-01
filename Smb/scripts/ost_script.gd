extends Node

var audio_stream_player = AudioStreamPlayer.new()

func _ready():
	var audio_stream = load("res://assets/sounds/ost.mp3")
	audio_stream_player.stream = audio_stream
	audio_stream_player.volume_db = -15.0
	add_child(audio_stream_player)
	audio_stream_player.play()
