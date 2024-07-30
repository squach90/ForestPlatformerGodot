extends Area2D

func _ready():
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	if body.name == "Player":
		Global.coin += 1
		queue_free()
