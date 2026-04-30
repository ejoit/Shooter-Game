extends CharacterBody2D
class_name Player 

@onready var machine = $StateMachine

func _ready() -> void:
	for State in machine.get_children():
		State.player = self
		State.machine = machine
	
