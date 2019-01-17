extends Node2D

var GameScenePointer
var ScreenScrollSpeed = 90

var cameraStart = Vector2(0.6,0.6)
var cameraStop =  Vector2()
var cameraDefault = Vector2(1.2,1.2)


# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Camera2D.zoom = cameraStart
	pass

func _process(delta):
	if($Camera2D.zoom.x<cameraDefault.x):
		$Camera2D.zoom.x += 0.3 * delta
		$Camera2D.zoom.y += 0.3 * delta
	if(!$Camera2D/Area2D.overlaps_body($PlayerShip)):
		$Camera2D.global_position = $Camera2D.global_position + $PlayerShip.linear_velocity * delta
		pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
func updateCoreRotation(value):
	$PlayerShip/Body/Body_core/AnimationPlayer.playback_speed = value/50
	$PlayerShip.speed = value
	$Camera2D/CoreHeat.value = value
	$PlayerShip/Engine/EngineBuzz.pitch_scale= value/400
	#adjust playback speed of core rotation animation here
	pass
	
func updateFuelLevel(value):
	$Camera2D/FuelBar.value = value
	pass
	
func deathEvent(type):
	$PlayerShip/DeathSmoke.restart()
	$PlayerShip/Engine.visible = false
	$PlayerShip/Body.visible = false
	$PlayerShip.alive = false
	pass