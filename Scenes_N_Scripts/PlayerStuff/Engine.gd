extends Node2D
var spinNotLocked = true #spins if true
var spinRate = 2


func _ready():
	pass

func _process(delta):
	if(!$EngineBuzz.playing):
		$EngineBuzz.play()
		
	if(spinNotLocked):
		rotate(delta*spinRate)

	pass
	
func emitSmoke():
	$SmokeEmitter.restart()
	
