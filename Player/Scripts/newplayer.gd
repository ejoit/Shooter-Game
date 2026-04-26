extends CharacterBody2D
class_name Player 

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	move_and_slide()
