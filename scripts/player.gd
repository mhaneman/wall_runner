extends CharacterBody2D

const SPEED = 300.0

func _ready():
	velocity.x = -SPEED

func _physics_process(_delta):
	if is_on_wall():
		if Input.is_action_just_pressed("right"):
			velocity.x = SPEED
		if Input.is_action_just_pressed("left"):
			velocity.x = -SPEED
	move_and_slide()
