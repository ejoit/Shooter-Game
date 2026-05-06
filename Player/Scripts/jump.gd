extends State

@onready var player: CharacterBody2D 
var jump_force = -500

func enter() -> void:
	player = state_machine.get_parent()
	player.velocity.y = jump_force 


func physics_update(_delta: float) -> void:
	print("jump")
	if not player.is_on_floor():
		state_machine.change_state("fall")
		return
	elif  player.is_on_floor() and !player.velocity.x == 0:
		state_machine.change_state("move")
		return		

func exit() -> void:
	player.can_wall_slide = true
	player.wall_timer_started = false
