extends State

@onready var player: CharacterBody2D 
var jump_force = -500

func enter() -> void:
	player = state_machine.get_parent()
	player.velocity.y = jump_force

func physics_update(_delta: float) -> void:
	print("jump")
	if not player.is_on_floor() or not player.is_on_wall_only():
		state_machine.change_state("fall")

	if player.is_on_wall_only():
		state_machine.change_state("wall")
