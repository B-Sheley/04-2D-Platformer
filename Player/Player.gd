extends KinematicBody2D

onready var SM = $StateMachine

var health = 80
var defense = 15
var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1
var isAttacking = false
var damage = 25
var rage = 5
var live1 = false
var live1_use = false
var hdmg = false
var hdmg_use = false

export var gravity = Vector2(0,30)

export var move_speed = 20
export var max_move = 220

export var jump_speed = 140
export var max_jump = 600

export var leap_speed = 140
export var max_leap = 600

var moving = false
var is_jumping = false
var double_jumped = false
var should_direction_flip = true # wether or not player controls (left/right) can flip the player sprite


func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-max_move,max_move)
		
	if should_direction_flip:
		if direction < 0 and not $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = true
		if direction > 0 and $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = false
	
	if is_on_floor():
		double_jumped = false
		set_wall_raycasts(true)
		
	if Input.is_action_pressed("attack"):
		$AnimatedSprite.play("Attacking")
		$AudioStreamPlayer2D.play()
		isAttacking = true
		
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite.play("Attacking")
		isAttacking = true
		if direction == 1:
			$AttackArea/CollisionShape2D.disabled = false
		if direction == -1:
			$AttackAreaR/CollisionShape2D.disabled = false
	
	Global.playh = health
	
	if rage != Global.health:
		if Global.Buff_1_1_B == true:
			defense += 7.5
		if Global.Buff_1_2_B == true:
			health += 7.5
		if Global.Buff_2_1_B == true:
			live1 = true
		if Global.Buff_2_2_B == true:
			move_speed += 6
			jump_speed += 6
			leap_speed += 6
		if Global.Buff_3_2_B == true:
			damage += 20
			rage -= 1
		else:
			damage += 10
			rage -= 1
		
		if Global.Buff_3_1_B == true and health <= (health/2):
			hdmg = true
		else:
			hdmg = false
			hdmg_use = false
		
		if hdmg == true and hdmg_use == false:
			damage += 15
			hdmg_use = true
			
			


func is_moving():
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return true
	return false

func move_vector():
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),1.0)

func _unhandled_input(event):
	if event.is_action_pressed("left"):
		direction = -1
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
	if event.is_action_pressed("right"):
		direction = 1
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
	if event.is_action_pressed("jump"):
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func is_on_floor():
	var fl = $Floor.get_children()
	for f in fl:
		if f.is_colliding():
			return true
	return false

func is_on_right_wall():
	if $Wall/Right.is_colliding():
		return true
	return false

func is_on_left_wall():
	if $Wall/Right.is_colliding():
		return true
	return false

func get_right_collider():
	return $Wall/Right.get_collider()

func get_left_collider():
	return $Wall/Left.get_collider()
	
func set_wall_raycasts(is_enabled):
	$Wall/Left.enabled = is_enabled
	$Wall/Right.enabled = is_enabled

func do_damage(d):
	d -= defense
	if d <= 0:
		d = 1
	health -= d
	if health <= (health/2) and Global.Buff_4_1_B == true:
		health += 3
	if Global.Buff_4_2_B == true:
		damage += 3
	if health <= 0:
		if live1 == true and live1_use == false:
			health = 1
			live1_use = true
		else: 
			Global.health -= 1
			Global.player = null
			queue_free()

func heal(h):
	health += h

func abuff(a):
	damage += a

func dbuff(d):
	defense += d
	


func die():
	print(health)
	Global.player = null
	queue_free()


func _on_AnimatedSprite_animation_finished():
	if "Attack" in $AnimatedSprite.get_animation():
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
		$AnimatedSprite.play("Idle")
		isAttacking = false
	else: 
		$AttackArea/CollisionShape2D.disabled = true
		$AttackAreaR/CollisionShape2D.disabled = true
		$AnimatedSprite.play("Idle")
		isAttacking = false
		

	


func _on_AttackArea_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)
		
			


func _on_AttackAreaR_body_entered(body):
	if body.has_method("hp"):
		body.hp(damage)

	
