extends Area2D


func _ready():
	pass


func _on_Abuff_body_entered(body):
	if body.name == "Player":
		if body.has_method("abuff"):
			body.abuff(5)
		queue_free()
