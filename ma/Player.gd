extends Node2D

const GRAVITY = 800
const JUMP_FORCE = -300
const JUMP_HEIGHT = 0  # 점프 최대 높이
const GROUND_HEIGHT = 630

var velocity = Vector2.ZERO
var isJumping = false
var canmove = true
var Wall = preload("res://wall_node.tscn")


func _physics_process(delta):
	
	get_parent().get_parent().get_node("CanvasLayer/RichTextLabel").text =str(Main.score)
	if canmove == true:
		# 중력 적용
		velocity.y += GRAVITY * delta
		position += velocity * delta
		# 점프 처리
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_FORCE
			isJumping = true
		
		# 점프 최대 높이 제한
		if isJumping and velocity.y < 0 and position.y <= JUMP_HEIGHT:
			velocity.y = 0
			isJumping = false

	# 땅에 닿았을 때 프로그램 종료
		if position.y >= GROUND_HEIGHT:
			canmove = false
			get_tree().change_scene_to_file("res://end.tscn")

	
#벽 리셋, 랜덤 불러오기
func Wall_reset():
	var Wall_instant = Wall.instantiate()
	Wall_instant.position = Vector2(450, randf_range(50, 250))
	get_parent().call_deferred("add_child",Wall_instant)
#벽이 재생성구역에 닿았나?	
func _on_resetter_body_entered(body):
	body.queue_free()
	Wall_reset()

#점수
func _on_detect_area_entered(area):
	Main.score = Main.score+1


func _on_detect_body_entered(body):
	if body.name == "StaticBody2D":
		canmove = false
		get_tree().change_scene_to_file("res://end.tscn")
	
