extends Area2D


func _ready():
	pass
	
func _on_Dbuff_body_entered(body):
	if body.name == "Player":
		if body.has_method("dbuff"):
			body.dbuff(5)
		queue_free()
