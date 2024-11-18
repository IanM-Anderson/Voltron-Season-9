#Main
extends MarginContainer

var level = 1
var timer = 0
#var score = 0
var game_started = false

func _ready() -> void:
	$MainMenu.show()
	$GUI.hide()
	$GUI/GameOver.hide()
	
	$GUI/Screen/ButtonGame.hide()
	$GUI/Screen/UniqueWords.hide()
	$GUI/Screen/MathQuestions.hide()
	$GUI/Screen/TrashGameScreen.hide()
	$GUI/Screen/TrashSpawn.hide()
	$GUI/Screen/OddOneOut.hide()
	$GUI/Screen/SpotTheDifference.hide()
	$GUI/Screen/Trivia.hide()
	$GUI/Screen/Waldo.hide()
	$GUI/Screen/SongQuiz.hide()
	
func _process(delta: float) -> void:
	timer = $GUI/Screen/Time.time_left
	$GUI/Screen/LevelLabel.text = "Level " + str(level)
	$GUI/Screen/TimeLabel.text = "Timer: " + str(int(timer))
	#$GUI/Screen/ScoreLabel.text = "Score: " + str(score)
	
	if (game_started):
		load_levels()
	
func _on_start_button_pressed() -> void:
	game_started = true
	$MainMenu.hide()
	$GUI.show()
	$GUI/Screen/ButtonGame.show()
	$GUI/GameOver.hide()
	
	$GUI/Screen/Time.start()
	$GUI/Screen/LevelTimer.start()
	load_levels()

func _on_time_timeout() -> void:
	game_over()

func load_levels():
	if (level == 1 and $GUI/Screen/ButtonGame.won):
		next_level()
	elif (level == 2 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won):
		next_level()
	elif (level == 3 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won and $GUI/Screen/MathQuestions.won):
		next_level()
	elif (level == 4 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won and $GUI/Screen/MathQuestions.won and $GUI/Screen/OddOneOut.won):
		next_level()
	elif (level == 5 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won and $GUI/Screen/MathQuestions.won and $GUI/Screen/OddOneOut.won and $GUI/Screen/SpotTheDifference.won):
		next_level()
	elif (level == 6 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won and $GUI/Screen/MathQuestions.won and $GUI/Screen/OddOneOut.won and $GUI/Screen/SpotTheDifference.won and $GUI/Screen/Trivia.won):
		next_level()
	elif (level == 7 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won and $GUI/Screen/MathQuestions.won and $GUI/Screen/OddOneOut.won and $GUI/Screen/SpotTheDifference.won and $GUI/Screen/Trivia.won and $GUI/Screen/Waldo.won):
		next_level() 
	elif (level == 8 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won and $GUI/Screen/MathQuestions.won and $GUI/Screen/OddOneOut.won and $GUI/Screen/SpotTheDifference.won and $GUI/Screen/Trivia.won and $GUI/Screen/Waldo.won and $GUI/Screen/TrashGameScreen.won):
		next_level() 
	elif (level >= 9 and $GUI/Screen/ButtonGame.won and $GUI/Screen/UniqueWords.won and $GUI/Screen/MathQuestions.won and $GUI/Screen/OddOneOut.won and $GUI/Screen/SpotTheDifference.won and $GUI/Screen/Trivia.won and $GUI/Screen/Waldo.won and $GUI/Screen/TrashGameScreen.won and $GUI/Screen/SongQuiz.won):
		next_level() 
	
func next_level():
	level += 1
	$GUI/Screen/Time.stop()
	$GUI/Screen/LevelTimer.emit_signal("timeout")

func reset_timer():
	$GUI/Screen/Time.start()
	timer = $GUI/Screen/Time.time_left
	
func game_over():
	$GUI/Screen.hide()
	$GUI/GameOver.show()
	
	$GUI/GameOver/Message.text = "You couldn't handle the pressure\nYou only reached level " + str(level)

func _on_level_timer_timeout() -> void:
	$GUI/Screen/DelayTimer.start()

func _on_delay_timer_timeout() -> void:
	$GUI/Screen/DelayTimer.stop()
	
	if (level == 2):
		$GUI/Screen/UniqueWords.show()
	elif (level == 3):
		$GUI/Screen/MathQuestions.show()
	elif (level == 4):
		$GUI/Screen/OddOneOut.show()
	elif (level == 5):
		$GUI/Screen/SpotTheDifference.show()
	elif (level == 6):
		$GUI/Screen/Trivia.show()
	elif (level == 7):
		$GUI/Screen/Waldo.show()
	elif (level == 8):
		$GUI/Screen/TrashGameScreen.show()
		$GUI/Screen/TrashSpawn.show()
	elif (level == 9):
		$GUI/Screen/Waldo.reset()
		$GUI/Screen/SongQuiz.show()
	elif (level >= 10):
		$GUI/Screen/Time.wait_time = $GUI/Screen/Time.wait_time - 5
	
	$GUI/Screen/ButtonGame.reset()
	$GUI/Screen/UniqueWords.reset()
	$GUI/Screen/MathQuestions.load_question()
	$GUI/Screen/TrashGameScreen.reset()
	$GUI/Screen/TrashSpawn.reset()
	$GUI/Screen/OddOneOut.reset()
	$GUI/Screen/SpotTheDifference.reset()
	$GUI/Screen/Trivia.reset()
	#$GUI/Screen/Waldo.reset()
	$GUI/Screen/SongQuiz.reset()
	
	$GUI/Screen/Time.start()
	$GUI/Screen/LevelTimer.start()
