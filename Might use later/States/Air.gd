extends State

class_name AirState

var GRAVITY = 800
# Called when the node enters the scene tree for the first time.
func enter():

	print("air")

func handle_input(event: InputEvent):
	if player.is_on_floor():
		state_machine.change_state("GroundState")

func physics_update(delta: float):
	player.velocity.y += GRAVITY * delta
#push from phone
#I can edit but not run
