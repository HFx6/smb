# model_in_ball.gd

extends Node3D

@onready var direction_node = $"../../CameraContainer/HRotation/VRotation/SpringArm3D/DirectionNode" as Node3D
@onready var initial_local_position = self.transform.origin
@onready var rigidbody_ball = $".."

var not_reached_goal = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not_reached_goal:
		var speed = sqrt(rigidbody_ball.linear_velocity.x**2 + rigidbody_ball.linear_velocity.y**2 + rigidbody_ball.linear_velocity.z**2)
		if speed<2:
			$AnimationPlayer.play("Idle")
		elif speed > 2 && speed < 40:
			$AnimationPlayer.play("Run")
		else:
			$AnimationPlayer.play("Sprint")
		
	var direction_to_camera = global_transform.origin.direction_to(direction_node.global_transform.origin)
	direction_to_camera.y = 0
	self.global_transform = Transform3D.IDENTITY
	self.global_transform = self.global_transform.looking_at(direction_to_camera, Vector3.UP)
	self.global_transform.origin = rigidbody_ball.global_transform.origin + initial_local_position


func _on_goal_reached():
	not_reached_goal = false
	$AnimationPlayer.play("Attack1")
