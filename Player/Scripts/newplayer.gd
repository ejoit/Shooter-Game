extends CharacterBody2D
class_name Player 

var direction := 0
var can_wall_slide = false
var wall_timer_started = false

func _process(delta: float) -> void:
	rotation_degrees = wrap(rotation_degrees, 0, 360)

func _physics_process(delta: float) -> void:
	
	direction = Input.get_axis("ui_left", "ui_right")


	
	move_and_slide()
	
	
	
