extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	value = 100

func _on_character_body_2d_hit():
	value -= 50
