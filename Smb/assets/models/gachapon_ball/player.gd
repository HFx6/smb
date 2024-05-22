extends RigidBody3D

# Exported variables for easy adjustments in the editor
var acceleration: float = 10.0
var max_speed: float = 20.0
var mouse_sensitivity: float = 0.2

var velocity: Vector3 = Vector3.ZERO

func _ready():
	# Hide the cursor during gameplay
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		# Rotate the spring arm based on mouse movement
		$SpringArm3D.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		$SpringArm3D.rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity))
		# Clamp the camera's vertical rotation
		$SpringArm3D.rotation.x = clamp($SpringArm3D.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta):
	var direction: Vector3 = Vector3.ZERO

	# Get input from WASD keys
	if Input.is_action_pressed('forward'):
		direction -= transform.basis.z
	if Input.is_action_pressed('backwards'):
		direction += transform.basis.z
	if Input.is_action_pressed('left'):
		direction -= transform.basis.x
	if Input.is_action_pressed('right'):
		direction += transform.basis.x

	# Normalize the direction and apply acceleration
	direction = direction.normalized()
	velocity += direction * acceleration * delta
	velocity = velocity.limit_length(max_speed)

	# Apply the velocity to the rigid body
	linear_velocity = velocity

	# Reset the velocity if no input is given
	if direction == Vector3.ZERO:
		velocity = Vector3.ZERO

# Don't forget to define the input actions in the project settings
