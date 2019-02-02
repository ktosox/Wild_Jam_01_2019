extends Node2D

#shows rainbownado after player enters its area
func _on_Area2D_body_entered(body):
	if(body.get_class()=="RigidBody2D"):
		self.visible=true
	pass

#send a kill event once player touches edge of rainbownado
func _on_Area2D_body_exited(body):
	if(body.get_class()=="RigidBody2D"):
		get_parent().killPlayer()
	pass
