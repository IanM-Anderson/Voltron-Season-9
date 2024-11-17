extends Node2D

var characters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var sCharacters = ["!", "@", "#", "$", "%", "^", "&", "*", "-", "+"]
var different = 0
var won = false
var guess = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in range(0, sCharacters.size() - 1):
		characters.append(sCharacters[i])
	for i in range(0, 10):
		characters.append(randi_range(0,99))
		
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if won:
		get_node("Background").visible = false
		get_node("Win").visible = true
	if guess and !won:
		get_node("Timer").start()
		guess = false
		get_node("Cover").visible = true

func reset():
	won = false
	guess = false
	get_node("Cover").visible = false
	different = randi_range(0,16) + 1
	print(different)
	
	for i in range(0, 16, 1):
		if i == different - 1:
			var symbolNum = randi_range(0, characters.size() - 1)
			var symbol2Num = randi_range(0, characters.size() - 1)
			
			while symbol2Num == symbolNum:
				symbol2Num = randi_range(0, characters.size() - 1)
				
			get_node("Button" + str(i+1) + "A/RichTextLabel").text = str(characters[symbolNum])
			get_node("Button" + str(i+1) + "B/RichTextLabel").text = str(characters[symbol2Num])
		
		else:
			var symbolNum = randi_range(0, characters.size() - 1)
			get_node("Button" + str(i+1) + "A/RichTextLabel").text = str(characters[symbolNum])
			get_node("Button" + str(i+1) + "B/RichTextLabel").text = str(characters[symbolNum])


func _on_button_1a_pressed() -> void:
	if different == 1:
		won = true
	guess = true


func _on_button_2a_pressed() -> void:
	if different == 2:
		won = true
	guess = true


func _on_button_3a_pressed() -> void:
	if different == 3:
		won = true
	guess = true


func _on_button_4a_pressed() -> void:
	if different == 4:
		won = true
	guess = true


func _on_button_5a_pressed() -> void:
	if different == 5:
		won = true
	guess = true


func _on_button_6a_pressed() -> void:
	if different == 6:
		won = true
	guess = true


func _on_button_7a_pressed() -> void:
	if different == 7:
		won = true
	guess = true


func _on_button_8a_pressed() -> void:
	if different == 8:
		won = true
	guess = true


func _on_button_9a_pressed() -> void:
	if different == 9:
		won = true
	guess = true


func _on_button_10a_pressed() -> void:
	if different == 10:
		won = true
	guess = true


func _on_button_11a_pressed() -> void:
	if different == 11:
		won = true
	guess = true


func _on_button_12a_pressed() -> void:
	if different == 12:
		won = true
	guess = true


func _on_button_13a_pressed() -> void:
	if different == 13:
		won = true
	guess = true


func _on_button_14a_pressed() -> void:
	if different == 14:
		won = true
	guess = true


func _on_button_15a_pressed() -> void:
	if different == 15:
		won = true
	guess = true


func _on_button_16a_pressed() -> void:
	if different == 16:
		won = true
	guess = true
		
func _on_button_1b_pressed() -> void:
	if different == 1:
		won = true
	guess = true


func _on_button_2b_pressed() -> void:
	if different == 2:
		won = true
	guess = true


func _on_button_3b_pressed() -> void:
	if different == 3:
		won = true
	guess = true


func _on_button_4b_pressed() -> void:
	if different == 4:
		won = true
	guess = true


func _on_button_5b_pressed() -> void:
	if different == 5:
		won = true
	guess = true


func _on_button_6b_pressed() -> void:
	if different == 6:
		won = true
	guess = true


func _on_button_7b_pressed() -> void:
	if different == 7:
		won = true
	guess = true


func _on_button_8b_pressed() -> void:
	if different == 8:
		won = true
	guess = true


func _on_button_9b_pressed() -> void:
	if different == 9:
		won = true
	guess = true


func _on_button_10b_pressed() -> void:
	if different == 10:
		won = true
	guess = true


func _on_button_11b_pressed() -> void:
	if different == 11:
		won = true
	guess = true


func _on_button_12b_pressed() -> void:
	if different == 12:
		won = true
	guess = true


func _on_button_13b_pressed() -> void:
	if different == 13:
		won = true
	guess = true


func _on_button_14b_pressed() -> void:
	if different == 14:
		won = true
	guess = true


func _on_button_15b_pressed() -> void:
	if different == 15:
		won = true
	guess = true


func _on_button_16b_pressed() -> void:
	if different == 16:
		won = true
	guess = true


func _on_timer_timeout() -> void:
	print("Start")
	reset()
	get_node("Timer").stop()
