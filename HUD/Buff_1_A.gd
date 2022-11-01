extends Control


func _on_Buff_1_1_A_pressed():
	Global.Buff_1_1_A = true
	var _s = get_tree().change_scene("res://Levels/Level2.tscn")


func _on_Buff_1_2_A_pressed():
	Global.Buff_1_2_A = true
	var _s = get_tree().change_scene("res://Levels/Level2.tscn")
