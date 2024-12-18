extends CharacterBody2D

# can change this to be false when we are done the game
var gameOn = true
var moveable = false
var lateralSpeed = 10
var speed = 200

var failed = false


func _physics_process(delta: float) -> void:
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and moveable:
		var vect = get_global_mouse_position() - position
		velocity = vect * speed * delta
		
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor() and !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		velocity = Vector2(lateralSpeed, 0)
	
	if gameOn:
		move_and_slide()


func _on_button_button_down() -> void:
	moveable = true


func _on_button_button_up() -> void:
	moveable = false

# Runs when guy enters fire
func _on_fire_body_entered(body: Node2D) -> void:
	visible = false
	failed = true
	
	# Rest of the code here for the fail event

func moveBack():
	velocity = Vector2(-10000, 0)
	move_and_slide()
	move_and_slide()
	move_and_slide()
	velocity = Vector2(0, 0)
	visible = true
