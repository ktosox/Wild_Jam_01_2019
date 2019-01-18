extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var fadeOut = false
var fadeIn = false

var listOfScenes = {
	1 : "debug room" ,
	2 : "start" ,
	3 : "death screen"
}

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(fadeIn):
		$Curtain.modulate.a += 0.5 * delta 
		if($Curtain.modulate.a >= 1):
			fadeIn = false
			fadeInComplete()
		pass
	if(fadeOut):
		$Curtain.modulate.a -= 0.5 * delta 
		if($Curtain.modulate.a <= 0):
			fadeOut = false
			fadeOutComplete()
		pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass

func fadeInComplete():
	pass

func fadeOutComplete():
	pass


func changeScene(number):
	print(listOfScenes(number))
	pass