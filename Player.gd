extends KinematicBody2D
class_name Player

export (int) var speed = 100
export (int) var jump_speed = -200
export (int) var gravity = 300

var velocity = Vector2.ZERO
var hit_floor = false

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		$Sprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		$Sprite.flip_h = true

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor() and not hit_floor:
		hit_floor = true
		$HitFloorSound.play()
		
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			hit_floor = false
			velocity.y = jump_speed
			$JumpSound.play()
