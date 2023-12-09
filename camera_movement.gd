extends RigidBody3D

var move_speed : float = 5.0

func _process(delta):
	var translation = Vector3(0, 0, 0)
	
	if Input.is_action_pressed("w"):
		translation.z -= move_speed * delta
	if Input.is_action_pressed("s"):
		translation.z += move_speed * delta
	if Input.is_action_pressed("a"):
		translation.x -= move_speed * delta
	if Input.is_action_pressed("d"):
		translation.x += move_speed * delta

	var result = move_and_collide(translation, false, true, true)

	if result and result.collider.is_in_group("obstacle_group"):
		translation = Vector3(0, 0, 0)  # Prevent movement into obstacles
	
	if Input.is_action_just_pressed("z"):   # Return to chair
		position[0] = 0
		position[2] = 0
		
		translation = Vector3(0, 0, 0)
	
	position[1] = 3.895  # Camera from moving in y axis
	
	translate(translation)
