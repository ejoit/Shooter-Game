extends State
var acceleration = 500
var speed = 500
@onready var player: CharacterBody2D  = get_parent().get_parent()

func enter():
	OS.alert("succsessful change")

func physics_update(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * delta)
	
