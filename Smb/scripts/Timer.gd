extends Control

var timer: Timer
var seconds_label: Label
var milliseconds_label: Label
var seconds: float = 65.0

func _ready():
	timer = Timer.new()
	timer.one_shot = true
	timer.autostart = false
	timer.wait_time = seconds
	timer.timeout.connect(_timer_timeout)
	add_child(timer)  

	seconds_label = $Timer
	milliseconds_label = $Timerms

	timer.start()
	update_labels()

func _process(_delta):
	update_labels()


func _timer_timeout():
	print("took too long")

func update_labels():
	seconds_label.text = str(int(timer.time_left)).pad_zeros(3)  
	milliseconds_label.text = str(int((timer.time_left - int(timer.time_left)) * 100)).pad_zeros(2)  

func set_timer_text(new_seconds: String, new_milliseconds: String):
	seconds_label.text = new_seconds.pad_zeros(3)
	milliseconds_label.text = new_milliseconds.pad_zeros(2)
