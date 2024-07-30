extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		Global.can_move = false
		Global.life = 0
