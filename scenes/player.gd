extends CharacterBody3D

@export_group("Movement")
@export var move_speed = 20.0
@export var turn_speed = 12.0

func _physics_process(delta: float) -> void:
	var horizontal_axis = Input.get_axis("move_forward", "move_backwards") 
	var vertical_axis = Input.get_axis("down", "up")
	var turn_axis = Input.get_axis("turn_left", "turn_right")
	var forward = global_basis.z
	
	rotation_degrees.y -= turn_axis * turn_speed * delta
	
	velocity = forward * horizontal_axis * move_speed * delta
	velocity.y = vertical_axis * move_speed * delta
	
	move_and_slide()
