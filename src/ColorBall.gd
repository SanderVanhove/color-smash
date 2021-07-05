extends RigidBody2D


func _ready() -> void:
	sleeping = true
	randomize()
	var random_color = Color(randf(), randf(), randf())
	$Sprite.modulate = random_color.darkened(.1)
	$Particles2D.modulate = random_color
	bounce = 1


func _on_ColorBall_body_entered(body: Node) -> void:
	$Particles2D.emitting = true


func activate(force):
	sleeping = false
	apply_central_impulse(force)
