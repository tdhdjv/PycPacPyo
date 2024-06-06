extends "res://scripts/states/game_states.gd"

@onready var label = $CanvasLayer/Label
@onready var canvas_layer = $CanvasLayer

func _ready():
	next_scene_path = "res://scenes/main_menu.tscn"
	
func display_win(winner: String):
	canvas_layer.visible = true
	label.text = winner + " WINS!!!"
	
func _on_button_pressed():
	emit_signal("change_scene", next_scene_path)
