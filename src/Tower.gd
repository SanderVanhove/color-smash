extends Sprite


onready var _tween: Tween = $Tween


func _ready() -> void:
	print(global_position.y)
	modulate = modulate.darkened(range_lerp(global_position.y, 200, 500, .5, 0))
	var time: float = rand_range(2, 3)
	scale *= rand_range(.7, 1.1)
	_tween.interpolate_property(self, "position:y", position.y, position.y - rand_range(200, 600), time)
#	_tween.interpolate_property(self, "rotation", rotation, rand_range(PI, TAU * 4), time)
	_tween.interpolate_property(self, "scale", scale, scale * rand_range(.2, .5) * Vector2(-1 if randf() < .5 else 1, -1 if randf() < .5 else 1), time)
	_tween.start()
