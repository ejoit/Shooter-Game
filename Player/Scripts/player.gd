extends CharacterBody2D
#@onready var current_state = States.GROUND

#showing example
var air_speed
var GRAVITY = 1000
var recoil_force
var test_v = 50
var air_shot = false
var wall_climb = false
var acceleration = 500
var friction = 1200
var recoil_timer_end = false

enum States {GROUND, AIR, WALL, RECOIL, FALL}
var state = States.GROUND

func _ready() -> void:
	add_to_group("player")
	
func _process(delta: float) -> void:
	rotation_degrees = wrap(rotation_degrees, 0, 360)

func change_state(newState):
	state = newState
	
func reset_var():
	air_shot = true
	wall_climb = true

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
			recoil(direction, delta)
		States.FALL:
			fall(direction)

	move_and_slide()
	 

func ground(direction, delta):
	reset_var()
	var speed = 300
	velocity.x = move_toward(velocity.x,direction * speed, acceleration * delta)
	velocity.y += GRAVITY * delta
	
	if direction !=0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)		

	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -400
		change_state(States.AIR)
		
	if Input.is_action_just_pressed("fire"):
		change_state(States.RECOIL)
	
	if not is_on_floor() and not is_on_wall():
		change_state(States.AIR)
	
	if is_on_wall_only():
		change_state(States.WALL)
		



func air(direction, delta):
	var speed = 280
	var GRAVITY = 12000

	velocity.y += GRAVITY * delta
	if is_on_floor():
		change_state(States.GROUND)
	
	
	
func wall(direction, delta):
	velocity.y += 25
	if not is_on_wall() and not is_on_floor():
		change_state(States.AIR)
	elif not is_on_wall() and is_on_floor_only():
		change_state(States.GROUND)
	print("wall")


func recoil(direction,delta):
	var SHOOT_VELOCITY = -800
	var speed = 1000
	var recoil_Direction = global_position.direction_to(get_global_mouse_position())
	if air_shot == true:
		$Timers/Recoil_Timer.start()
		velocity = SHOOT_VELOCITY * recoil_Direction
		air_shot = false
		
	if is_on_floor():
		change_state(States.GROUND)
		
	if recoil_timer_end == true:
		change_state(States.AIR)
		
func _on_recoil_timer_timeout() -> void:
	recoil_timer_end = true






	
func fall(directiobn):
	pass
