extends Node2D


# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if get_node("MultiChoice").won == true:
		print("Trivia Win")
	if get_node("ButtonGame").won == true:
		print("Button Win")
	if get_node("OddOneOut").won == true:
		print("Odd Win")
	if get_node("UniqueWords").won == true:
		print("Unique Win")
		get_node("UniqueWords").reset()
	if get_node("Waldo").won == true:
		print("Waldo Found")
		get_node("Waldo").reset()
