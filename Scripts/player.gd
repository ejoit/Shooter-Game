extends CharacterBody2D

<<<<<<< HEAD
const SPEED = 300.0
const JUMP_VELOCITY = -320.0
const ACCELERATION = 1200.0
const AIR_ACCELERATION = 580.0
const FRICTION = 1800.0
const AIR_FRICTION = 0
const GRAVITY = 1200
=======
const SPEED = 320.0
const ACCELERATION = 500.0
const AIR_ACCELERATION = 520.0
const FRICTION = 2000 # Test Friction as 2000
const AIR_FRICTION = 50
const JUMP_VELOCITY = -300.0
const GRAVITY = 1080.0
>>>>>>> a44dd58b1548f283b5c70b37a8db700cbc19e715
const FALL_GRAVITY = 1400
const SHOOT_VELCITY = -660
const WALL_SHOOT_VELOCITY = -660
const COYOTE_TIME = 0.2
var coyote_timer = 0.0
var air_shot = 0
var cooldown_ready: bool = true
var on_wall_time_ready: bool = true
var wall_timer_started = false
var can_wall_slide = true
var was_airborn: bool = false
var ground_bullet = 1
var FALL_SHOOT_VELCITY
var wall_jump = false
var wall_shot
signal shoot

func _ready() -> void:
	add_to_group("player")
	#get_node("Particles/EnterScene").emitting = true
	
func _process(delta: float) -> void:
	#var shoot_dir = get_global_mouse_position()
	rotation_degrees = wrap(rotation_degrees, 0, 360)






func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")


	
	if is_on_floor():
		coyote_timer = COYOTE_TIME
		wall_shot = true
		wall_jump = true
		if air_shot < 0:
			air_shot = 0
		if air_shot == 0:
			pass
		can_wall_slide = true
		$Timers/on_wall.stop()
	else:
		coyote_timer -= delta

	if is_on_wall_only() and wall_shot == true:
		wall_shot = false
		if air_shot < 0:
			air_shot = 0
		if air_shot == 0:
			pass
			
	var recoil_Direction = global_position.direction_to(get_global_mouse_position())
	var speed_in_recoil_direction = velocity.dot(recoil_Direction)
	# Gravity
	if not is_on_floor():
		
		if velocity.y < 0:
			velocity.y += GRAVITY * delta
		else:
			velocity.y += GRAVITY * 1.8 * delta


	
		
	if Input.is_action_just_released("ui_accept") and is_on_floor():
		velocity.y += JUMP_VELOCITY / 3
	
		
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	# Jumpb
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or (is_on_wall() and wall_jump == true) or coyote_timer >=0) :
		wall_jump = false
		velocity.y += JUMP_VELOCITY
		coyote_timer = 0
		
	if Input.is_action_just_pressed("fire") and air_shot >= 0 and cooldown_ready == true:
		get_node("Gun-1/ShootFlash").local_coords = true
		get_node("Gun-1/ShootFlash").restart()
		get_node("Gun-1/ShootFlash").emitting = true


		
		if velocity.y > 0:
			velocity.y = 0		
		
		if is_on_floor() or is_on_wall_only():		
			velocity += SHOOT_VELCITY * recoil_Direction
		elif not is_on_floor() or not is_on_wall():
			velocity += (WALL_SHOOT_VELOCITY) * recoil_Direction
		
		cooldown_ready = false
		$Timers/CoolDown.start()
		shoot.emit()
		air_shot = air_shot - 1
		$PlayerSoundEffects/Shoot_Sound_Test.play()
		
	# Horizontal movement
	if direction != 0:
		var accel = ACCELERATION if is_on_floor() else AIR_ACCELERATION
		velocity.x = move_toward(velocity.x, direction * SPEED, accel * delta)
	else:
		var friction = FRICTION if is_on_floor() else AIR_FRICTION
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	velocity.x = clamp(velocity.x, -600, 600)
	velocity.y = clamp(velocity.y, -680, 680)
	move_and_slide()
	
	if is_on_wall() and can_wall_slide == true:
		if wall_timer_started == false:
			$Timers/on_wall.start()
			wall_timer_started = true
		velocity.y = clamp(velocity.y, -800, 20)
	if  is_on_floor(): 
		can_wall_slide = true
		wall_timer_started = false
		on_wall_time_ready = true
		
func _on_shoot() -> void:
	pass # Replace with function body.

func _on_cool_down_timeout() -> void:
		cooldown_ready = true

func _on_on_wall_timeout() -> void:
	can_wall_slide = false
