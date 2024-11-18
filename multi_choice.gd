extends Node2D

var questions = ["Who", "What", "When", "Where", "Why", "How"]
var answerText = [["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"], ["a", "b", "c", "d"]]
var answers = [1, 2, 3, 4, 1, 2]
var questionNumber = 0
var answer = 0
var guess = false
var won = false

func _ready() -> void:
	questionNumber = randi_range(0, questions.size() - 1)
	# update the question text
	get_node("Questions").text = questions[questionNumber]
	
	# update the question text
	get_node("A").text = answerText[questionNumber][0]
	get_node("B").text = answerText[questionNumber][1]
	get_node("C").text = answerText[questionNumber][2]
	get_node("D").text = answerText[questionNumber][3]
	print(answers[questionNumber])

# Called every frame. 'delta' is the elapsed time since the previous frame.
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



func _on_a_pressed() -> void:
	answer = 1
	guess = true
	print(answer)


func _on_b_pressed() -> void:
	answer = 4
	guess = true
	print(answer)


func _on_c_pressed() -> void:
	answer = 3
	guess = true
	print(answer)


func _on_d_pressed() -> void:
	answer = 2
	guess = true
	print(answer)


func _on_timer_timeout() -> void:
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
	
	get_node("Cover").visible = false
	get_node("Timer").stop()
