extends Node2D

var GameScenePointer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func updateCoreRotation(value):
	$PlayerShip/Body/Body_core/AnimationPlayer.playback_speed = value/50
	#adjust playback speed of core rotation animation here
	pass
