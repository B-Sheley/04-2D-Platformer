extends Control


func _on_Buff_4_1_B_pressed():
	Global.Buff_4_1_B = true
	var _s = get_tree().change_scene("res://Levels/Boss_Level.tscn")


func _on_Buff_4_2_B_pressed():
	Global.Buff_4_2_B = true
	var _s = get_tree().change_scene("res://Levels/Boss_Level.tscn")
