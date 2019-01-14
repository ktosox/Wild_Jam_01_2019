extends Node2D

var gameScenePointer # pointer to game scene
var projectileType  # 1 for item, 2 for projectile
var launched = false # has this projectile been started yet
var toBeRemoved = false #clean up var
# always false at start

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	gameScenePointer = get_parent()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(toBeRemoved):
		self.free()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass


func _on_Collision_Area_body_entered(body):
		#if (body == ):
	gameScenePointer.process_collision(self)
	pass # replace with function body

func unLive():
	toBeRemoved = true
	pass