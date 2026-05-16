extends State

var acceleration = 8000
var speed = 250
@onready var player: CharacterBody2D 
var GRAVITY = 1000

func enter() -> void:
	player = state_machine.get_parent()

	player.velocity.y = 0
	print("CHANGED TO WALL")
	
func physics_update(delta: float) -> void:
	player.velocity.y = clamp(player.velocity.y, -800, 20)

	player.velocity.x = move_toward(player.velocity.x, player.direction * speed, acceleration * delta)
	player.velocity.y += 50 * delta


	
	if player.wall_timer_started == false:
		player.wall_timer_started = true
		$"../../Timers/on_wall".start()
	if player.is_on_floor() and player.velocity.y >= 0:
		state_machine.change_state("move")
	if not player.is_on_wall():
		state_machine.change_state("fall")
	if Input.is_action_just_pressed("jump") and player.can_wall_jump == true:
		player.can_wall_jump = false
		state_machine.change_state("wall_jump")
		return
	if Input.is_action_just_pressed("fire") and player.can_wall_shoot == true:
		player.can_wall_shoot = false
		state_machine.change_state("recoil")
func exit() -> void:
		player.can_wall_slide = false	
func _on_on_wall_timeout() -> void:

	state_machine.change_state("fall")
