extends Area3D

@export var rot_speed = 3.0

signal banana_collected
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(rot_speed))


func _on_body_entered(body: RigidBody3D):
	$Timer.start()
	print("collect!")


func _on_timer_timeout():
	emit_signal("banana_collected")
	queue_free()
