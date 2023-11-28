extends Node3D

var is_visible = false
var tween = create_tween()
const BOUNCE_MAGNITUDE = 0.5
const BOUNCE_VECTOR = Vector3(0, BOUNCE_MAGNITUDE, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_floor_grid_tile_hover(grid_location):
	visible = true
	position = grid_location
	print(grid_location)

func _on_mouse_interactor_mouse_down(intersect_dict):
	if tween:
		tween.kill()
	tween = create_tween().bind_node(self).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "position", position + BOUNCE_VECTOR, 0.1)

func _on_mouse_interactor_clear_cursor():
	visible = false
	position = Vector3(0, 0, 0)
