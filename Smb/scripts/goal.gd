extends Area3D

signal goal_reached

func _ready():
	pass

func _on_body_entered(body: RigidBody3D):
	emit_signal("goal_reached")
	print("GOAL!!!!")
	$"../AudioStreamPlayer".play()
	$"../GPUParticles3D".emitting = true
