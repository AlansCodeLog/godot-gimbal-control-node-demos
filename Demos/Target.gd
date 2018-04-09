extends MeshInstance

var speed = 10
var movement = Vector3()

func _input(event):
	if Input.is_action_pressed("move_right"):
		movement.x = 1
	elif event.is_action_released("move_right"):
		movement.x = 0	
		
	if Input.is_action_pressed("move_left"):
		movement.x = -1
	elif event.is_action_released("move_left"):
		movement.x = 0
	
	if Input.is_action_pressed("move_down"):
		movement.z = 1
	elif event.is_action_released("move_down"):
		movement.z = 0
		
	if Input.is_action_pressed("move_up"):
		movement.z = -1
	elif event.is_action_released("move_up"):
		movement.z = 0
	
func _process(delta):
	
	translate(movement.normalized() * speed * delta)
		
func _on_look_left(amount):
	rotate_y(amount)
	
func _on_look_right(amount):
	rotate_y(amount)
