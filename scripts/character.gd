extends Node3D

var is_moving = false
signal mouse_down()
signal mouse_over()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	if (event is InputEventMouseMotion):
		mouse_over.emit()
	elif (event is InputEventMouseButton && event.button_index == 1 && event.pressed):
		print('Character selected!')
		is_moving = true
