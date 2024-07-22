extends Control

@onready var lab_button = $LabButton
@onready var customer_queue = $CustomerQueue
@onready var ticket_list = $TicketList


# arry of customers
var customers = []

func _ready():
	lab_button.connect("pressed", Callable(self, "_on_lab_button_pressed"))
	spawn_customers()
	
func _on_lab_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/lab.tscn")	

func create_ticket_for_customer(customer):
	var ticket_scene = preload("res://Scenes/ticket.tscn")
	var ticket = ticket_scene.instance()
	ticket.customer = customer
	return ticket
	
#spawn customers
func spawn_customers():
	pass
	#for i in range(5):
	#	var customer_scene = preload("res://Scenes/customer.tscn")
	#	var customer = customer_scene.instance()
	#	customer_queue.add_child(customer)
	#	var ticket = create_ticket_for_customer(customer)
	#	ticket_list.add_child(ticket)

#customer queue handler
func process_queue():
	if customers.size() > 0:
		var current_customer = customers.pop_front()
		#TODO: current customer's order
		#How to randomize? -- Papa's pizzaria stype maybe?
		
