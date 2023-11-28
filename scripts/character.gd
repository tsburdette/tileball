extends Node3D

var is_moving = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_interactor_mouse_down(intersect_dict):
	is_moving = true
	print("Character selected!")
