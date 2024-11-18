extends Node2D

var allWords = []
var doneWords = []
var newWords = []
var oldWords = []
var options = []

var oldrad1 = 0
var oldrad2 = 0
var oldrad3 = 0
var oldrad4 = 0

var answers = []
var input = 1

var guess = false
var won = false

func _ready() -> void:
	var data = load_from_file()
	var lines = data.strip_edges().split("\n")
	
	# loop through all the word list
	for i in range(0, lines.size(), 1):
		allWords.append(lines[i].strip_edges().split(","))
	
	newQuestion()
	


 #Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if input in answers and guess:
		get_node("MultiBackground").visible = false
		get_node("MultiWin").visible = true
		
		doneWords.append(options[input-1])
		print(doneWords)
		guess = false
		won = true
		
	if guess and !(input in answers):
		print("fail")
		get_node("Timer").start()
		guess = false
		get_node("Cover").visible = true

func load_from_file():
	var file = FileAccess.open("GameJamRandomWords.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
#
func _on_a_pressed() -> void:
	input = 1
	guess = true


func _on_b_pressed() -> void:
	input = 4
	guess = true


func _on_c_pressed() -> void:
	input = 3
	guess = true


func _on_d_pressed() -> void:
	input = 2
	guess = true
#
#
func _on_timer_timeout() -> void:
	
	reset()
	
	get_node("Cover").visible = false
	get_node("Timer").stop()

func newQuestion():
	# pick random values in the word list
	var rad1 = randi_range(0, allWords.size() - 1)
	var rad2 = randi_range(0, allWords.size() - 1)
	var rad3 = randi_range(0, allWords.size() - 1)
	var rad4 = randi_range(0, allWords.size() - 1)
	
	while rad2 == rad1 or rad2 == rad3 or rad2 == rad4:
		rad2 = randi_range(0, allWords.size() - 1)
	while rad3 == rad1 or rad3 == rad2 or rad3 == rad4:
		rad3 = randi_range(0, allWords.size() - 1)
	while rad4 == rad1 or rad4 == rad3 or rad4 == rad2:
		rad4 = randi_range(0, allWords.size() - 1)
		
	if doneWords.size() >= 1:
		oldrad1 = randi_range(0, doneWords.size() - 1)
	if doneWords.size() >= 2:
		oldrad2 = randi_range(0, doneWords.size() - 1)
		while oldrad2 == oldrad1:
			oldrad2 = randi_range(0, doneWords.size() - 1)
	if doneWords.size() >= 3:
		oldrad3 = randi_range(0, doneWords.size() - 1)
		while oldrad3 == oldrad1 or oldrad3 == oldrad2:
			oldrad3 = randi_range(0, doneWords.size() - 1)
	if doneWords.size() >= 4:
		oldrad4 = randi_range(0, doneWords.size() - 1)
		while oldrad4 == oldrad1 or oldrad4 == oldrad2 or oldrad4 == oldrad3:
			oldrad4 = randi_range(0, doneWords.size() - 1)
	
	
	if doneWords.size() == 0:
		newWords = [allWords[rad1], allWords[rad2], allWords[rad3], allWords[rad4]]
		options = newWords
		answers = [1, 2, 3, 4]
	if doneWords.size() == 1:
		newWords = [allWords[rad1], allWords[rad2], allWords[rad3]]
		oldWords = [doneWords[oldrad1]]
		var pos = randi_range(0, 3)
		
		for i in range(0, 4, 1):
			if i == pos:
				options.append(oldWords[0])
			if i > pos:
				options.append(newWords[i-1])
				answers.append(i+1)
			if i < pos:
				options.append(newWords[i])
				answers.append(i+1)
		
	if doneWords.size() == 2:
		newWords = [allWords[rad1], allWords[rad2]]
		oldWords = [doneWords[oldrad1], doneWords[oldrad2]]
		
		options.append(newWords[0])
		options.append(oldWords[0])
		options.append(newWords[1])
		options.append(oldWords[1])
		
		answers = [1, 3]
		
	if doneWords.size() >=3:
		newWords = [allWords[rad1]]
		oldWords = [doneWords[oldrad1], doneWords[oldrad2], doneWords[oldrad3]]
		
		var pos = randi_range(0, 3)
		
		for i in range(0, 4, 1):
			if i == pos:
				options.append(newWords[0])
			if i > pos:
				options.append(oldWords[i-1])
			if i < pos:
				options.append(oldWords[i])

		answers = [pos + 1]
	print(options)
	print(answers)
	
	
	# update the question text
	get_node("Questions").text = "Pick a new word:"
	#upadte the option text:
	get_node("A").text = options[0][0]
	get_node("B").text = options[1][0]
	get_node("C").text = options[2][0]
	get_node("D").text = options[3][0]

func reset():
	get_node("MultiBackground").visible = true
	get_node("MultiWin").visible = false
	options.clear()
	newWords.clear()
	oldWords.clear()
	answers.clear()
	won = false
	newQuestion()
