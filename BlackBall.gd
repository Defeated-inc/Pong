extends CharacterBody2D


var SPEED = 300.0
var direction = Vector2.ZERO

@export var item:Item

func _ready():
	direction.y = [1, -1].pick_random()
	direction.x = [1, -1].pick_random()

func _physics_process(_delta):
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	move_and_slide()
	
func reset():
	global_position = Vector2(512, 318)
	direction.y = [1, -1].pick_random()
	direction.x = [1, -1].pick_random()
	
