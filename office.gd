extends Node3D

var door1 = false
var door2 = false

var door1_moving = false
var door2_moving = false

var power_usage = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$timers.connect("hour_changed", update_time)
	$Camera3D/Label.text = "12 pm"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	camera_control(delta)
	door_control()
	
	print(power_usage)

func camera_control(delta):
	if Input.is_action_pressed("left_arrow_key"):
		$Camera3D.rotation[1] += 3 * delta
	
	if Input.is_action_pressed("right_arrow_key"):
		$Camera3D.rotation[1] += -3 * delta
	
	if Input.is_action_pressed("up_arrow_key") and $Camera3D.rotation[0] < 1:
		$Camera3D.rotation[0] += 3 * delta
	
	if Input.is_action_pressed("down_arrow_key") and $Camera3D.rotation[0] > -1:
		$Camera3D.rotation[0] += -3 * delta

func door_control():
	if Input.is_action_just_pressed("door1"):
		if door1 == true:
			# $Office/Door1.position[0] += 10 # Door
			door1 = false
			door1_moving = true
			power_usage += 1
		elif door1 == false:
			# $Office/Door1.position[0] -= 10 # Door
			door1 = true
			door1_moving = true
			power_usage -= 1
	
	if Input.is_action_just_pressed("door2"):
		if door2 == true:
			# $Office/Door2.position[0] += 10 # Door
			door2 = false
			door2_moving = true
			power_usage += 1
		elif door2 == false:
			# $Office/Door2.position[0] -= 10 # Door
			door2 = true
			door2_moving = true
			power_usage -= 1
	
	if door1_moving:
		if door1:
			$Office/Door1.position[0] += 0.1
		if !door1:
			$Office/Door1.position[0] -= 0.1
	
	if door2_moving:
		if door2:
			$Office/Door2.position[0] += 0.1
		if !door2:
			$Office/Door2.position[0] -= 0.1
	
	if door1_moving and $Office/Door1.position[0] < 3.829:
		door1_moving = false
	
	if door1_moving and $Office/Door1.position[0] > 13.829:
		door1_moving = false
	
	if door2_moving and $Office/Door2.position[0] < 3.829:
		door2_moving = false
	
	if door2_moving and $Office/Door2.position[0] > 13.829:
		door2_moving = false

func update_time():
	if $timers.hours == 12:
		$Camera3D/Label.text = str($timers.hours) + " pm"
	else:
		$Camera3D/Label.text = str($timers.hours) + " am"
