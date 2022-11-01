extends Control


func _on_Buff_2_2_K_pressed():
	Global.Buff_2_2_K = true
	var _s = get_tree().change_scene("res://Levels/Level3.tscn")


func _on_Buff_2_1_K_pressed():
	Global.Buff_2_1_K = true
	var _s = get_tree().change_scene("res://Levels/Level3.tscn")
