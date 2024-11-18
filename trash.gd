extends Area2D

var moveable = false
var speed = 10

func _ready() -> void:
	pickPos()
	
func _process(delta: float) -> void:
	if moveable:
		var vect = get_global_mouse_position() - position
		position += vect * speed * delta


func pickPos():
	var screenSize = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randi_range(0, screenSize.x - 10)
	var rndY = rng.randi_range(0, screenSize.y - 10)
	
	position = Vector2(rndX, rndY)

func _on_button_button_down() -> void:
	moveable = true


func _on_button_button_up() -> void:
	moveable = false
