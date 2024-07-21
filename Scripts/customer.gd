extends Node2D

var is_target = false

func set_as_target():
	is_target = true
	
func request_potion():
	#TODO: add logic for ordering
	pass
	
func receive_potion(potion):
	if is_target and "poison" in potion:
		#TODO: Handle agent's response
		#Have them die in store?
		pass
	else:
		#TODO: Generate reponse based on order correctness/speed
		pass
