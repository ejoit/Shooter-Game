extends Node

class_name StateMachine

@export var test: State
var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	#states[idle] = # add idle node here
	print("placeholder")
	
	# shit from yt tuttorial i dont understand yet
	# i think it gets children and adds them to the dic
	#for child in get_children():
		#if child is State:
			#states[child.name.to_lower()] = child
			#child.state_machine = self
	
