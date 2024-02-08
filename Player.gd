extends CharacterBody2D


const SPEED = 400.0

@export var side = 'p1'
var inventory:Inventory = Inventory.new()

@onready var animation = $AnimationP1
@onready var inv_p_1 = %InvP1

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction 
	
	if side == 'p1':
		direction = get_axis(KEY_W, KEY_S)
	else:
		direction = get_axis(KEY_I, KEY_K)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func get_axis(up, down):
	if Input.is_key_pressed(up): return -1
	elif  Input.is_key_pressed(down): return 1


func _on_area_2d_body_entered(body):
	animation.play("AttackP1")
	body.direction.x *= -1
	body.SPEED += 5
	Main.side = side

func score(item:Item):
	Main.p1_score += 1
	inventory.add_item(item)
	inv_p_1.show_items(inventory)
