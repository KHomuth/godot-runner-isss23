extends RichTextLabel

func _ready():
	if(Global.highscore):
		text += "HIGHSCORES: \n \n"
		for i in Global.highscore.size():
			text += str(i + 1, ". " ,Global.highscore[i], "\n")
	else:
		text = 'NO HIGHSCORES'
