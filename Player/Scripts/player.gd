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
			air(direction)
		States.WALL:
			wall(direction)
		States.RECOIL:
			recoil(direction)
		States.FALL:
			fall(direction)
			
	move_and_slide()

func ground(direction):
	velocity.x = direction * VELOCITY_TEST
	
func air(direction):
	print("Walking")

func wall(direction):
	print("wall")

func recoil(direction):
	print("Recoil")
	
func fall(direction):
	pass
