extends Area2D


func _ready():
	pass


func _on_Heal_body_entered(body):
	if body.name == "Player":
		if body.has_method("heal"):
			body.heal(15)
		queue_free()
