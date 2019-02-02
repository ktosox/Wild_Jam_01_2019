extends Node2D

func _ready():
	$Projectile.gameScenePointer = get_parent()
	$Projectile.projectileType = 1

	pass

func useUp():
	$fuel_box3.free()
	$PickUpSound.play()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
