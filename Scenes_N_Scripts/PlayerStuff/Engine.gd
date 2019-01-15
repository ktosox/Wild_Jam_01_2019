extends Node2D
var spinNotLocked = true #spins if true
var spinRate = 4


func _ready():
	pass

func _process(delta):
	if(spinNotLocked):
		rotate(delta*spinRate)

	pass

func moveJet():
	$Jet/JetMover.advance(3)