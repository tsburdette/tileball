extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_floor_grid_floor_grid_hover(map_position):
	visible = true
	position = map_position


func _on_floor_body_mouse_exited():
	visible = false
