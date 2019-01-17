extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var playLowFuel = false
var playCoreHeat = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

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
