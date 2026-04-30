extends Node3D


@export var rotation_speed = 0.5;
@export var rotation_axis = Vector3.UP;


func _process(delta: float) -> void:
	rotate_object_local(rotation_axis.normalized(), delta * rotation_speed)
