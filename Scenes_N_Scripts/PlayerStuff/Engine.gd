extends Node2D
var spinNotLocked = true #spins if true
var spinRate = 5.8 #how fast spins
var cooldownSet = false

func _process(delta):
	if(spinNotLocked):
		rotate(delta*spinRate)
	pass

func emitSmoke():
	$SmokeEmitter.restart()
	
func resetCooldown():
	$Polygon2D.position.y = -120
	cooldownSet = true