extends State
@onready var player: CharacterBody2D 

var speed = 500
var acceleration = 500

func enter() -> void:
	player = state_machine.get_parent()
	
func physics_update(_delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * _delta)
