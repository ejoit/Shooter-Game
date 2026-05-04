extends State

@onready var player: CharacterBody2D
var GRAVITY = 1800

func enter() -> void:
	player = state_machine.get_parent()
	player.velocity.x = 0
	player.can_wall_slide = true
	player.wall_timer_started = false

func physics_update(_delta: float) -> void:
	print("idle")
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		state_machine.change_state("move")
	
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("jump")
	
	if not player.is_on_floor():
		state_machine.change_state("fall")
	


	
	player.move_and_slide()
