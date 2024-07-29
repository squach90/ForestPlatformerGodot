extends CharacterBody2D

@export var speed = 200.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping = false

#TODO: Add music

func _process(delta):
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity.y += gravity * delta
		if not is_jumping:
			$AnimatedSprite2D.play("jump")
			is_jumping = true
	else:
		is_jumping = false

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity.y = JUMP_VELOCITY
		is_jumping = true

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * speed
		$AnimatedSprite2D.play("run")
		if velocity.x < 0:
			$AnimatedSprite2D.scale.x = -1
		elif velocity.x > 0:
			$AnimatedSprite2D.scale.x = 1
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.stop()
			
	if Global.echelle:
		$AnimatedSprite2D.play("climb")
		
	
	#Dead or Live
	if Global.life <= 0: 
		Global.dead = true
	
	if !Global.dead:
		move_and_slide()
	else:
		pass
		$AnimatedSprite2D.play("idle")
		$AnimatedSprite2D.stop()
