extends CharacterBody2D
#@onready var current_state = States.GROUND

var air_speed
var gravity
var recoil_force
var test_v = 50

enum States {GROUND, AIR, WALL, RECOIL, FALL}
var state = States.GROUND
var VELOCITY_TEST = 300	


func change_state(newState):
	state = newState

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	match state:
		States.GROUND:
			ground(direction)
		States.AIR:
			air()
		States.WALL:
			wall()
		States.RECOIL:
			recoil()
		States.FALL:
			fall()
			
	move_and_slide()

func ground(direction):
	velocity.x = direction * VELOCITY_TEST
func air():
	print("Walking")

func wall():
	print("wall")

func recoil():
	print("Recoil")
	
func fall():
	pass
