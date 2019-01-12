extends RigidBody2D

var speed = 5000
var slowdown_rate = 500
var velocity = Vector2()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	pass
	
func get_input():		
	velocity = Vector2()
	if Input.is_action_pressed('ui_up'):
		$Engine.spinNotLocked = false
		#print(deg2rad($Engine.rotation_degrees))
		velocity.x = sin(deg2rad($Engine.rotation_degrees))
		velocity.y = cos(deg2rad($Engine.rotation_degrees+180))
		#$Body_core/AnimationPlayer.
	velocity = velocity.normalized() * speed	
	if Input.is_action_just_released('ui_up'):
		$Engine.spinNotLocked = true
func _physics_process(delta):		
	get_input()	
	apply_impulse(velocity,velocity)