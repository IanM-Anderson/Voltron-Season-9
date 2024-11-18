extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func reset():
	get_node("Trash").pickPos()
	get_node("Trash").visible = true
	get_node("Trash2").pickPos()
	get_node("Trash2").visible = true
	get_node("Trash3").pickPos()
	get_node("Trash3").visible = true
