extends Node

enum States {GROUND, AIR, WALL, RECOIL}
var state = States.GROUND

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

func ground():
	print("ground")
	if Input.is_action_just_pressed("ui_left"):
		change_state(States.AIR)

func air():
	print("Walking")

func wall():
	print("wall")

func recoil():
	print("Recoil")
