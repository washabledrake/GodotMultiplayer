class_name StateManager
extends Node

@export_node_path("Node") var starting_state

var current_state: BaseState

#Function for changing current state for new one
func change_state(new_state: BaseState) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

#Set player node for every state
func setup(player) -> void:
	for child in get_children():
		child.player = player
		
	change_state(get_node(starting_state))

#Functions that return BaseState for changing current state
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state:
		change_state(new_state)

func process(delta) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state)
	
func physics_process(delta) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)
