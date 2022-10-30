extends Control


func _ready():
	$Lives.text = "Lives: " + str(Global.health)
	$Score.text = "Score: " + str(Global.score)
	$Coins.text = "Coins: " + str(Global.coin)
	$Kills.text = "Kills: " + str(Global.kill)


func _on_Button_pressed():
	var _scene = get_tree().change_scene("res://HUD/Start.tscn")

