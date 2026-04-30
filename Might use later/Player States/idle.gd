extends State
@export var jump_state: State

func process(delta):
	var dir = Input.get_axis("left", "right")
	
	
	if dir != 0:
		state_machine.change_state(state_machine.get_node("RunState"))

	if Input.is_action_just_pressed("jump"):
		state_machine.change_state(state_machine.get_node("JumpState"))
