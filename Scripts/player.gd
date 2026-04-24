extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
enum  States {IDLE, WALKING, SHOOTING}
var state = States.IDLE

func _physics_process(delta: float) -> void:
	match state:
		States.IDLE:
			idle()
		States.WALKING:
			walking()
		States.SHOOTING:
			shooting()
	
	
	move_and_slide()

func change_state(newState):
	state = newState

func idle():
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		change_state(States.WALKING)
		print(state)	
func walking():
	pass
func shooting():
	pass
