extends Node2D


var TowerScene: PackedScene = preload("res://Tower.tscn")


func _ready() -> void:
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_NEVER)


func _input(event: InputEvent) -> void:
	if not event as InputEventMouseButton or not event.is_pressed():
		return

	var tower = TowerScene.instance()
	tower.position = event.position
	add_child(tower)
