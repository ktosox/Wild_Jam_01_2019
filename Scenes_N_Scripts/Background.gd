extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$TextureRect5.rect_pivot_offset = $TextureRect5.rect_size/2
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
