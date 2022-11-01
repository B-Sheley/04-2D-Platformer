extends Area2D


func _ready():
	pass


func _on_Flag_body_entered(body):
	if body.name == "Player":
		Global.level += 1
		if Global.level == 1:
			if Global.playnum == 1:
				var _s = get_tree().change_scene("res://HUD/Buff_1_B.tscn")
			if Global.playnum == 2:
				var _s = get_tree().change_scene("res://HUD/Buff_1_A.tscn")
			if Global.playnum == 3:
				var _s = get_tree().change_scene("res://HUD/Buff_1_K.tscn")
		if Global.level == 2:
			if Global.playnum == 1:
				var _s = get_tree().change_scene("res://HUD/Buff_2_B.tscn")
			if Global.playnum == 2:
				var _s = get_tree().change_scene("res://HUD/Buff_2_A.tscn")
			if Global.playnum == 3:
				var _s = get_tree().change_scene("res://HUD/Buff_2_K.tscn")
		if Global.level == 3:
			if Global.playnum == 1:
				var _s = get_tree().change_scene("res://HUD/Buff_3_B.tscn")
			if Global.playnum == 2:
				var _s = get_tree().change_scene("res://HUD/Buff_3_A.tscn")
			if Global.playnum == 3:
				var _s = get_tree().change_scene("res://HUD/Buff_3_K.tscn")
		if Global.level == 4:
			if Global.playnum == 1:
				var _s = get_tree().change_scene("res://HUD/Buff_4_B.tscn")
			if Global.playnum == 2:
				var _s = get_tree().change_scene("res://HUD/Buff_4_A.tscn")
			if Global.playnum == 3:
				var _s = get_tree().change_scene("res://HUD/Buff_4_K.tscn")
		if Global.level == 5 and Global.Boss_Killed == true:
			var _s = get_tree().change_scene("res://HUD/End_Screen.tscn")
			
			
			
	
	
