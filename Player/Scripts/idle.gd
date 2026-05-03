extends State

@onready var player: CharacterBody2D  = get_parent().get_parent()
var GRAVITY = 1800

func physics_update(_delta: float) -> void:
	player.velocity.y += GRAVITY * _delta
	if player.is_on_floor():
		state_machine.change_state("move")
	
	player.move_and_slide()
