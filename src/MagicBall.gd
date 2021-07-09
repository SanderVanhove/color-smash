extends RigidBody2D

var hue
var saturation
var value

var random_value = 0


func _ready() -> void:
	sleeping = true
	randomize()

	hue = randf()
	saturation = rand_range(.4, 1)
	value = rand_range(.4, 1)

	random_value = 0#int(rand_range(0, 3))

	#gravity_scale = rand_range(-.5, .5)

	bounce = 1

	calc_color()


func calc_color():
	if random_value == 0:
		$Sprite.modulate = Color.from_hsv(position.y / get_viewport().size.y, saturation, value)
	elif random_value == 1:
		$Sprite.modulate = Color.from_hsv(hue, position.y / get_viewport().size.y, value)
	elif random_value == 2:
		$Sprite.modulate = Color.from_hsv(hue, saturation, position.y / get_viewport().size.y)


func _process(delta: float) -> void:
	calc_color()


func activate(force):
	sleeping = false
	apply_central_impulse(force)
