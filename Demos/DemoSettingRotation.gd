extends Node

export (int) var target_switch_speed = 200
export (NodePath) var target

var count = -1
var targets = [Vector2(0,0), Vector2(90,0), Vector2(180,0), Vector2(-90,0)]
var current_target = 0

func _ready():
	target = get_node(target)
	
func _process(delta):

	count += 1
	if count % target_switch_speed == 0:
		current_target +=1
		if current_target > targets.size() - 1:
			current_target = 0
		target.set_rotation_to(targets[current_target])
		print("Set Rotation")
