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
var items_collected = 0
var Boss_Killed = false

var coin = 0
var kill = 0

var Buff_1_1_B = false
var Buff_1_2_B = false
var Buff_1_1_A = false
var Buff_1_2_A = false
var Buff_1_1_K = false
var Buff_1_2_K = false

var Buff_2_1_B = false
var Buff_2_2_B = false
var Buff_2_1_A = false
var Buff_2_2_A = false
var Buff_2_1_K = false
var Buff_2_2_K = false

var Buff_3_1_B = false
var Buff_3_2_B = false
var Buff_3_1_A = false
var Buff_3_2_A = false
var Buff_3_1_K = false
var Buff_3_2_K = false

var Buff_4_1_B = false
var Buff_4_2_B = false
var Buff_4_1_A = false
var Buff_4_2_A = false
var Buff_4_1_K = false
var Buff_4_2_K = false

func reset():
	score = 0
	health = 5
	level = 0
	timer = 0
	player = null
	Player = null
	playnum = 0
	playh = 0
	end = false
	items_collected = 0
	Boss_Killed = false
	coin = 0
	kill = 0
	Buff_1_1_B = false
	Buff_1_2_B = false
	Buff_1_1_A = false
	Buff_1_2_A = false
	Buff_1_1_K = false
	Buff_1_2_K = false
	Buff_2_1_B = false
	Buff_2_2_B = false
	Buff_2_1_A = false
	Buff_2_2_A = false
	Buff_2_1_K = false
	Buff_2_2_K = false
	Buff_3_1_B = false
	Buff_3_2_B = false
	Buff_3_1_A = false
	Buff_3_2_A = false
	Buff_3_1_K = false
	Buff_3_2_K = false
	Buff_4_1_B = false
	Buff_4_2_B = false
	Buff_4_1_A = false
	Buff_4_2_A = false
	Buff_4_1_K = false
	Buff_4_2_K = false

	

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
