extends RigidBody3D

var impulse = Vector3(50, 0, 0)
var rolling_force = 40
var spring_arm
var camera

# Sensitivity of the mouse movement
var mouse_sensitivity = 0.2

# The current pitch (up/down rotation) of the camera
var pitch = 0

# The current yaw (left/right rotation) of the camera
var yaw = 0

func _ready():
	spring_arm = get_node("SpringArm3D")
	camera = get_node("SpringArm3D/Camera")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	if Input.is_action_pressed("forward"):
		angular_velocity.x -= rolling_force*delta
	elif Input.is_action_pressed("backwards"):
		angular_velocity.x += rolling_force*delta
	if Input.is_action_pressed("left"):
		angular_velocity.z += rolling_force*delta
	elif Input.is_action_pressed("right"):
		angular_velocity.z -= rolling_force*delta

	if Input.is_action_just_pressed("jump"):
		apply_impulse(Vector3(), Vector3.UP*1000)

	spring_arm.transform.basis = transform.basis

	# Capture mouse movement
	var viewport_size = Vector2(get_viewport().size.x, get_viewport().size.y)
	var mouse_delta = get_viewport().get_mouse_position() - viewport_size / 2

	# Apply mouse movement to yaw and pitch
	yaw -= mouse_delta.x * mouse_sensitivity
	pitch = clamp(pitch + mouse_delta.y * mouse_sensitivity, -70, 70)

	# Rotate the camera
	camera.rotation_degrees = Vector3(pitch, yaw, 0)

	# Reset mouse position to the center of the viewport
	get_viewport().warp_mouse(viewport_size / 2)
