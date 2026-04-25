extends CharacterBody2D
#@onready var current_state = States.GROUND

var air_speed
var GRAVITY = 1000
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
			ground(direction, delta)
		States.AIR:
			air(direction, delta)
		States.WALL:
			wall(direction)
		States.RECOIL:
			recoil(direction)
		States.FALL:
			fall(direction)
			
	move_and_slide()

func ground(direction, delta):
	velocity.x = direction * VELOCITY_TEST
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -400
		change_state(States.AIR)
		
		if Input.is_action_just_pressed("fire"):
			change_state(States.RECOIL)
	
	if not is_on_floor():
		change_state(States.AIR)
	
	
	if is_on_wall_only():
		pass
func air(direction, delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		change_state(States.GROUND)
	
	
	
func wall(direction):
	print("wall")

func recoil(direction):
	print("Recoil")
	
func fall(direction):
	pass
