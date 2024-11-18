extends Node2D
var won = false
var moveable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	won = get_node("CharacterBody2D").won
	if won:
		get_node("Green Background").visible=true


func _on_button_pressed() -> void:
	moveable = not moveable

func reset():
	won = false
	moveable = false
	get_node("CharacterBody2D").position = Vector2(100, 600)
	get_node("Green Background").visible = false
