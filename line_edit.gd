##MathQuestions
extends LineEdit
#
#var questions = ["x+2=7", "x+4=12", "x-3=2", "x+1=21", "x-6=3", "x-11=12", "x+3=9", "x-7=7", "x-2=4", "x-1=2"]
#var answers = ["5", "8", "5", "20", "9", "23", "6", "14", "6", "3"]
#var index = -1
#var won = false
#
#func _ready() -> void:
	#index = randi() % questions.size()
	#var question = questions[index]
	#$Question.text = str("Find the value of x:\n" + question)	
#
#func _on_text_submitted(answer: String) -> void:	
	#if (answer == answers[index]):
		#won = true
		#$/GreenBG.visible = true
		##$WhiteBG.visible = false
#
##func _on_math_timer_timeout() -> void:
	##index = randi() % questions.size()
	##var question = questions[index]
	##$Question.text = str("Find the value of x:\n" + question)
	##show()
	##
	### Stop the timer so that it doesn't change the question
	##$MathTimer.stop()
	##
##func _on_text_submitted(answer: String) -> void:	
	##if (answer == answers[index]):
		##hide()
		##$MathTimer.start()
	##
	### Clears the textbox of the previous text submission
	##%Answer.clear()
