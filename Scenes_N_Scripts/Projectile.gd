extends Node2D

var GameScenePointer # pointer to game scene
var ProjectileType = 0 # 1 for item, 2 for projectile
var Launched = false # has this projectile been started yet
# always false at start

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	GameScenePointer = get_parent()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
