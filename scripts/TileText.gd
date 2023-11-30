extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_floor_grid_floor_grid_hover(map_position):
	text = str(map_position)


func _on_floor_body_mouse_exited():
	text = ''


func _on_character_mouse_over():
	text = 'Character!'
