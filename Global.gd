extends Node

var score = 0
var health = 5
var level = 0
var timer = 0
var player = null
var Player = null
var playnum = 0
var playh = 0
var end = false

var coin = 0
var kill = 0

var Buff_1_1_B = false
var Buff_1_2_B = false
var Buff_1_1_A = false
var Buff_1_2_A = false
var Buff_1_1_K = false
var Buff_1_2_K = false



func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func increase_score(s):
	score += s
	
func increase_coin(s):
	coin += s

func increase_kill(s):
	kill += s

func _physics_process(_delta):
	if health <=0 and end == false:
		end = true
		var _scene = get_tree().change_scene("res://HUD/End_Screen.tscn")
