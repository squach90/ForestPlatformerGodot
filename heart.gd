extends Area2D

func _ready():
	$AnimatedSprite2D.play("default")
	
func _on_body_entered(body):
	if body.name == "Player":
		%HeartSound.play()
		Global.life += 10
		queue_free()
