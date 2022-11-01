extends Control


func _ready():
	pass


func _on_Player1_pressed():
	Global.playnum = 1
	Global.Player = load("res://Player/Player.tscn")
	var _scene = get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Player2_pressed():
	Global.playnum = 2
	Global.Player = load("res://Player/Player2.tscn")
	var _scene = get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Player3_pressed():
	Global.playnum = 3
	Global.Player = load("res://Player/Player3.tscn")
	var _scene = get_tree().change_scene("res://Levels/Level1.tscn")
