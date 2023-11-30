extends Node3D

signal mouse_over_grid(intersect_dict)
signal mouse_down(intersect_dict)
signal clear_cursor()

const RAY_LENGTH = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var intersect_dict = check_for_mouseover()
	if len(intersect_dict) > 0 && intersect_dict["normal"] == Vector3(0, 1, 0):
		print(intersect_dict["collider"].name)
		mouse_over_grid.emit(intersect_dict)
	if Input.is_action_just_pressed("left_click"):
		mouse_down.emit(intersect_dict)
	clear_cursor.emit()

func check_for_mouseover():
	var camera = get_viewport().get_camera_3d()
	var mouse_position = get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_position)
	var to = from + camera.project_ray_normal(mouse_position) * RAY_LENGTH
	var query = PhysicsRayQueryParameters3D.create(from, to)
	return camera.get_world_3d().direct_space_state.intersect_ray(query)
