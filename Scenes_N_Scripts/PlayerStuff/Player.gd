extends Node2D

var GameScenePointer
var ScreenScrollSpeed = 50


# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(!$Camera2D/Area2D.overlaps_body($PlayerShip)):
		$Camera2D.global_position = $Camera2D.global_position + $PlayerShip.linear_velocity * delta
		pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
func updateCoreRotation(value):
	$PlayerShip/Body/Body_core/AnimationPlayer.playback_speed = value/50
	$PlayerShip.speed = value
	#adjust playback speed of core rotation animation here
	pass
	
func deathEvent(type):
	$PlayerShip/DeathSmoke.restart()
	$PlayerShip.alive = false
	pass