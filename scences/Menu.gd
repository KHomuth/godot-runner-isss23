extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scences/MainScene.tscn")

func _on_highscore_pressed():
	get_tree().change_scene_to_file("res://scences/highscore.tscn")
