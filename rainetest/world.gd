extends Sprite2D

var speed = 400
var angular_speed = PI

	
func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)

func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		rotation -= angular_speed * delta
	if Input.is_action_pressed("ui_right"):
		rotation += angular_speed * delta
	
	
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.UP.rotated(rotation) * -speed
		
	position += velocity * delta


func _on_button_pressed() -> void:
	set_process(not is_processing())
	
func _on_timer_timeout():
	visible = not visible
