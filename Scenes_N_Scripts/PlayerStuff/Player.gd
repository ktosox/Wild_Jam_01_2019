extends Node2D

var GameScenePointer
var ScreenScrollSpeed = 90


func _process(delta):


	#if(!$Camera2D/Area2D.overlaps_body($PlayerShip)):
			#$Camera2D.global_position = $Camera2D.global_position + $PlayerShip.linear_velocity * delta
			
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
func updateCoreRotation(value):
	$PlayerShip/Body/Body_core/AnimationPlayer.playback_speed = value/50
	$PlayerShip/Engine/EngineBuzz.pitch_scale= 1 + (value/(value+500))
	#adjust playback speed of core rotation animation here
	pass

func deathEvent(type):
	$PlayerShip/DeathSmoke.restart()
	$PlayerShip/Engine.visible = false
	$PlayerShip/Body.visible = false
	$PlayerShip.alive = false
	pass