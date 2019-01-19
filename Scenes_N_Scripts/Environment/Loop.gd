extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Projectile.gameScenePointer = get_parent()
	$Projectile.projectileType = 3
	$LoopSprite.modulate = Color(randf(),randf(), randf())
	pass

func gainLoop():
	$LoopSprite.free()
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
