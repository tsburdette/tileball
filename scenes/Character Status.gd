extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_static_body_3d_mouse_exited():
	text = ''


func _on_character_mouse_over():
	text = 'Jakerb!'
