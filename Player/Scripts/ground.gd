extends State
@onready var player: CharacterBody2D 


func enter() -> void:
	player = state_machine.get_parent()
	
func physics_update(_delta: float) -> void:
	pass
