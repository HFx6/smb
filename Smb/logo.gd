extends TextureRect

var sway_speed = 0.5
var sway_range = 5.0

var time = 0.0

func _process(delta):
	time += delta
	var angle_degrees = sin(time * sway_speed) * sway_range
	var angle_radians = deg_to_rad(angle_degrees)
	rotation = angle_radians
