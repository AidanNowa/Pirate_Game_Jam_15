extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initial_pos: Vector2
var initial_scale: Vector2 = scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("left_click"):
			initial_pos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("left_click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("left_click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				body_ref.occupied = true
			else:
				tween.tween_property(self, "global_position", initial_pos, 0.2).set_ease(Tween.EASE_OUT)
				if body_ref:
					body_ref.occupied = false
			draggable = false
			
func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		scale = initial_scale * 1.05

#func _on_area_2d_mouse_entered():
#	scale = initial_scale * 1.05
#	if Input.is_action_pressed("left_click"):
#		draggable = true
#		Global.is_dragging = true
#		initial_pos = global_position
#		offset = get_global_mouse_position() - global_position
		
		
func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = initial_scale
	
func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		if not body.occupied:
			is_inside_dropable = true
			body.modulate = Color(Color.SEASHELL, 1)
			body_ref = body
			

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable') and body == body_ref:
		is_inside_dropable = false
		body.modulate = Color(Color.SEASHELL, 0.7)
		body.occupied = false
		body_ref = null

