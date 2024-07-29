extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Gameover/Coffre.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/LifeBar.value = Global.life
	if Global.dead:
		$Gameover.visible = true
	
