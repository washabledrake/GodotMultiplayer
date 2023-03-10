class_name Head
extends Node3D

var camera_path := NodePath("Camera")
@onready var camera: Camera3D = get_node(camera_path)

var ingame_mouse_sensitivity: float
var vertical_angle_limit := 90.0
var rot := Vector3()

func _ready() -> void:
	_set_mouse_sensitivity(2.0)

func _set_mouse_sensitivity(mouse_sensitivity: float) -> void:
	ingame_mouse_sensitivity = mouse_sensitivity/1000

func move_camera(mouse_axis) -> void:
	rot.y -= mouse_axis.x * ingame_mouse_sensitivity
	rot.x = clamp(rot.x - mouse_axis.y * ingame_mouse_sensitivity, -deg_to_rad(vertical_angle_limit), deg_to_rad(vertical_angle_limit))

	get_owner().rotation.y = rot.y
	rotation.x = rot.x
