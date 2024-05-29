extends RigidBody3D

@export var movement_speed : float = 300
@export var max_velocity : float = 500

@onready var direction_node = $"../CameraContainer/HRotation/VRotation/SpringArm3D/DirectionNode" as Node3D

func _physics_process(delta):
	limit_velocity()
	movement(delta)
	pass
	
func limit_velocity():
	if linear_velocity.length() > max_velocity:
		linear_velocity = linear_velocity.normalized() * max_velocity

func movement(delta):
	var f_input = Input.get_action_raw_strength("backwards") - Input.get_action_raw_strength("forward")
	var h_input = Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left")
	
	
	var direction_transform = direction_node.global_transform
	
	var relative_direction_z = direction_transform.basis.z.normalized()
	var relative_direction_x = direction_transform.basis.x.normalized()
	
	var direction_f = f_input * relative_direction_z
	var direction_h = h_input * relative_direction_x
	apply_central_force((direction_f + direction_h) * movement_speed * delta)
	pass
