extends Node2D

var toRemove = false

func _ready():
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
	pass

func _on_Timer2_timeout():
	explode()
	pass
