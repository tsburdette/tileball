extends Node3D

var is_moving = false
signal mouse_down()
signal mouse_over()
var state
var state_factory

# Called when the node enters the scene tree for the first time.
func _ready():
	state_factory = StateFactory.new()
	change_state("idle")
	print(get_children())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	var left_click = event is InputEventMouseButton && event.button_index == 1 && event.pressed
	if (left_click):
		change_state('moving')
#	if (state.class_name && event is InputEventMouseMotion):
#		mouse_over.emit()
#	elif ():
#		if _state == States.IDLE:
#			_state = States.MOVING
#			become_selected(true)
#		elif _state == States.MOVING:
#			_state = States.IDLE
#			become_selected(false)
#		else:
#			print('Ah, some fuckery')

func become_selected(yes: bool):
	var new_color = Color(1, 0, 0, 1) if yes else Color(0, 1, 0, 1)
	$CharacterMesh.get_active_material(0).albedo_color = new_color

func change_state(new_state_name):
	if state != null:
		state.queue_free()
		print(get_children())
	state = state_factory.get_state(new_state_name).new()
	state.name = "current_state"
	add_child(state)
