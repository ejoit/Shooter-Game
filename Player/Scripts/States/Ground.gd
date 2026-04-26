extends State

class_name GroundState
var GRAVITY = 1000
func enter():
	pass
	
func physics_update(delta: float):
	if not player.is_on_floor():
		state_machine.change_state("airstate")
	player.velocity.y = 0
	
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		player.velocity.y = -700
		
	var direction = Input.get_axis("ui_left", "ui_right")
	player.velocity.x = direction * 200	

func handle_input(event: InputEvent):
	pass
