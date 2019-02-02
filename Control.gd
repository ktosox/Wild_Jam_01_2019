extends Control

func _process(delta):
	if(Input.is_action_just_released("ui_up")):
		get_tree().change_scene("res://Scenes_N_Scripts/Menu_Scene.tscn")


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes_N_Scripts/Menu_Scene.tscn")
	pass # replace with function body
