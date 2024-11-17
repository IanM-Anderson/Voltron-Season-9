extends Node2D

var groups = []
var options = []

var answer = 0
var input = 1

var guess = false
var won = false

func _ready() -> void:
	var data = load_from_file()
	var lines = data.strip_edges().split("\n")
	
	# loop through all the groups
	for i in range(0, lines.size(), 1):
		groups.append(lines[i].strip_edges().split(","))
	
	newQuestion()
	


 #Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if input == answer and guess:
		get_node("MultiBackground").visible = false
		get_node("MultiWin").visible = true
		won = true
		
	if guess and input != answer:
		print("fail")
		get_node("Timer").start()
		guess = false
		get_node("Cover").visible = true

func load_from_file():
	var file = FileAccess.open("C:/Users/13ian/Documents/GoDot Games/voltron-season-9/GameJamCategoriesFixed.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content

func _on_a_pressed() -> void:
	input = 1
	guess = true
	print(answer)


func _on_b_pressed() -> void:
	input = 4
	guess = true
	print(answer)


func _on_c_pressed() -> void:
	input = 3
	guess = true
	print(answer)


func _on_d_pressed() -> void:
	input = 2
	guess = true
	print(answer)


func _on_timer_timeout() -> void:
	
	options.clear()
	newQuestion()
	
	get_node("Cover").visible = false
	get_node("Timer").stop()

func newQuestion():
	var group1 = randi_range(0, groups.size() - 1)
	var group2 = randi_range(0, groups.size() - 1)
	var goodStart = randi_range(0, groups[group1].size() - 4)
	var bad = randi_range(0, 3)
	answer = bad + 1
	# make group 2 not group 1:
	while group2 == group1:
		group2 = randi_range(0, groups.size() - 1)
	
	# create the options array
	for i in range(0, 4, 1):
		if i == bad:
			options.append(groups[group2][randi_range(0, groups[group2].size() - 1)])
		else:
			options.append(groups[group1][i+goodStart])
	
	# update the question text
	get_node("Questions").text = "Pick the odd one out:"
	
	#upadte the option text:
	get_node("A").text = options[0]
	get_node("B").text = options[1]
	get_node("C").text = options[2]
	get_node("D").text = options[3]

func rest():
	get_node("MultiBackground").visible = true
	get_node("MultiWin").visible = false
	won = false
	newQuestion()
