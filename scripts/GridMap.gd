extends GridMap

signal tile_hover(grid_location)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_mouse_interactor_mouse_over_grid(intersect_dict):
	var floor_pos = intersect_dict["position"]
	var grid_coords = local_to_map(floor_pos)
	tile_hover.emit(map_to_local(grid_coords))
