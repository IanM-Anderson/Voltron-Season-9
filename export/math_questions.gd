#MathQuestions
extends Node2D

var questions = ["x+2=7","x+4=12","x-3=2","x+1=21","x-6=3","x-11=12","x+3=9","x-7=7","x-2=4","x-1=2","2x+1=7","2x+3=11","2x+4=6","2x+11=21","2x+6=12","2x-1=1","2x-3=7","2x-6=2","2x-11=9","2x-4=2","3x+1=16","3x+4=7","3x+6=12","3x+10=28","3x-4=8","3x-1=5","3x-7=8","3x-3=3","3x-5=4","4x+1=9","4x+5=11","4x-3=1","4x-6=6","4x-5=3","5x+5=15","5x-3=7","5x-20=30","5x-15=15","6x-4=8","6x+7=13","6x-2=16","7x+3=10","7x-3=11","7x-29=20","7x-7=70","8x+4=20","8x-6=2","8x-10=30","9x+3=12","9x-5=31","11x-12=21","3x+3=3","7x+12=12","5x+1=1","6x=42","8x=32","7x=56","8x=56","7x=42","6x=36","3x=24","6x=54","9x=63","x-4=13","x-6=12","x-1=3","x-11=21","x-18=12","x-37=23","5x=60","2x-4=6","3x+1=13","6x+3=9","2x-9=7","x-4=7","x-5=8","4-3x=1","5-x=2","10-x=3","11-x=6","7-2x=1","15-3x=0","12-3x=6","17-2x=3","14-2x=6","12-7x=5","65-10x=15","40-5x=25","40-10x=10","15-x=6","2x+3=3x+1","4x+5=5x+1","4x+6=3x+7","9x+2=8x+7","4x+3=2x+9","3x+2=5x-4","7x-1=3x+3","6x-5=2-x","3x+4=3x+4","7x=91"]
var answers = [5,8,5,20,9,23,6,14,6,3,3,4,1,5,3,1,5,4,10,3,5,1,2,6,4,2,5,2,3,2,4,1,3,2,2,2,10,6,2,1,3,1,2,7,11,2,1,5,1,4,3,0,0,0,7,4,8,7,7,6,8,9,7,17,18,4,32,30,60,12,5,4,1,8,11,13,1,3,7,5,3,5,2,7,4,1,5,3,3,9,2,4,1,5,3,3,1,1,0,13]
var index = -1
var won = false

func _ready() -> void:
	load_question()

func load_question():
	$GreenBG.visible = false
	$WhiteBG.visible = true
	won = false
	
	index = randi() % questions.size()
	var question = questions[index]
	$Answer/Question.text = str("Find the value of x:\n" + question)	
	
func _on_answer_text_submitted(answer: String) -> void:	
	if (int(answer) == answers[index]):
		won = true
		$GreenBG.visible = true
		$WhiteBG.visible = false

#func _on_math_timer_timeout() -> void:
	#index = randi() % questions.size()
	#var question = questions[index]
	#$Question.text = str("Find the value of x:\n" + question)
	#show()
	#
	## Stop the timer so that it doesn't change the question
	#$MathTimer.stop()
	#
#func _on_text_submitted(answer: String) -> void:	
	#if (answer == answers[index]):
		#hide()
		#$MathTimer.start()
	#
	## Clears the textbox of the previous text submission
	#%Answer.clear()
