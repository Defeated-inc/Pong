extends Node2D

@onready var Player1 = $Player1
@onready var Player2 = $Player2

@onready var black_ball = %BlackBall
@onready var red_ball = %RedBall

func _ready():
	red_ball.visible = false
	red_ball.SPEED = 0
	
func _process(_delta):
	$UIPoints/p1_label.text = str(Main.p1_score)
	$UIPoints/p2_label.text = str(Main.p2_score)

func _on_top_body_entered(body):
	body.direction.y *= -1


func _on_bottom_body_entered(body):
	body.direction.y *= -1


func _on_left_body_entered(body):
	Player2.score(body.item)
	body.visible = false
	body.SPEED = 0
	
	if (body.item.name == "BlackBall"):
		red_ball.reset()
		red_ball.visible = true
		red_ball.SPEED = 300
	else:
		black_ball.reset()
		black_ball.visible = true
		black_ball.SPEED = 300
	
	#await get_tree().create_timer(1.0).timeout
	

func _on_right_body_entered(body):
	Player1.score(body.item)
	body.visible = false
	body.SPEED = 0
	
	if (body.item.name == "BlackBall"):
		red_ball.reset()
		red_ball.visible = true
		red_ball.SPEED = 300
	else:
		black_ball.reset()
		black_ball.visible = true
		black_ball.SPEED = 300

