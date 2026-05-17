extends State
var acceleration = 8000
var speed = 240
@onready var player: CharacterBody2D 

func enter() -> void:
	player = state_machine.get_parent()
	player.can_wall_slide = true
	player.wall_timer_started = false

	player.can_wall_jump = true
	player.can_shoot = true
	player.can_wall_shoot = true
	
func physics_update(delta: float) -> void:
	player.can_wall_slide = true
	print("movin")
	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * delta)
	

	if not player.is_on_floor():
		state_machine.change_state("fall")
	
		
	if player.velocity.x == 0:
		state_machine.change_state("idle")
	
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jump")
	
	if Input.is_action_just_pressed("fire") and player.can_shoot == true:
		player.can_shoot = false
		state_machine.change_state("recoil")
