extends RigidBody2D

var alive = true
var engineReady = true
var speedMultiplayer = 800
var coreDropPercent = 0.4
var velocity = Vector2()

func _ready():
	pass
	
func get_input():
	var currentAngle = $Engine.global_rotation_degrees #set angle
	if (Input.is_action_pressed('ui_up') && engineReady):
		engineReady = false
		$EngineCooldown.start()
		$Engine.emitSmoke()
		$Engine/Polygon2D.modulate.a = 0.2
		if ($SoundImpulse.playing == false):
			$SoundImpulse.play()
		$Engine.spinNotLocked = false # lock engine spin
		velocity.x = sin(deg2rad(currentAngle))
		velocity.y = cos(deg2rad(currentAngle+180))
		velocity = velocity.normalized() * (get_parent().GameScenePointer.corePowerLevel * coreDropPercent * 1.9) * speedMultiplayer
		get_parent().GameScenePointer.corePowerLevel = get_parent().GameScenePointer.corePowerLevel - (get_parent().GameScenePointer.corePowerLevel * coreDropPercent)
	if Input.is_action_just_released('ui_up'):
		$Engine.spinNotLocked = true # unlock engine spin
		
func _physics_process(delta):
	if(alive):
		get_input()
		apply_impulse(Vector2(0,0),velocity)
		velocity = Vector2()
	

func _on_EngineCooldown_timeout():
	engineReady = true
	$Engine/Polygon2D.modulate.a = 1
	$EngineCooldown.stop()
	pass # replace with function body
