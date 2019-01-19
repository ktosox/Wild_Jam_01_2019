extends Node

var fuelLevel = 500
var fuelLevelMax = 1000
var fuelChangeRate = 3
var corePowerLevel = 300
var corePowerLevelMax = 1000
var coreChangeRate = 120
var playerDied = false
var playerBase = load("res://Scenes_N_Scripts/PlayerStuff/Player.tscn") # Load Player Scene

var directionRainbownado = Vector2(90,0)

func _ready():
	#$Player.GameScenePointer = self
	$Player.free()
	var newPlayer = playerBase.instance()
	self.add_child(newPlayer,true)
	newPlayer.GameScenePointer = self
	pass




func _process(delta):
	$RainbowNado.move_and_slide(directionRainbownado)
	if(fuelLevel>fuelLevelMax):
		fuelLevel=fuelLevelMax
	if(fuelLevel<0):
		fuelLevel = 0
	if(corePowerLevel>corePowerLevelMax):
		corePowerLevel=corePowerLevelMax
	if(corePowerLevel<0):
		corePowerLevel = 0
	updateGlobalPlayerData(delta)
	if(fuelLevel<100 && !$SoundBox.playLowFuel):
		$SoundBox.startLowFuel()
	if(fuelLevel>150 && $SoundBox.playLowFuel):
		$SoundBox.stopLowFuel()
		
	if(corePowerLevel>800 && !$SoundBox.playCoreHeat):
		$SoundBox.startCoreHeat()
	if(corePowerLevel<800 && $SoundBox.playCoreHeat):
		$SoundBox.stopCoreHeat()
		
func updateGlobalPlayerData(delta):
	corePowerLevel += (fuelLevel/fuelLevelMax) * coreChangeRate * delta
	fuelLevel -= (corePowerLevel/corePowerLevelMax) * fuelChangeRate * delta
	$Player.updateCoreRotation(corePowerLevel)
	$Player.updateFuelLevel(fuelLevel)
	#decrease fuel and power * delta
	#send updated values to Player
	pass

func process_collision(projectile):
	if (projectile.projectileType == 1):
		fuelLevel +=600
		projectile.get_parent().useUp()
		print("FUEL")
	if (projectile.projectileType == 2):
		projectile.get_parent().explode()
		$Player/PlayerShip.linear_velocity.x +=($Player/PlayerShip.global_position.x - projectile.global_position.x) *15
		$Player/PlayerShip.linear_velocity.y +=($Player/PlayerShip.global_position.y - projectile.global_position.y) *15
		print("BOOM")
	if (projectile.projectileType == 3):
		#projectile.get_parent()
		print("LOOP")
	projectile.unLive()
	

func killPlayer():
	if(!playerDied):
		playerDied = true
		$Player.deathEvent(10)
	pass


