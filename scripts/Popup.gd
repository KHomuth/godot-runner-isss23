extends Popup


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_character_body_2d_game_over():
	get_tree().paused = true
	$MarginContainer/Label.set_horizontal_alignment(1)
	$MarginContainer/Label.set_text('GAME OVER \nYour Score: ' + str(Global.score))
	$MarginContainer.add_theme_constant_override("margin_top", 75)
	$MarginContainer2.add_theme_constant_override("margin_bottom", 0)
	$MarginContainer3.add_theme_constant_override("margin_top", 0)
	$MarginContainer3.add_theme_constant_override("margin_bottom", 75)
	get_node("../CanvasLayer").show()
	popup_centered(Vector2i(300, 250))


func _on_button_pressed():
	hide()
	get_node("../CanvasLayer").hide()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
