extends Node2D
var spinNotLocked = true
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(spinNotLocked==true):
		rotate(delta*2)
		
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
