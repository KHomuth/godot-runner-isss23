extends Label

func _ready():
	Global.score = 0

func _process(delta):
	
	text = str(Global.score)
	

func _on_score_timer_timeout():
	Global.score += 1
