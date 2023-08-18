extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var label = Label.new()
	var label2 = Label.new()
	var label3 = Label.new()
	
	label3.text = "다시 시작하려면 space를 누르세요"
	label3.set_position(Vector2(200,400))
	label3.modulate = Color(0, 0, 0) 
	label3.scale = Vector2(3, 3)
	
	label2.text = "score"
	label2.set_position(Vector2(500,210))
	label2.modulate = Color(0, 0, 0) 
	label2.scale = Vector2(4, 4)
	
	label.text = str(Main.score)
	label.set_position(Vector2(560,275))
	label.modulate = Color(0, 0, 0) 
	label.scale = Vector2(4, 4)
	
	add_child(label)
	add_child(label2)
	add_child(label3)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://Main.tscn")
		Main.score = 0

	
