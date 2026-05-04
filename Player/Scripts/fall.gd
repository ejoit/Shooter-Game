extends State
@onready var player: CharacterBody2D 
var GRAVITY = 1800

var speed = 280
var acceleration = 1000

func enter() -> void:
	player = state_machine.get_parent()

# Called when the node enters the scene tree for the first time.
func physics_update(_delta: float) -> void:
	print("fall")
	player.velocity.y += GRAVITY * _delta
	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * _delta)
	if player.is_on_floor():
		state_machine.change_state("idle")
	if player.is_on_floor() and player.velocity.y >= 0:
		state_machine.change_state("move")
	if player.is_on_wall():
		state_machine.change_state("wall")
