extends RigidBody3D

@onready var direction_node = $"../CameraContainer/HRotation/VRotation/SpringArm3D/DirectionNode" as Node3D

# Variables for controlling the torque
var torque_strength: float = 10.0

func _physics_process(delta: float) -> void:
	# Get the raw input strength for forward, backward, left, and right actions
	var f_input = Input.get_action_raw_strength("left") - Input.get_action_raw_strength("right")
	var h_input = Input.get_action_raw_strength("backwards") - Input.get_action_raw_strength("forward")

	# Get the direction from the DirectionNode (which is based on the camera)
	var direction_transform = direction_node.global_transform

	# Get the camera's local x and z axes
	var relative_direction_z = direction_transform.basis.z.normalized()
	var relative_direction_x = direction_transform.basis.x.normalized()

	# Calculate the direction vectors based on input
	var direction_f = f_input * relative_direction_z
	var direction_h = h_input * relative_direction_x
	
	# Combine the directions to get the total direction
	var total_direction = (direction_f + direction_h).normalized()

	# Calculate the torque to be applied
	var torque = total_direction * torque_strength

	# Apply the torque for movement
	apply_torque_impulse(torque)
