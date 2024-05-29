extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if has_node("/root/Level/Map/Player"):
		set_initial_position()
	

func set_initial_position():
	var player = get_node("/root/Level/Map/Player")
	if player:
		global_transform.origin = player.global_transform.origin
	else:
		print("Player node not found")

func _on_node_added(node):
	if node.name == "Player" and node.get_path() == "/root/Level/Map/Player":
		set_initial_position()
		

func _process(delta):
	pass
