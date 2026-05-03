extends CharacterBody2D
class_name Player 

var direction := 0

func _physics_process(delta: float) -> void:
	
	direction = Input.get_axis("ui_left", "ui_right")
	move_and_slide()

	
