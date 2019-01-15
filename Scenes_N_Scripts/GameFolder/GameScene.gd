extends Node

var fuelLevel = 500
var corePowerLevel = 50
var coreSlowDownRate = 20
var playerDied = false
var playerBase = load("res://Scenes_N_Scripts/PlayerStuff/Player.tscn") # Load Player Scene

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
	if(fuelLevel<80 && $FuelLowSound.playing == false):
		$FuelLowSound.play()
func updateGlobalPlayerData(delta):
	if(corePowerLevel>0):
		corePowerLevel -= delta * coreSlowDownRate
		fuelLevel -= corePowerLevel * 0.1 * delta
	$Player.updateCoreRotation(corePowerLevel)
	$CoreEnergyBar.value = corePowerLevel
	$FuelLEvelBar.value = fuelLevel
	if(fuelLevel<10):
		$Player.deathEvent(10)
		playerDied = true
	#decrease fuel and power * delta
	#send updated values to Player
	pass

func process_collision(projectile):
	if (projectile.projectileType == 1):
		fuelLevel +=90
		print("FUEL")
	if (projectile.projectileType == 2):
		print("BOOM")
	if (projectile.projectileType == 3):
		print("LOOP")
	projectile.unLive()
	

func _on_DeathTimer_timeout():
	if(playerDied):
		get_tree().change_scene("res://Scenes_N_Scripts/GameFolder/DeathScreen.tscn")
