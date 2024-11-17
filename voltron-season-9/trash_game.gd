extends Node2D

var trashIn = 0
var won = false
var wait = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if trashIn == 3:
		won = true
		get_node("Background").visible = false
		get_node("Win").visible = true


func _on_trash_can_area_entered(area: Area2D) -> void:
	# hide the trash that entered
	area.visible = false
	if !wait:
		print("We cleaned")
		trashIn += 1
		wait = true
		get_node("Timer").start()
	
		
func reset():
	won = false
	get_node("Background").visible = true
	get_node("Win").visible = false


func _on_timer_timeout() -> void:
	wait = false
	get_node("Timer").stop()
