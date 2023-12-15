extends CharacterBody2D


var SPEED = 300.0
var direction = Vector2.ZERO
@onready var animation = $AnimationBall

func _ready():
	direction.y = [1, -1].pick_random()
	direction.x = [1, -1].pick_random()

func _physics_process(delta):
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
	animation.play("idle")
	move_and_slide()
	
