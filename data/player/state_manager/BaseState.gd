class_name BaseState
extends Node

var player: Player

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func input(event) -> BaseState:
	return null

func process(delta: float) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	return null
