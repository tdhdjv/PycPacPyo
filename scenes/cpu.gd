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
	var ball = $"../Ball"
	var dist:float = ball.position.y-position.y
	if dist != 0:
		var dir = dist/abs(dist)
		y_move = dir*SPEED*delta
		if abs(dist) < abs(y_move): y_move = dist
		position.y += y_move
	position.y = clampf(position.y, paddle_height/2, window_height-paddle_height/2)
