extends Node

const SAVE_FILE_PATH = "user://savedata.save"

var score = 0
var highscore = []

func load_highscore():
	var file = FileAccess.open(SAVE_FILE_PATH,FileAccess.READ)
	if(file):
		highscore = file.get_var()
		return highscore
	else:
		highscore = []
		return highscore

func _ready():
	print(load_highscore())

