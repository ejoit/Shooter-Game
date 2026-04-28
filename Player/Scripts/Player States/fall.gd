extends State
@export
var ground_state: State



# Called when the node enters the scene tree for the first time.
func enter() -> void:
	print("fall")
	
func exit()-> void:
	pass

func process_physics(delta: float) -> State:
	parent.velocity.y += GRAVITY * delta
	

	
	return null
