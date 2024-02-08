extends CharacterBody2D


const SPEED = 400.0
@export var side = 'p2'
@onready var animation = $AnimationP2

var inventory:Inventory = Inventory.new()
@onready var inv_p_2 = %InvP2

func _physics_process(_delta):
	var direction 
	$SpriteP2.flip_h = true
	
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
	animation.play("AttackP2")
	body.direction.x *= -1
	body.SPEED += 5
	Main.side = side
	
func score(item:Item):
	Main.p2_score += 1
	inventory.add_item(item)
	inv_p_2.show_items(inventory)
	
