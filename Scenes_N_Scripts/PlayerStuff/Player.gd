extends Node2D

var GameScenePointer
var ScreenScrollSpeed = 90

var cameraStart = Vector2(0.4,0.4)
var cameraDefault = Vector2(1.2,1.2)

var zoomOut = true
var zoomIn = false

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Camera2D.zoom = cameraStart
	pass

func _process(delta):
	if(zoomOut):
		if($Camera2D.zoom.x<cameraDefault.x):
			$Camera2D.zoom.x += 0.3 * delta
			$Camera2D.zoom.y += 0.3 * delta
		else:
			zoomOut = false
			zoomOutDone()
	if(zoomIn):
		if($Camera2D.zoom.x>cameraStart.x):
			$Camera2D.zoom.x -= 0.3 * delta
			$Camera2D.zoom.y -= 0.3 * delta
		else:
			zoomIn = false
			zoomInDone()

	$Camera2D.global_position = $PlayerShip.global_position
	#if(!$Camera2D/Area2D.overlaps_body($PlayerShip)):
			#$Camera2D.global_position = $Camera2D.global_position + $PlayerShip.linear_velocity * delta
			
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
func updateCoreRotation(value):
	$PlayerShip/Body/Body_core/AnimationPlayer.playback_speed = value/50
	$Camera2D/CoreHeat.value = value
	$PlayerShip/Engine/EngineBuzz.pitch_scale= 1 + (value/(value+500))
	#adjust playback speed of core rotation animation here
	pass
	
func updateFuelLevel(value):
	$Camera2D/FuelBar.value = value
	pass
	
func zoomOutDone():
	pass

func zoomInDone():
	pass

func gainLoop(value):
	$Camera2D/Label3.text =  str(value)
	pass


	
func deathEvent(type):
	zoomIn = true
	$Camera2D/SceneManager.fadeIn = true
	$PlayerShip/DeathSmoke.restart()
	$PlayerShip/Engine.visible = false
	$PlayerShip/Body.visible = false
	$PlayerShip.alive = false
	pass