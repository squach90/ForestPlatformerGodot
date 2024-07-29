extends CharacterBody2D

# Vitesse de déplacement
@export var speed = 100
@export var player: CharacterBody2D
# La direction actuelle
var direction = 1
# La largeur du parcours
@export var patrol_width = 200
# Position de départ
@export var start_position = Vector2()

# Fonction appelée lors de l'initialisation
func _ready():
	start_position = position

# Fonction appelée à chaque frame
func _physics_process(delta):
	$AnimatedSprite2D.play("default")
	# Déplacement de l'ennemi
	velocity = Vector2(speed * direction, 0)
	if !Global.dead:
		move_and_slide()
	else:
		pass
		$AnimatedSprite2D.stop()
	
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true

	# Changement de direction si l'ennemi atteint les limites du parcours
	if position.x < start_position.x - patrol_width or position.x > start_position.x + patrol_width:
		direction *= -1


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Global.life -= 75
		#TODO: Add music


func _on_death_point_body_entered(body):
	if body.name == "Player":
		player.velocity.y += -500
		self.queue_free()
		#TODO: Add music
