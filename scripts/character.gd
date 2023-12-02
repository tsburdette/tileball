extends Node3D

enum States {IDLE, MOVING}

var _state : int = States.IDLE
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
	if (_state != States.MOVING && event is InputEventMouseMotion):
		mouse_over.emit()
	elif (event is InputEventMouseButton && event.button_index == 1 && event.pressed):
		if _state == States.IDLE:
			_state = States.MOVING
			become_selected(true)
		elif _state == States.MOVING:
			_state = States.IDLE
			become_selected(false)
		else:
			print('Ah, some fuckery')

func become_selected(yes: bool):
	var new_color = Color(1, 0, 0, 1) if yes else Color(0, 1, 0, 1)
	$Cube.get_active_material(0).albedo_color = new_color
