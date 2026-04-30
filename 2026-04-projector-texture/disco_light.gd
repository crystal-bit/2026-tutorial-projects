extends SpotLight3D

@export var rotation_speed: float = 1.0
@export var rotate_axis = Vector3.FORWARD
@export var color_speed: float = 0.5
@export var enable_projector = true

@export var use_colored_cookie_texture = false

@onready var start_pos = position
@onready var rand_seed := randf() * 3.

var saved_projector


func _ready() -> void:
	if use_colored_cookie_texture:
		light_projector = load("res://assets/foliage_canopy_a_blur.png")
	saved_projector = light_projector


func _process(dt: float) -> void:
	var t = Time.get_ticks_msec() * 0.0001

	light_projector = null if !enable_projector else saved_projector

	rotate_object_local(rotate_axis.normalized(), dt * rotation_speed)

	var hue = fmod(t * color_speed + rand_seed, 1.0)

	light_color = Color.from_hsv(hue, 0.8, 1.0) if !use_colored_cookie_texture else Color.WHITE
