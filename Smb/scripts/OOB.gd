extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body: RigidBody3D):
	print("fell out of worls oops")
	body.linear_velocity = Vector3(0,0,0)
	body.global_transform.origin = $"../SpawnPoint".global_transform.origin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
