extends Node

export (int) var target_switch_speed = 200
export (NodePath) var target

var count = 0
var targets = ["Target1", "Target2", "Target3"]
var current_target = 0

func _ready():
	target = get_node(target)
	target.target = "../" + str(targets[current_target])
	print("Switched to Start Target")
	$"DebugArrow".debug_basis(find_node(targets[current_target], true, false).global_transform.basis)
	
func _process(delta):

	count += 1
	if count % target_switch_speed == 0:
		current_target +=1
		if current_target > targets.size() - 1:
			current_target = 0
		target.target = "../" + str(targets[current_target])
		print("Switched Target")
		$"DebugArrow".debug_basis(find_node(targets[current_target], true, false).global_transform.basis)
