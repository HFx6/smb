extends Sprite2D

var duration = 1.0


func _ready():
	self.modulate.a = 0
	

func _on_goal_reached():
	var tween: Tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, duration)

func _process(delta):
	pass
