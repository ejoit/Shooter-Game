extends Node

enum  States {IDLE, WALKING, SHOOTING}

var state = States.IDLE

func _physics_process(delta: float) -> void:
	match state:
		States.IDLE:
			idle()
		States.WALKING:
			Walking()
		States.SHOOTING:
			Shooting()



func change_state(newState):
	state = newState
	
func idle():
	pass

		
func Walking():
	pass

func Shooting():
	pass
