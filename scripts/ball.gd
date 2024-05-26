extends CharacterBody2D

const START_SPEED := 500
const ACCELERATION := 50
var dir := Vector2()
var speed := 0

func _ready():
	visible = false
	
func _physics_process(delta):
	var collision = move_and_collide(dir*speed*delta)
	if collision:
		$"../Audio/Paddle hit".play()
		var collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../CPU":
			speed += ACCELERATION
			dir = paddle_bounce_dir(collider)
		else:
			dir = dir.bounce(collision.get_normal())

func start_new_ball():
	position = get_window().size/2
	speed = START_SPEED
	dir = Vector2([-1, 1].pick_random(), randf_range(-1, 1))
	dir = dir.normalized()
	visible = true
	
func paddle_bounce_dir(collider):
	var new_dir := Vector2()
	var new_dir_y_sign := 0
	var dist := 0.0
	if dir.x < 0:
		new_dir.x = 1
	else:
		new_dir.x = -1
	dist = position.y-collider.position.y
	if dist != 0: new_dir_y_sign = dist/abs(dist)
	dist = abs(dist)
	new_dir.y = new_dir_y_sign*clampf(dist*2/collider.paddle_height, 0.3, 1.0)
	return new_dir.normalized()
	
func _on_timer_timeout():
	start_new_ball()
