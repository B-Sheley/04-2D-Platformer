extends KinematicBody2D

onready var ray = $RayCast2D
export var speed = 75
export var look_speed = 125
export var dmg = 15
var health = 20

func _physics_process(_delta):
	if Global.player == null:
		Global.player = get_node_or_null("/root/Game/Player_Container/Player")
	if Global.player != null:
		ray.cast_to = ray.to_local(Global.player.global_position)
		var c = ray.get_collider()
		if c:
			var velocity = ray.cast_to.normalized()*look_speed
			if c.name == "Player":
				velocity = ray.cast_to.normalized()*speed
			move_and_slide(velocity, Vector2(0,0))
		Global.player = null


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(dmg)

func hp(d):
	health -= d
	if health <= 0:
		Global.increase_kill(1)
		queue_free()
