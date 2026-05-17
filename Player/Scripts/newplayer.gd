extends CharacterBody2D
class_name Player 

signal Shoot 
var direction := 0
var can_wall_slide = true
var wall_timer_started = false
@onready var CoyoteTimer: Timer = $Timers/CoyoteTimer
var coyote_time_activated: bool = false
var can_wall_jump = false 
var recoil_direction = global_position.direction_to(get_global_mouse_position())
var can_shoot = false
var can_wall_shoot = false

func _ready() -> void:
	add_to_group("player")

func _process(delta: float) -> void:
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	var recoil_direction = global_position.direction_to(get_global_mouse_position())
	print(recoil_direction)

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("ui_left", "ui_right")
	print("can wall slide=", can_wall_slide) 
	
	if is_on_floor():
		if coyote_time_activated:
			coyote_time_activated = false
			CoyoteTimer.stop()
			
	else: 
		if not coyote_time_activated:
			CoyoteTimer.start()
			coyote_time_activated = true
			


	move_and_slide()
	
	
	
