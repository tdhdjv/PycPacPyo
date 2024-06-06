extends "res://scripts/states/game_states.gd"

@onready var player_score = $"Play/UI Hud/Player Score"
@onready var cpu_score = $"Play/UI Hud/CPU Score"
@onready var timer = $Play/Timer

var score = [0, 0]

func _ready():
	next_scene_path = "res://scenes/win_screen.tscn"
	
func _process(delta):
	#print('c')
	pass
func _on_cpu_goal_body_entered(body):
	_on_goal()
	score[0] += 1
	player_score.text = str(score[0])
	if score[0] >= level_data['score objective']:
		emit_signal("change_scene", next_scene_path)
	

func _on_player_goal_body_entered(body):
	_on_goal()
	score[1] += 1
	cpu_score.text = str(score[1])
	if score[1] >= level_data['score objective']:
		emit_signal("change_scene", next_scene_path)
	
func _on_goal():
	timer.start()
	$Play/Audio/Score.play()
	
