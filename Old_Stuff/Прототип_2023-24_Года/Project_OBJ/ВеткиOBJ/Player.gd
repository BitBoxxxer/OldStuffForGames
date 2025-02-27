extends CharacterBody2D

const JUMP_STREIGHT := -2.0

var speed := 100
var gravity := Vector2.DOWN * 1.3
var jump_velocity := 0.0

@onready var animated_sprite := $AnimatedSprite2D

func _physics_process(_delta: float):
	var move_direction = gravity
	
	if Input.is_action_pressed("ui_left"):
		move_direction.x = -1
		animated_sprite.flip_h = true
		
	elif Input.is_action_pressed("ui_right"):
		move_direction.x = 1
		animated_sprite.flip_h = false
		
	if Input.is_action_just_pressed("ui_up"):
		jump_velocity = JUMP_STREIGHT
		
	if jump_velocity < 0.0:
		jump_velocity += gravity.y * _delta * 4
		move_direction.y = jump_velocity

	_play_move_animation(move_direction)
	set_velocity(move_direction * speed)
	set_up_direction(Vector2.UP)
	move_and_slide()

func _play_move_animation(move_direction: Vector2):
	if move_direction == gravity and is_on_floor():
		animated_sprite.play("Odle")
	elif move_direction.x != 0 and is_on_floor():
		animated_sprite.play("Running")
	elif move_direction.y <= 0:
		animated_sprite.play ("Wallking")
		
