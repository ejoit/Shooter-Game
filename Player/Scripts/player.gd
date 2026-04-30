extends CharacterBody2D
#@onready var current_state = States.GROUND

#showing example
var air_speed
var GRAVITY = 1000
var recoil_force
var test_v = 50

enum States {GROUND, AIR, WALL, RECOIL, FALL}
var state = States.GROUND

func _ready() -> void:
	add_to_group("player")

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
			wall(direction, delta)
		States.RECOIL:
			recoil(direction)
		States.FALL:
			fall(direction)
			
	if is_on_wall():
		change_state(States.WALL)
			
	move_and_slide()
	 

func ground(direction, delta):
	var speed = 300	
	velocity.x = direction * speed
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -400
		change_state(States.AIR)
		
		if Input.is_action_just_pressed("fire"):
			change_state(States.RECOIL)
	
	if not is_on_floor():
		change_state(States.AIR)
	
		
func air(direction, delta):
	var speed = 20000
	velocity.x = direction * speed
	
	velocity.y += GRAVITY * delta
	if is_on_floor():
		change_state(States.GROUND)
	
	
	
func wall(direction, delta):
	if not is_on_wall():
		change_state(States.AIR)
	
	velocity.y += 15 * delta
	


func recoil(direction):
	print("Recoil")
	
func fall(direction):
	pass
