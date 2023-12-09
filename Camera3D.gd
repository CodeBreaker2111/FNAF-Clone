extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var translation = Vector3(0, 0, 0)

var movement = true
var can_move_again = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation = Vector3(0, 0, 0)
	
	if Input.is_action_pressed("w") and movement:
		translation.z = -4 * delta
	if Input.is_action_pressed("s") and movement:
		translation.z = 4 * delta
	if Input.is_action_pressed("a") and movement:
		translation.x = -4 * delta
	if Input.is_action_pressed("d") and movement:
		translation.x = 4 * delta
	
	if Input.is_action_just_pressed("w") and can_move_again:
		movement = true
	if Input.is_action_just_pressed("s") and can_move_again:
		movement = true
	if Input.is_action_just_pressed("a") and can_move_again:
		movement = true
	if Input.is_action_just_pressed("d") and can_move_again:
		movement = true
	
	if Input.is_action_just_pressed("z"):   # Return to chair
		position[0] = 2.078
		position[2] = -2.655
	
	position[1] = 3.669  # Keep camera from moving in y axis
	
	if !movement and !can_move_again: # Simulating when an area is in hitbox
		translate(-translation * 2)
	
	translate(translation)


func _hit_area3d(area):
	translate(-translation * 2)
	movement = false


func _exited_area3d(area):
	can_move_again = true
