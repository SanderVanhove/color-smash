extends Node2D


func _ready() -> void:
	var random_color = Color(randf(), randf(), randf())
	modulate = random_color
	$AnimationPlayer.play("Rotate")
	$Particles2D.emitting = true
