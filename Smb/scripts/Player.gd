extends RigidBody3D

@onready var direction_node = $"../CameraContainer/HRotation/VRotation/SpringArm3D/DirectionNode" as Node3D

var landed_and_ready = false

var audio_stream_player = AudioStreamPlayer.new()

var torque_strength: float = 10.0

func _ready():
	pass

func _physics_process(delta: float) -> void:
	var f_input = Input.get_action_raw_strength("left") - Input.get_action_raw_strength("right")
	var h_input = Input.get_action_raw_strength("backwards") - Input.get_action_raw_strength("forward")

	var direction_transform = direction_node.global_transform

	var relative_direction_z = direction_transform.basis.z.normalized()
	var relative_direction_x = direction_transform.basis.x.normalized()

	var direction_f = f_input * relative_direction_z
	var direction_h = h_input * relative_direction_x
	
	var total_direction = (direction_f + direction_h).normalized()

	var torque = total_direction * torque_strength

	apply_torque_impulse(torque)
