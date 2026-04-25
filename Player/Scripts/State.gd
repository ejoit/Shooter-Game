extends Node

enum States {GROUND, AIR, WALL, RECOIL, FALL}
var state = States.GROUND
var VELOCITY_TEST = 300	
var velocity = 67

func change_state(newState):
	state = newState

func _physics_process(delta: float) -> void:
	match state:
		States.GROUND:
			ground()
		States.AIR:
			air()
		States.WALL:
			wall()
		States.RECOIL:
			recoil()
		States.FALL:
			fall()

func ground():
	velocity.x = direction * VELOCITY_TEST	
func air():
	print("Walking")

func wall():
	print("wall")

func recoil():
	print("Recoil")
	
func fall():
	pass
