extends State

@onready var player: CharacterBody2D  = get_parent().get_parent()
var GRAVITY = 1800

func physics_update(_delta: float) -> void:
	player.velocity.y += GRAVITY * _delta
	if Input.is_action_just_pressed("ui_left"):
		state_machine.change_state("move")
	
	player.move_and_slide()
