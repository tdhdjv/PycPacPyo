extends CharacterBody2D

@onready var color_rect = $ColorRect

const SPEED := 500
var y_move := 0
var window_height := 0
var paddle_height := 0

func _ready():
	window_height = get_window().size.y
	paddle_height = color_rect.get_size().y

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		y_move = -SPEED
	elif Input.is_action_pressed("ui_down"):
		y_move = SPEED
	else:
		y_move = 0
	position.y += y_move*delta
	position.y = clampf(position.y, paddle_height/2, window_height-paddle_height/2)
