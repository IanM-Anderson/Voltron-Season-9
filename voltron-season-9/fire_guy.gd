extends Node2D

var fail = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fail = get_node("Guy").fail
