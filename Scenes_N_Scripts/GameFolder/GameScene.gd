extends Node

var Score = 0

var fuelLevel = 500
var fuelLevelMax = 1000
var fuelChangeRate = 3
var corePowerLevel = 300
var corePowerLevelMax = 1000
var coreChangeRate = 120
var playerDied = false
var playerBase = load("res://Scenes_N_Scripts/PlayerStuff/Player.tscn") # Load Player Scene
var bombBase = load("res://Scenes_N_Scripts/Environment/Bomb.tscn")
var loopBase = load("res://Scenes_N_Scripts/Environment/Loop.tscn")



var directionRainbownado = Vector2(0,0)
var rainbowPart = 0

var cameraEndZoom = Vector2(3.6,3.6)
var cameraEndPoistion = Vector2(3435,130)
var bombSpawnPoint = Vector2(2765,130)


func _ready():
	#$Player.GameScenePointer = self
	$Player.free()
	var newPlayer = playerBase.instance()
	self.add_child(newPlayer,true)
	newPlayer.GameScenePointer = self
	pass




func _process(delta):
	if(rainbowPart != 0):
		
		pass
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
		
func updateGlobalPlayerData(delta):
	corePowerLevel += (fuelLevel/fuelLevelMax) * coreChangeRate * delta
	fuelLevel -= (corePowerLevel/corePowerLevelMax) * fuelChangeRate * delta
	#$Player.updateCoreRotation(corePowerLevel)
	#$Player.updateFuelLevel(fuelLevel)
	#decrease fuel and power * delta
	#send updated values to Player
	pass

func process_collision(projectile):
	if (projectile.projectileType == 1):
		fuelLevel +=350
		projectile.get_parent().useUp()
	if (projectile.projectileType == 3):
		projectile.get_parent().gainLoop()
		Score += 1
		if (Score>7):
			unlockPortal()
		$Camera2D/SideBar/VBoxContainer/Label3.text = str(Score)
		#$Player.gainLoop(Score)
	projectile.unLive()
	

func unlockPortal():
	#plasy sound
	#show label for exit
	#stop spawning loops
	pass

func winGame():
	if(Score>7):
		get_tree().change_scene("res://Scenes_N_Scripts/GameFolder/VictoryScreen.tscn")
	pass
		#switch to win screen if 20 loops

		

func killPlayer():
	if(!playerDied):
		playerDied = true
		$Player.deathEvent(10)
		$DeathTimer.start()
	pass




func _on_LevelSwitcher_body_entered(body):
	#start main game
	if(body.get_class()=="RigidBody2D"):
		$Camera2D.zoom = cameraEndZoom 
		$Camera2D.position = cameraEndPoistion

	pass # replace with function body









func _on_DeathTimer_timeout():
	get_tree().change_scene("res://Scenes_N_Scripts/GameFolder/DeathScreen.tscn")
	pass # replace with function body
