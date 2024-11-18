extends Node2D

var won = false

func reset():
	won = false
	get_node("Background").visible = true
	get_node("Win").visible = false

func _on_button_pressed() -> void:
	won = true
	get_node("Background").visible = false
	get_node("Win").visible = true
