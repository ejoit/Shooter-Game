extends State
@onready var player: CharacterBody2D 
var GRAVITY = 1800
var speed = 290
var acceleration = 1000

func enter() -> void:
	player = state_machine.get_parent()
# Called when the node enters the scene tree for the first time.



func physics_update(delta: float) -> void:
	print("fall")
	player.velocity.y += GRAVITY * delta
	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * delta)

	if player.is_on_floor() and player.velocity.x != 0:
		state_machine.change_state("move")
		return
	elif player.is_on_floor() and player.velocity.x == 0:
		state_machine.change_state("idle")
		return	
	elif player.is_on_wall():
			state_machine.change_state("wall")
