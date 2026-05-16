extends State
@onready var player: CharacterBody2D

func  enter() -> void:
	player = state_machine.get_parent()
	var local_recoil_direction = player.global_position.direction_to(player.get_global_mouse_position())
	player.velocity = -800 * local_recoil_direction
	
func physics_update(_delta: float) -> void:

	state_machine.change_state("fall")
