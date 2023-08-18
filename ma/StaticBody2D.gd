extends StaticBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += Vector2(-200,0)*delta


func _on_detect_body_entered(body):
	pass # Replace with function body.
