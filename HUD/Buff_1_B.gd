extends Control


func _on_Buff_1_1_B_pressed():
	Global.Buff_1_1_B = true
	var _s = get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Buff_1_2_B_pressed():
	Global.Buff_1_2_B = true
	var _s = get_tree().change_scene("res://Levels/Level1.tscn")
