extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var toRemove = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Projectile.gameScenePointer = get_parent()
	$Projectile.projectileType = 2
	randomize()
	self.rotation = randi()%60
	pass

func _process(delta):
	if(toRemove):
		self.free()

func fly():
	$AnimationPlayer.play()

func explode():
	$fuel_box1.free()
	$ExplosionSound.play()
	$Timer.start()
	pass

func _on_Timer_timeout():
	toRemove = true
	pass # replace with function body



func _on_Timer2_timeout():
	explode()
	pass # replace with function body
