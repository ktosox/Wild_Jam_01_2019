extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var PlayerBase = load("res://Scenes_N_Scripts/Player.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	pass

func get_input():
	if Input.is_action_pressed('ui_down'):
		print("TEST")
		$Player.free()
		var newPlayer = PlayerBase.instance()
		self.add_child(newPlayer,true)
		

func _process(delta):
	get_input()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
