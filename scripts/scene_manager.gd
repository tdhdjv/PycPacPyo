extends Node2D

@onready var current_scene = $"Main Menu"

# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene.connect('change_scene', switch_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func switch_scene(next_scene_path: String):
	var next_scene = load(next_scene_path).instantiate()
	next_scene.level_data = current_scene.level_data
	add_child(next_scene)
	next_scene.connect('change_scene', switch_scene)
	current_scene.queue_free()
	current_scene = next_scene
