extends Node2D

var won = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pickPos()

func pickPos():
	var screenSize = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randi_range(0, screenSize.x)
	var rndY = rng.randi_range(0, screenSize.y)
	
	get_node("Sprite2D").position = Vector2(rndX, rndY)

func _on_button_pressed() -> void:
	won = true
	hide()

func reset():
	show()
	won = false
	pickPos()
