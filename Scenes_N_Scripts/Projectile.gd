extends Node2D

var GameScenePointer # pointer to game scene
var ProjectileType = 1 # 1 for item, 2 for projectile
var Launched = false # has this projectile been started yet
var ToBeRemoved = false
# always false at start

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	GameScenePointer = get_parent()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(ToBeRemoved):
		self.free()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass


func _on_Collision_Area_body_entered(body):
		#if (body == ):
	GameScenePointer.process_collision(self)
	pass # replace with function body
