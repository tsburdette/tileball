extends Node

class_name State

var change_state
var character_node
var persistent_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup(change_state, character_node, persistent_state):
	self.change_state = change_state
	self.character_node = character_node
	self.persistent_state = persistent_state
