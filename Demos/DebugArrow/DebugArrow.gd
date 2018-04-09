extends MeshInstance

var active = false

func _process(delta):
	if !active:
		hide()
	else:
		show()
	
func debug_vector(target_location, vector_up = Vector3(1,0,0)):
	active = true
	var dir_to_target = (global_transform.origin - target_location).normalized()
	if global_transform.origin == target_location:
		hide()
		active = false
		print("Warning in " +str(name)+ ": Target location is location of DebugArrow")
	elif dir_to_target != vector_up and -dir_to_target != vector_up:
			look_at(target_location, vector_up)
	else:
		rotation = Vector3(deg2rad(-90),0,0) if dir_to_target.y > 0 else Vector3(deg2rad(90),0,0)
	
func debug_basis(basis):
	active = true
	global_transform.basis = basis