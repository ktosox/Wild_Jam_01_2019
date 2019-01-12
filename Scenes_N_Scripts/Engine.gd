extends Node2D
var spinNotLocked = true #spins if true

func _ready():
	pass

func _process(delta):
	if(spinNotLocked):
		rotate(delta*2)
	pass
