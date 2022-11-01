extends Control


func _on_Buff_4_1_K_pressed():
	Global.Buff_4_1_K = true
	var _s = get_tree().change_scene("res://Levels/Boss_Level.tscn")


func _on_Buff_4_2_K_pressed():
	Global.Buff_4_2_K = true
	var _s = get_tree().change_scene("res://Levels/Boss_Level.tscn")
