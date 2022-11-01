extends Area2D
var score = 15

func _ready():
	pass
	
func _on_Dbuff_body_entered(body):
	if body.name == "Player":
		if body.has_method("dbuff"):
			body.dbuff(5)
		Global.increase_score(score)
		Global.items_collected += 1
		queue_free()
