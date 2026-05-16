extends State

@onready var player: CharacterBody2D 
var jump_force_wall = -400

func enter() -> void:
	player = state_machine.get_parent()
	var touching_wall_slide = player.get_wall_normal()
	player = state_machine.get_parent()
	player.velocity.y = jump_force_wall
	if touching_wall_slide.x > 0:
		player.velocity.x = 240
	elif touching_wall_slide.x < 0:
		player.velocity.x = -240


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
