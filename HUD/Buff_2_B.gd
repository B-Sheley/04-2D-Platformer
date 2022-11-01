extends Control


func _on_Buff_2_1_B_pressed():
	Global.Buff_2_1_B = true
	var _s = get_tree().change_scene("res://Levels/Level3.tscn")


func _on_Buff_2_2_B_pressed():
	Global.Buff_2_2_B = true
	var _s = get_tree().change_scene("res://Levels/Level3.tscn")
