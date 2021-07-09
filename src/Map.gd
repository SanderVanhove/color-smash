extends Node2D

var BallClass = preload("res://ColorBall.tscn")
var SwirlClass = preload("res://ColorSwirl.tscn")
var MagicClass = preload("res://MagicBall.tscn")

var _kind: int = 0
var _current_ball


func _ready() -> void:
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_NEVER)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("option1"):
		_kind = 0
	elif Input.is_action_just_pressed("option2"):
		_kind = 1
	elif Input.is_action_just_pressed("option3"):
		_kind = 2

	if not event as InputEventMouseButton:
		return

	event = event as InputEventMouseButton

	if _kind == 0:
		spawn_ball(event)
	if _kind == 1:
		spawn_swirl(event)
	if _kind == 2:
		spawn_magic(event)

func spawn_swirl(event: InputEventMouseButton):
	if not event.is_pressed():
		return

	var new_swirl = SwirlClass.instance()
	new_swirl.position = event.position
	add_child(new_swirl)


func spawn_ball(event: InputEventMouseButton):
	if event.is_pressed():
		_current_ball = BallClass.instance()
		_current_ball.position = event.position
		add_child(_current_ball)
	else:
		_current_ball.activate(-(event.position - _current_ball.position) * 2)


func spawn_magic(event: InputEventMouseButton):
	if event.is_pressed():
		_current_ball = MagicClass.instance()
		_current_ball.position = event.position
		add_child(_current_ball)
	else:
		_current_ball.activate(-(event.position - _current_ball.position) * 2)
