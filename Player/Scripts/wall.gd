extends State

var acceleration = 8000
var speed = 250
@onready var player: CharacterBody2D 
var GRAVITY = 1000

func enter() -> void:
	player = state_machine.get_parent()
	if player.can_wall_slide == true:
		player.velocity.y = 0
	elif player.can_wall_slide == false:
		state_machine.change_state("fall")

func physics_update(delta: float) -> void:
	print("wall")
	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * delta)
	
	if player.can_wall_slide == true:
		player.velocity.y += 50 * delta
		
		if player.wall_timer_started == true:
			player.wall_timer_started = false
			$"../../Timers/on_wall".start()
	
	elif player.can_wall_slide == false:
		state_machine.change_state("fall")
	
	if player.is_on_floor():
		state_machine.change_state("idle")
	
	if player.is_on_floor() and player.velocity.y >= 0:
		state_machine.change_state("move")
	
	if not player.is_on_wall():
		state_machine.change_state("fall")


func _on_on_wall_timeout() -> void:
	player.can_wall_slide = false
