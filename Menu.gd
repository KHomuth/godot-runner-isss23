extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scences/MainScene.tscn")


func _on_play_vs_mode_pressed():
	pass # Replace with function body.


func _on_highscore_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()

