extends Label

@export var bananas : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(bananas).pad_zeros(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_banana_collected():
	bananas+=1
	text = str(bananas).pad_zeros(3)
