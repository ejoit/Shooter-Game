extends CharacterBody2D
class_name Player 

var direction := 0
var can_wall_slide = true
var wall_timer_started = false

func _process(delta: float) -> void:
	rotation_degrees = wrap(rotation_degrees, 0, 360)

func _physics_process(delta: float) -> void:
	
	direction = Input.get_axis("ui_left", "ui_right")
	print("can wall slide=", can_wall_slide) 
	



	
	move_and_slide()
	
	
	
