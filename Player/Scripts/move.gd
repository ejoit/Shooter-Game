extends State
var acceleration = 8000
var speed = 500
@onready var player: CharacterBody2D 

func enter() -> void:
	player = state_machine.get_parent()
	player.can_wall_slide = true
	player.wall_timer_started = false

func physics_update(delta: float) -> void:
	print("movin")
	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * delta)
	if player.is_on_floor():
		player.can_wall_slide = true
	if not player.is_on_floor():
		state_machine.change_state("fall")
	if player.is_on_wall():
		pass
		
	if player.velocity.x == 0:
		state_machine.change_state("idle")
	
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("jump")
