extends Control

@onready var store_button = $StoreButton

# Called when the node enters the scene tree for the first time.
func _ready():
	store_button.connect("pressed", Callable(self, "_on_store_button_pressed"))


func _on_store_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/store.tscn")
