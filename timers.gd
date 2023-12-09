extends Node

var hours = 12
signal hour_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	$Night_timer.start(90)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_night_timer_timeout():
	if hours == 12:
		hours = 1
		$Night_timer.start(90)
	elif hours < 6:
		hours += 1
		$Night_timer.start(90)
	elif hours >= 6:
		pass
	
	emit_signal("hour_changed")
