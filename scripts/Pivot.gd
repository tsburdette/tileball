extends Node3D

var is_animating = false
var start_rotation = Quaternion(transform.basis)
var current_rotation = start_rotation
var target_rotation = current_rotation
var animation_duration = 0.5
var animation_time_remaining = animation_duration

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_animating:
		if Input.is_action_just_pressed("camera_right"):
			start_animation(0.5 * PI)
		elif Input.is_action_just_pressed("camera_left"):
			start_animation(-0.5 * PI)
	elif animation_time_remaining > 0:
		animate_rotation(delta)
	else:
		end_animation()

func start_animation(rotation_amount: float) -> void:
	self.is_animating = true
	target_rotation = current_rotation * Quaternion(Vector3(0, 1, 0), rotation_amount)

func animate_rotation(delta: float) -> void:
	animation_time_remaining -= delta
	current_rotation = start_rotation.slerp(target_rotation, 1-(max(animation_time_remaining/animation_duration, 0)))
	transform.basis = Basis(current_rotation)
	
func end_animation() -> void:
	self.is_animating = false
	start_rotation = Quaternion(current_rotation)
	target_rotation = Quaternion(current_rotation)
	animation_time_remaining = animation_duration
