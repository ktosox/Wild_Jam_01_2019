extends AnimationPlayer

func _ready():
	advance(randf()*2)
	playback_speed = randf() + 0.8
	pass