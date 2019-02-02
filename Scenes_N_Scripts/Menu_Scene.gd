extends Node

func _process(delta):
	if(Input.is_action_just_released("ui_up")):
		get_tree().change_scene("res://Scenes_N_Scripts/GameFolder/GameScene.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes_N_Scripts/GameFolder/GameScene.tscn")
	pass

func _on_Button3_pressed():
	get_tree().quit()
	pass

func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes_N_Scripts/About.tscn")
	pass

func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master") ,value)
	pass

func _on_AudioSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master") ,value)
	pass
