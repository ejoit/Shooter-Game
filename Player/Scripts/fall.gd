extends State
@onready var player: CharacterBody2D 
var GRAVITY = 1800
var speed = 320
var acceleration = 1000
var friction = 10

func enter() -> void:
	player = state_machine.get_parent()

# Called when the node enters the scene tree for the first time.



func physics_update(delta: float) -> void:
	print("fall")
	player.velocity.y += GRAVITY * delta
	if player.direction != 0:
		player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * delta)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, friction * delta)
	if player.is_on_floor() and player.velocity.x != 0:
		state_machine.change_state("move")
		return
	elif player.is_on_floor() and player.velocity.x == 0:
		state_machine.change_state("idle")
		return	
	elif player.is_on_wall() and player.can_wall_slide == true:
			state_machine.change_state("wall" )
	elif player.is_on_wall() and player.can_wall_slide == false:
		if Input.is_action_just_pressed("jump") and player.can_wall_jump == true:
			state_machine.change_state("wall_jump")
			return
		if Input.is_action_just_pressed("fire") and player.can_wall_shoot == true:
			player.can_wall_shoot = false
			state_machine.change_state("recoil")
	
	if Input.is_action_just_pressed("fire") and player.can_shoot == true:
		player.can_shoot = false
		state_machine.change_state("recoil")
		
	if Input.is_action_just_pressed("jump") and not player.CoyoteTimer.is_stopped():
		player.CoyoteTimer.stop()
		player.coyote_time_activated = true
		state_machine.change_state("jump" )
