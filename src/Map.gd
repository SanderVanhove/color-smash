extends Node2D

var BallClass = preload("res://ColorBall.tscn")


var _current_ball


func _ready() -> void:
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_NEVER)


func _input(event: InputEvent) -> void:
	if not event as InputEventMouseButton:
		return

	event = event as InputEventMouseButton

	if event.is_pressed():
		_current_ball = BallClass.instance()
		_current_ball.position = event.position
		add_child(_current_ball)
	else:
		_current_ball.activate(-(event.position - _current_ball.position) * 2)
