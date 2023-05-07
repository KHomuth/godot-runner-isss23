extends Label


func _process(delta):
	
	text = str(Global.score)


func _on_scoretimer_timeout():
	Global.score += 1
