extends Node2D

var failed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	failed = get_node("Guy").failed

func reset():
	print("Fire Reset")
	get_node("Guy").moveBack()
