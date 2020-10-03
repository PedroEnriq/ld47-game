extends KinematicBody2D

const WALKSPEED = 50
const JUMPSPEED = 600
const GRAVITY = 200

var speed = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	# Gravity
	speed += Vector2.DOWN * GRAVITY
	
	# Handle actions
	var movement = Vector2()
	
	if Input.is_action_pressed("move_left"):
		movement += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		movement += Vector2.RIGHT
	if Input.is_action_pressed("move_jump") and is_on_floor():
		speed += Vector2.UP * JUMPSPEED;
	
	speed.x = movement.x * WALKSPEED;
	
	if speed.length() > 0:
		speed = move_and_slide(speed, Vector2.UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
