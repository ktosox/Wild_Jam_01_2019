extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$AnimationPlayer.advance(randf()*30)
	rect_pivot_offset = rect_size/2
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
