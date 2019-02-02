extends Node2D

var toRemove = false

func _ready():
	$Projectile.gameScenePointer = get_parent()
	$Projectile.projectileType = 3
	$LoopSprite.modulate = Color(randf(),randf(), randf())
	pass

func _process(delta):
	if(toRemove):
		self.free()

func gainLoop():
	$LoopSprite.free()
	$Sound.play()
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Timer_timeout():
	toRemove = true
	pass
