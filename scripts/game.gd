extends Node2D

@onready var player_score = $"UI Hud/Player Score"
@onready var cpu_score = $"UI Hud/CPU Score"
@onready var timer = $Timer

var score = [0, 0]

func _on_cpu_goal_body_entered(body):
	print("Player Scored!!!")
	timer.start()
	$Audio/Score.play()
	score[0] += 1
	player_score.text = str(score[0])
	


func _on_player_goal_body_entered(body):
	print("CPU Scored!!!")
	timer.start()
	$Audio/Score.play()
	score[1] += 1
	cpu_score.text = str(score[1])
