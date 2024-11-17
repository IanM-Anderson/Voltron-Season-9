extends Node2D

var questions = []
var answerText = []
var answers = []
var questionNumber = 0
var answer = "0"
var guess = false
var won = false

func _ready() -> void:
	var data = load_from_file()
	var lines = data.strip_edges().split("\n")
	print(lines)
	
	# loop through all the questions
	for i in range(0, lines.size(), 1):
		var questionData = lines[i].strip_edges().split(",")
		questions.append(questionData[0])
		answerText.append([questionData[1], questionData[2], questionData[3], questionData[4]])
		answers.append(questionData[5])
		
	
	newQuestion()


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if answer == answers[questionNumber] and guess:
		get_node("MultiBackground").visible = false
		get_node("MultiWin").visible = true
		won = true
		
	if guess and answer != answers[questionNumber]:
		print("fail")
		get_node("Timer").start()
		guess = false
		get_node("Cover").visible = true

func load_from_file():
	var file = FileAccess.open("C:/Users/13ian/Documents/GoDot Games/voltron-season-9/GameJamTrivia.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content

func _on_a_pressed() -> void:
	answer = "1"
	guess = true
	print(answer)


func _on_b_pressed() -> void:
	answer = "4"
	guess = true
	print(answer)


func _on_c_pressed() -> void:
	answer = "3"
	guess = true
	print(answer)


func _on_d_pressed() -> void:
	answer = "2"
	guess = true
	print(answer)


func _on_timer_timeout() -> void:
	newQuestion()
	
	get_node("Cover").visible = false
	get_node("Timer").stop()
	
func newQuestion():
	# replace the question
	questionNumber = randi_range(0, questions.size() - 1)
	# update the question text
	get_node("Questions").text = questions[questionNumber]
	
	# update the question text
	get_node("A").text = answerText[questionNumber][0]
	get_node("B").text = answerText[questionNumber][1]
	get_node("C").text = answerText[questionNumber][2]
	get_node("D").text = answerText[questionNumber][3]
	print(answers[questionNumber])
	
func reset():
	get_node("MultiBackground").visible = true
	get_node("MultiWin").visible = false
	won = false
	newQuestion()
