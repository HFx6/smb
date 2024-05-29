extends Area3D

@export var rot_speed = 3.0

signal banana_collected

func _ready():
	pass 


func _process(delta):
	#var player_position = player.global_transform.origin
		#global_transform.origin = player_position + Vector3(0, move_height * (1 - (timer / move_duration)), 0)
	rotate_y(deg_to_rad(rot_speed))


func _on_body_entered(body: RigidBody3D):
	$Timer.start()
	print("collect!")


func _on_timer_timeout():
	emit_signal("banana_collected")
	queue_free()
