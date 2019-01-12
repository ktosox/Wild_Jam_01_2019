extends Node

var PlayerBase = load("res://Scenes_N_Scripts/Player.tscn") # Load Player Scene

func _ready():
	pass

func get_input():
	#Debug code, kills the player and respawn at middle of screen
	if Input.is_action_pressed('ui_down'):
		$Player.free()
		var newPlayer = PlayerBase.instance()
		self.add_child(newPlayer,true)

func _process(delta):
	get_input()

