class_name CharacterController
extends CharacterBody3D

var state_manager_path := NodePath("StateManager")

@onready var state_manager = get_node(state_manager_path)

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

