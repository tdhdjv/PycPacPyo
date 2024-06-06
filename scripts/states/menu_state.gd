extends "res://scripts/states/game_states.gd"

@onready var text_edit = $CanvasLayer/TextEdit

func _on_button_pressed():
	var score_objective
	if text_edit.text:
		score_objective = text_edit.text
	else:
		score_objective = text_edit.placeholder_text
	level_data['score objective'] = int(score_objective)
	emit_signal("change_scene", next_scene_path)
