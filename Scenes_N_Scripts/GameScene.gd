extends Node

var fuelLevel = 500
var corePowerLevel = 50
var coreSlowDownRate = 20
var playerBase = load("res://Scenes_N_Scripts/Player.tscn") # Load Player Scene

func _ready():
	$Player.GameScenePointer = self
	pass

func get_input():
	#Debug code, kills the player and respawn at middle of screen
	if Input.is_action_pressed('ui_down'):
		$Player.free()
		var newPlayer = playerBase.instance()
		self.add_child(newPlayer,true)
		newPlayer.GameScenePointer = self

func _process(delta):
	get_input()
	updateGlobalPlayerData(delta)

func updateGlobalPlayerData(delta):
	if(corePowerLevel>0):
		corePowerLevel -= delta * coreSlowDownRate
		fuelLevel -= corePowerLevel * 0.1 * delta
	$Player.updateCoreRotation(corePowerLevel)
	$CoreEnergyBar.value = corePowerLevel
	$FuelLEvelBar.value = fuelLevel
	#decrease fuel and power * delta
	#send updated values to Player
	pass