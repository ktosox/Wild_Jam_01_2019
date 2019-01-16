extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Projectile.gameScenePointer = get_parent()
	$Projectile.projectileType = 2
	pass

func explode():
	$fuel_box1.free()
	$ExplosionSound.play()
	pass