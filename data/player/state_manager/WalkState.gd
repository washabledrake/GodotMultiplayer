extends BaseState

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func input(event) -> BaseState:
	return null

func process(delta: float) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:

	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y -= player.gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		player.velocity.y = player.JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
	player.move_and_slide()
	
	return null
