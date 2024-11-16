extends CharacterBody2D

const SPEED = 300.0
var moveable = false


func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0

	if Input.is_action_pressed("ui_left") and moveable:
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_right") and moveable:
		velocity.x = SPEED
	if Input.is_action_pressed("ui_up") and moveable:
		velocity.y = -SPEED
	if Input.is_action_pressed("ui_down") and moveable:
		velocity.y = SPEED

	move_and_slide()


func _on_button_pressed() -> void:
	moveable = not moveable
