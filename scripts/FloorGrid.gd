extends GridMap

signal floor_grid_hover(map_position)
signal floor_grid_click(map_position)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_floor_body_input_event(camera, event, position, normal, shape_idx):
	# sometimes the intersection can happen just past the collider
	position.y = max(position.y, 0)
	var grid_position = local_to_map(position)
	var grid_to_world_pos = map_to_local(grid_position)
	if (event is InputEventMouseMotion):
		floor_grid_hover.emit(grid_to_world_pos)
	elif (event is InputEventMouseButton):
		floor_grid_click.emit(grid_to_world_pos)
