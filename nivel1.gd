extends Node2D

func _process(delta):
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()


func _on_Area2D_body_entered(body:KinematicBody2D):
	get_tree().reload_current_scene()
