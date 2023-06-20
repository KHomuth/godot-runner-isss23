extends Label

func _ready():
	Global.score = 0

func _process(delta):
	
	text = str(Global.score)
	
func _on_score_timer_timeout():
	Global.score += 1

func _on_character_body_2d_game_over():
	if(Global.highscore.size() <= 9):
		Global.highscore.append(Global.score)
		Global.highscore.sort()
		Global.highscore.reverse()
		save_highscore(Global.highscore)
		print(Global.highscore)
	elif(Global.highscore.min() <= Global.score):
		Global.highscore[Global.highscore.find(Global.highscore.min())] = Global.score
		Global.highscore.sort()
		Global.highscore.reverse()
		save_highscore(Global.highscore)
		print(Global.highscore)

func save_highscore(highscores):
	var file = FileAccess.open(Global.SAVE_FILE_PATH,FileAccess.WRITE)
	file.store_var(highscores)
	file = null
