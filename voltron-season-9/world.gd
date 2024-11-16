extends Node2D

var questions = ["1", "2", "3", "4", "5", "6"]
var answerText = [["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"]]
var answers = [1, 2, 3, 4, 1, 2]


# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if get_node("MultiChoice").won == true:
		print("Multi Win")
	if get_node("ButtonGame").won == true:
		print("Button Win")
