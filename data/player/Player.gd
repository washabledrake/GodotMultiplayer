class_name Player
extends CharacterController

var head_path := NodePath("Head")

@onready var head = get_node(head_path)

func _ready() -> void:
	if not is_multiplayer_authority(): return

	state_manager.setup(self)
	head.camera.current = true
	print(name)

func _unhandled_input(event: InputEvent) -> void:
	if not is_multiplayer_authority(): return

	state_manager.input(event)
	if event is InputEventMouseMotion:
		head.move_camera(event.relative)

func _process(delta: float) -> void:
	if not is_multiplayer_authority(): return

	state_manager.process(delta)
	
func _physics_process(delta: float) -> void:
	if not is_multiplayer_authority(): return

	state_manager.physics_process(delta)
