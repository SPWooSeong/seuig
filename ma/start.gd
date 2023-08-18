extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var label2 = Label.new()
	
	label2.text = "시작하려면 space를 누르세요"
	label2.set_position(Vector2(150,210))
	label2.modulate = Color(0, 0, 0) 
	label2.scale = Vector2(4, 4)
	
	add_child(label2)
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://Main.tscn")
