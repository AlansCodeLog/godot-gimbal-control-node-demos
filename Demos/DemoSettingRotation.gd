extends Node

export (int) var target_switch_speed = 200
#note that if the target moves fast enough, the interpolation will take the shortest path
#it isn't always counter clockwise
export (float, 0, 10) var target_move_speed_in_degrees = 0.5
export (bool) var move_target = true
export (bool) var rotate_same_side = true
export (NodePath) var target

var count = -1
var targets = [Vector2(0,0), Vector2(90,0), Vector2(180,0), Vector2(-90,0)]
var current_target = 0

func _ready():
	target = get_node(target)
	
func _process(delta):
	if move_target:
		$"Floor/Target".translation = Vector3(0,0,10)
		var enemy_distance = $"Floor/Target".global_transform.origin.distance_to(Vector3(0,0,0))
		$"Floor/Target".global_transform.origin = Vector3(0,0,0)
		$"Floor/Target".rotate(Vector3(0,1,0), deg2rad(target_move_speed_in_degrees))
		$"Floor/Target".translate(Vector3(0,0,enemy_distance))
	else:
		$"Floor/Target".translation = Vector3(0,0,0)
	count += 1
	if count % target_switch_speed == 0:
		if !rotate_same_side:
				current_target +=1
				if current_target > targets.size() - 1:
					current_target = 0
				target.set_rotation_to(targets[current_target])
				print("Set Rotation")
		else:
			target.set_rotation_to(targets[0])
			print("Set Rotation")