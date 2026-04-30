extends Node

var current_state

func _ready():
	# get first state automatically
	current_state = get_child(0)

	for state in get_children():
		state.player = get_parent()
		state.state_machine = self

	current_state.enter()

func change_state(new_state):
	current_state.exit()
	current_state = new_state
	current_state.enter()
