extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes_N_Scripts/GameFolder/GameScene.tscn")
	
	pass # replace with function body


func _on_Button3_pressed():
	get_tree().quit()
	pass # replace with function body


func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes_N_Scripts/About.tscn")
	pass # replace with function body




func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master") ,value)
	pass # replace with function body


func _on_AudioSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master") ,value)
	pass # replace with function body
