extends KinematicBody2D

export var constraint_left = Vector2(0,0)
export var constraint_right = Vector2(100,0)
export var speed = 8
var dmg = 25
var health = 545
var defense = 35
var score = 150


func _physics_process(_delta):
	if not $Tween.is_active():
		var constraint = constraint_right
		$Sprite.flip_h = true
		if position != constraint_left:
			constraint = constraint_left
			$Sprite.flip_h = false
		$Tween.interpolate_property(self, "position", position, constraint, speed, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(dmg)


func hp(d):
	d -= defense
	if d <= 0:
		d = 1
	health -= d
	if health <= 0:
		Global.increase_kill(1)
		Global.Boss_Killed = true
		Global.increase_score(score)
		queue_free()	
