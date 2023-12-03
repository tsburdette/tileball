extends GridMap

const RAY_LENGTH = 1000.0
signal floor_grid_hover(map_position)
signal floor_grid_click(map_position)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	# sometimes the intersection can happen just past the collider
	position.y = round(position.y)
	var grid_position = local_to_map(position)
	var grid_to_world_pos = map_to_local(grid_position)
	if (event is InputEventMouseMotion):
		floor_grid_hover.emit(grid_to_world_pos)
	elif (event is InputEventMouseButton):
		floor_grid_click.emit(grid_to_world_pos)


func check_for_mouseover():
	var camera = get_viewport().get_camera_3d()
	var mouse_position = get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_position)
	var to = from + camera.project_ray_normal(mouse_position) * RAY_LENGTH
	var query = PhysicsRayQueryParameters3D.create(from, to)
	return camera.get_world_3d().direct_space_state.intersect_ray(query)
