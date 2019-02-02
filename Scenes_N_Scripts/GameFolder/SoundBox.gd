extends Node

var playLowFuel = false
var playCoreHeat = false


func _process(delta):
	if(playLowFuel && !$LowFuelSound.playing):
		$LowFuelSound.play()
	if(playCoreHeat && !$HotCoreSound.playing):
		$HotCoreSound.play()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func startLowFuel():
	playLowFuel = true
	pass
	
func stopLowFuel():
	playLowFuel = false
	pass
	
func startCoreHeat():
	playCoreHeat = true
	pass

func stopCoreHeat():
	playCoreHeat = false
	pass
