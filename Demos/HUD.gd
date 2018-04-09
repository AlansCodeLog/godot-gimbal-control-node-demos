extends CanvasLayer

func _ready():
	$"Control".hide()

func _on_first_person_entered(distance):
	$"Control".show()
	print("Entered first person at distance:" + str(distance))
	
func _on_first_person_exited(distance):
	$"Control".hide()
	print("Exited first person at distance:" + str(distance))