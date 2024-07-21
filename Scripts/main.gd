extends Node2D

# arry of customers
var customers = []

#spawn customers
func spawn_customer():
	var customer_scene = preload("res://Scenes/customer.tscn")
	var customer = customer_scene.instance()
	add_child(customer)
	customers.append(customer)
	
#customer queue handler
func process_queue():
	if customers.size() > 0:
		var current_customer = customers.pop_front()
		#TODO: current customer's order
		#How to randomize? -- Papa's pizzaria stype maybe?
		
