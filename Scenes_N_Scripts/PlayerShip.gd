extends RigidBody2D

var speed = 5000
var velocity = Vector2()

func _ready():
	pass

func _process(delta):
	pass
	
func get_input():
	velocity = Vector2() #flush previous data
	var currentAngle = $Engine.rotation_degrees #set angle
	if Input.is_action_pressed('ui_up'):
		$Engine.spinNotLocked = false # lock engine spin
		velocity.x = sin(deg2rad(currentAngle))
		velocity.y = cos(deg2rad(currentAngle+180))
	velocity = velocity.normalized() * speed
	if Input.is_action_just_released('ui_up'):
		$Engine.spinNotLocked = true # unlock engine spin
func _physics_process(delta):
	get_input()
	apply_impulse(Vector2(0,0),velocity)